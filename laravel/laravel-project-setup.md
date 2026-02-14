# 🚀 Laravel Project Setup on VPS Server

This guide assumes:

* Ubuntu 22.04 VPS
* Nginx
* MySQL
* PHP 8.2+

---

# 1️⃣ Connect to Your VPS

```bash
ssh root@your_server_ip
```

(Optional – Create a sudo user instead of using root)

```bash
adduser deployer
usermod -aG sudo deployer
```

---

# 2️⃣ Install Required Packages

```bash
sudo apt update && sudo apt upgrade -y
```

Install Nginx:

```bash
sudo apt install nginx -y
```

Install MySQL:

```bash
sudo apt install mysql-server -y
```

Install PHP & Extensions:

```bash
sudo apt install php-fpm php-mysql php-cli php-curl php-mbstring php-xml php-bcmath php-zip unzip curl git -y
```

Install Composer:

```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

Verify:

```bash
php -v
composer -V
```

---

# 3️⃣ Upload Laravel Project

### Option A: Clone from Git (Recommended)

```bash
cd /var/www
sudo git clone https://github.com/your-repo/project.git
cd project
```

### Option B: Upload ZIP

Upload your project to `/var/www/` and extract:

```bash
sudo unzip project.zip
cd project
```

---

# 4️⃣ Install Laravel Dependencies

```bash
composer install --optimize-autoloader --no-dev
```

If `.env` does not exist:

```bash
cp .env.example .env
```

Generate app key:

```bash
php artisan key:generate
```

---

# 5️⃣ Configure Environment

Edit `.env`:

```bash
nano .env
```

Update:

```env
APP_NAME=Laravel
APP_ENV=production
APP_DEBUG=false
APP_URL=https://yourdomain.com

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=database_name
DB_USERNAME=db_user
DB_PASSWORD=strong_password
```

---

# 6️⃣ Setup Database

Create database and user (if not done):

```bash
sudo mysql
```

```sql
CREATE DATABASE database_name;
CREATE USER 'db_user'@'localhost' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON database_name.* TO 'db_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;
```

Run migrations:

```bash
php artisan migrate --force
```

---

# 7️⃣ Set File Permissions

```bash
sudo chown -R www-data:www-data /var/www/project
sudo chmod -R 775 storage bootstrap/cache
```

---

# 8️⃣ Configure Nginx

Create config file:

```bash
sudo nano /etc/nginx/sites-available/project
```

Add:

```nginx
server {
    listen 80;
    server_name yourdomain.com www.yourdomain.com;
    root /var/www/project/public;

    index index.php index.html;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location ~ \.php$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php8.2-fpm.sock;
    }

    location ~ /\.ht {
        deny all;
    }
}
```

Enable site:

```bash
sudo ln -s /etc/nginx/sites-available/project /etc/nginx/sites-enabled/
sudo nginx -t
sudo systemctl restart nginx
```

---

# 9️⃣ Configure Firewall

```bash
sudo ufw allow OpenSSH
sudo ufw allow 'Nginx Full'
sudo ufw enable
```

---

# 🔟 Optimize Laravel for Production

```bash
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan optimize
```

---

# 1️⃣1️⃣ Setup SSL (HTTPS) – Let’s Encrypt

Install Certbot:

```bash
sudo apt install certbot python3-certbot-nginx -y
```

Run:

```bash
sudo certbot --nginx -d yourdomain.com -d www.yourdomain.com
```

Auto-renew check:

```bash
sudo certbot renew --dry-run
```

---

# 1️⃣2️⃣ Setup Queue Worker (If Using Jobs)

```bash
php artisan queue:work
```

For production (Supervisor recommended):

```bash
sudo apt install supervisor -y
```

---

# 1️⃣3️⃣ Setup Cron Job (Laravel Scheduler)

```bash
crontab -e
```

Add:

```bash
* * * * * cd /var/www/project && php artisan schedule:run >> /dev/null 2>&1
```

---


<br><br>


# 🚀 Laravel Database Setup on VPS (MySQL)



## 1️⃣ Login to MySQL

```bash
sudo mysql -u root -p
```

Check existing databases:

```sql
SHOW DATABASES;
```

---

## 2️⃣ Create a New Database

```sql
CREATE DATABASE database_name
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;
```

Verify:

```sql
SHOW DATABASES;
```


---

## 3️⃣ Import / Restore Database Backup

If you already have a `.sql` file:

```bash
mysql -u db_user -p database_name < database_name.sql
```

If using root:

```bash
mysql -u root -p database_name < database_name.sql
```

Verify import:

```bash
mysql -u db_user -p
USE database_name;
SHOW TABLES;
```

---

## 4️⃣ Configure Laravel `.env`

Edit your Laravel `.env` file:

```env
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=database_name
DB_USERNAME=db_user
DB_PASSWORD=strong_password
```

Clear config cache:

```bash
php artisan config:clear
php artisan cache:clear
php artisan config:cache
```

---

## 5️⃣ Run Laravel Migrations (If Needed)

If you did NOT import a full database:

```bash
php artisan migrate --force
```

If using seeders:

```bash
php artisan db:seed --force
```

---

## 6️⃣ Set Proper File Permissions

```bash
sudo chown -R www-data:www-data /var/www/your-project
sudo chmod -R 777 storage bootstrap/cache
```

---

## 7️⃣ Test Database Connection

```bash
php artisan tinker
```

Inside Tinker:

```php
DB::connection()->getPdo();
```

If connected successfully, no error will appear.

---
<br><br>

# 🔒 Optional (Production Hardening)

### Allow Remote Database Access (Only If Required)

Edit MySQL config:

```bash
sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf
```

Change:

```
bind-address = 0.0.0.0
```

Then:

```bash
sudo systemctl restart mysql
```

Grant remote access:

```sql
CREATE USER 'db_user'@'%' IDENTIFIED BY 'strong_password';
GRANT ALL PRIVILEGES ON database_name.* TO 'db_user'@'%';
FLUSH PRIVILEGES;
```

⚠️ Also open port 3306 in firewall only if absolutely required.

---
