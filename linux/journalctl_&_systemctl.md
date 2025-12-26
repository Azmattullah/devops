`journalctl` and `systemctl` are both **systemd tools**, but they do **very different jobs**.

---

## systemctl

**What it is:**
A command to **control and manage system services (units)**.

**What you use it for:**

* Start / stop services
* Enable / disable services at boot
* Check service status
* Reload configurations

**Common examples:**

```bash
systemctl start nginx
systemctl stop nginx
systemctl restart nginx
systemctl enable nginx
systemctl status nginx
```

**Think of it as:**
👉 **Remote control** for services

---

## journalctl

**What it is:**
A command to **view and query logs** collected by `systemd-journald`.

**What you use it for:**

* Read system logs
* Read service logs
* Filter logs by time, service, priority, etc.
* Debug issues

**Common examples:**

```bash
journalctl              # all logs
journalctl -u nginx     # logs for nginx service
journalctl -f           # follow logs (like tail -f)
journalctl --since "10 minutes ago"
```

**Think of it as:**
👉 **Log viewer / search tool**

---

## Key Differences

| Feature            | systemctl           | journalctl   |
| ------------------ | ------------------- | ------------ |
| Purpose            | Manage services     | View logs    |
| Actions            | start, stop, enable | read, filter |
| Controls behavior  | ✅                   | ❌            |
| Shows history/logs | ❌                   | ✅            |

---

## How they work together

When a service fails:

```bash
systemctl status nginx
```

You’ll often see:

```bash
journalctl -u nginx
```

Because:

* `systemctl` tells you **what happened to the service**
* `journalctl` tells you **why it happened**

---

## Simple analogy

* **systemctl** = light switch (on/off)
* **journalctl** = security camera footage (what happened)