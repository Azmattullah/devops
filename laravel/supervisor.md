## What is Supervisor?

**Supervisor** is a **process control system** for Linux that keeps background processes running continuously.

In simple terms:

> It automatically starts, monitors, and restarts programs if they crash.

It’s commonly used in production servers.

---

## Why is Supervisor Used in Laravel?

In Laravel, it is mainly used for:

### 1️⃣ Queue Workers (Most Common Use)

When you run:

```bash
php artisan queue:work
```

That process:

* Runs continuously
* Stops if the server reboots
* Stops if it crashes

Without Supervisor → ❌ You must manually restart it
With Supervisor → ✅ It auto-restarts and runs in the background

---

## What Problems Does Supervisor Solve?

| Problem              | Without Supervisor | With Supervisor   |
| -------------------- | ------------------ | ----------------- |
| Server reboot        | Worker stops       | Auto restarts     |
| Worker crashes       | Stops forever      | Auto restarts     |
| Background execution | Manual             | Automatic         |
| Multiple workers     | Hard to manage     | Easy to configure |

---

## How It Works (Simple Flow)

1. You configure Supervisor.
2. It starts your queue worker.
3. If the worker dies → Supervisor restarts it.
4. On server boot → Supervisor automatically runs it again.

---

## Install Supervisor (Ubuntu)

```bash
sudo apt install supervisor -y
```

Start & enable:

```bash
sudo systemctl enable supervisor
sudo systemctl start supervisor
```

---

## Example: Laravel Queue Worker Setup

Create config file:

```bash
sudo nano /etc/supervisor/conf.d/laravel-worker.conf
```

Add:

```ini
[program:laravel-worker]
process_name=%(program_name)s_%(process_num)02d
command=php /var/www/project/artisan queue:work --sleep=3 --tries=3 --timeout=90
autostart=true
autorestart=true
user=www-data
numprocs=1
redirect_stderr=true
stdout_logfile=/var/www/project/storage/logs/worker.log
```

Reload Supervisor:

```bash
sudo supervisorctl reread
sudo supervisorctl update
sudo supervisorctl start laravel-worker:*
```

Check status:

```bash
sudo supervisorctl status
```

---

## When Do You Need Supervisor?

You need it if your Laravel app uses:

* Queues (`queue:work`)
* Background jobs
* Email processing
* Notifications
* Long-running scripts
* WebSockets
* Scheduled background services

If your app is simple (no queues) → you may not need it.

---

## Summary

**Supervisor = Production process manager**

It ensures:

* 🔄 Auto-restart
* 🚀 Auto-start on reboot
* 📊 Process monitoring
* 🛡 Stability for queue workers

---

If you want, I can also explain:

* Difference between `queue:work` and `queue:listen`
* Supervisor vs systemd
* How many workers you should run based on server size
