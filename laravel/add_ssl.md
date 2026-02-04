### Here’s the **clean, safe way to add a free SSL (Let’s Encrypt)** for  **`cyber.tools65.com`** on Apache.

---

## ✅ Prerequisites (quick check)

Make sure **all of these are true** before continuing:

1. ✅ Domain works on HTTP
   → `http://cyber.tools65.com` loads your app (not Apache default page)

2. ✅ DNS points to this server

   ```bash
   ping cyber.tools65.com
   ```

   It should resolve to **your server IP**

3. ✅ Apache is running

   ```bash
   systemctl status apache2
   ```

---

## 🚀 Step 1: Install Certbot (Apache plugin)

### Ubuntu / Debian

```bash
sudo apt update
sudo apt install certbot python3-certbot-apache -y
```

---

## 🚀 Step 2: Request SSL Certificate

Run:

```bash
sudo certbot --apache -d cyber.tools65.com
```

You’ll be asked:

* Email address → enter one
* Agree to terms → **Y**
* Redirect HTTP to HTTPS → **Choose YES (recommended)**

Certbot will:

* Generate SSL cert
* Modify your Apache config
* Enable HTTPS automatically 🎉

---

## 🚀 Step 3: Reload Apache

```bash
sudo systemctl reload apache2
```

---

## ✅ Done! Test it

Open in browser:

```
https://cyber.tools65.com
```

You should see:

* 🔒 Lock icon
* No security warnings

---

## 🔍 What Certbot added (FYI)

Certbot automatically creates something like:

```apache
<VirtualHost *:443>
    ServerName cyber.tools65.com
    DocumentRoot /var/www/cybertools/public

    SSLEngine on
    SSLCertificateFile /etc/letsencrypt/live/cyber.tools65.com/fullchain.pem
    SSLCertificateKeyFile /etc/letsencrypt/live/cyber.tools65.com/privkey.pem

    <Directory /var/www/cybertools/public>
        AllowOverride All
        Require all granted
    </Directory>
</VirtualHost>
```

And a redirect:

```apache
<VirtualHost *:80>
    ServerName cyber.tools65.com
    Redirect permanent / https://cyber.tools65.com/
</VirtualHost>
```

---

## 🔄 Auto-Renewal (VERY IMPORTANT)

Let’s Encrypt certs expire every 90 days, but renewal is automatic.

Test it:

```bash
sudo certbot renew --dry-run
```

If no errors → you’re safe forever 👍

---

## 🧠 Common SSL Problems (if anything breaks)

| Problem                | Fix                                 |
| ---------------------- | ----------------------------------- |
| Certbot fails          | Check DNS & firewall (port 80 open) |
| HTTPS loads wrong site | Disable `000-default.conf`          |
| Redirect loop          | Check `.htaccess`                   |

---