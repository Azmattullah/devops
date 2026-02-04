# Step-by-Step Guide to Deploy Laravel Project

<br>

### 1. Update Your System

```bash
sudo apt update && sudo apt upgrade -y
```


### 2. Install Apache Web Server

```bash
sudo apt install apache2 -y
```

### Enable and Start Apache

```bash
sudo systemctl enable apache2
sudo systemctl start apache2
```


### 3A. To Install (PHP 8.2) and Required Extensions

```bash
sudo add-apt-repository ppa:ondrej/php -y
sudo apt update
sudo apt install -y php8.2 libapache2-mod-php8.2 php8.2-cli php8.2-mbstring php8.2-xml php8.2-bcmath php8.2-curl php8.2-mysql unzip
```
### 3B. To Install (PHP 8.4) and Required Extensions

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository ppa:ondrej/php
sudo apt update
sudo apt install php8.4
```
Common extensions (optional):

```bash
sudo apt install php8.4-cli php8.4-fpm php8.4-mbstring php8.4-xml php8.4-curl php8.4-mysql
```

Check version:

```bash
php -v
```

### 4. Install Composer

```bash
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
```

### Verify Installation

```bash
php -v
composer -V
```

### 5. Set Correct Permissions for Laravel Project

```bash
sudo chown -R www-data:www-data /var/www/laravel_project
sudo chmod -R 775 /var/www/laravel_project/storage /var/www/laravel_project/bootstrap/cache
```


### 6. Install Laravel Dependencies

```bash
cd /var/www/laravel_project
composer install
```


### 7. Generate Application Key

```bash
php artisan key:generate
```


**Your Laravel project environment is now ready!**
Next steps (optional):

* Configure `.env` for database and app URL
* Set up Apache Virtual Host for your Laravel project
* Restart Apache:

  ```bash
  sudo systemctl restart apache2
  ```