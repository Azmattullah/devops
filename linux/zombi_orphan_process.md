In Linux, **zombie** and **orphan** processes are traced differently because they represent distinct lifecycle states. Below is a precise, operational explanation suitable for system administration and troubleshooting.

---

## 1. Zombie Process (Defunct Process)

### What it is

A **zombie** process has finished execution but still has an entry in the process table because its **parent has not collected (waited for) its exit status**.

### How to trace zombie processes

#### Using `ps`

```bash
ps aux | awk '$8=="Z"'
```

Or more explicitly:

```bash
ps -eo pid,ppid,state,cmd | grep ' Z '
```

* `Z` = Zombie
* `PID` = Zombie process ID
* `PPID` = Parent process ID (important)

#### Using `top`

```bash
top
```

Then press:

```
Shift + z
```

Zombie processes are shown with state `Z`.

#### Using `htop` (if installed)

```bash
htop
```

* Zombie processes appear in **red**
* State column shows `Z`

---

### Identifying the root cause

A zombie **cannot be killed directly**.

Check its parent:

```bash
ps -o pid,ppid,cmd -p <zombie_pid>
```

Then inspect the parent:

```bash
ps -fp <parent_pid>
```

---

### How to clear zombie processes

* Restart or fix the **parent process**
* Or send `SIGCHLD` to parent:

```bash
kill -SIGCHLD <parent_pid>
```

If the parent is misbehaving:

```bash
kill -9 <parent_pid>
```

Once the parent exits, **`init` (PID 1)** adopts and reaps the zombie.

---

## 2. Orphan Process

### What it is

An **orphan** process is a running process whose **parent has exited**. The kernel reassigns it to **PID 1 (`systemd` or `init`)**.

Orphans are **not harmful** by default.

---

### How to trace orphan processes

#### Using `ps`

```bash
ps -eo pid,ppid,cmd | awk '$2==1'
```

This lists all processes adopted by PID 1.

#### Filter for user processes only

```bash
ps -eo pid,ppid,user,cmd | awk '$2==1 && $3!="root"'
```

---

### Tracing original parent (advanced)

To identify where the orphan came from:

```bash
pstree -p
```

Look for processes reparented under:

```
systemd(1)
```

---

## 3. Key Differences (Quick Reference)

| Aspect                 | Zombie                | Orphan  |
| ---------------------- | --------------------- | ------- |
| Process state          | `Z` (Defunct)         | Running |
| CPU/Memory usage       | None                  | Active  |
| Parent exists          | Yes (but not waiting) | No      |
| Reparented to PID 1    | No                    | Yes     |
| Can be killed directly | No                    | Yes     |

---

## 4. Production Best Practices

* Monitor zombies:

```bash
watch "ps -eo stat | grep Z | wc -l"
```

* Fix applications that don’t call `wait()` properly
* Use supervisors (`systemd`, `supervisord`) to manage child processes
* Large zombie counts indicate **application-level bugs**

