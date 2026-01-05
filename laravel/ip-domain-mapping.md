# Apache Virtual Host Configuration for Laravel Application

<br>

## Create Virtual Host Configuration File

```bash
sudo vim /etc/apache2/sites-available/laravel_project.conf
```

### Example Configuration (for IP-based access)

```apache
<VirtualHost *:80>
    ServerAdmin admin@domain.com
    DocumentRoot /var/www/laravel_project/public
    ServerName 3.6.89.229

    <Directory /var/www/laravel_project/public>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/laravel_error.log
    CustomLog ${APACHE_LOG_DIR}/laravel_access.log combined
</VirtualHost>
```


Enable the configuration and restart Apache:

```bash
sudo a2ensite laravel_project.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
```

<br><br>

## Domain Mapping (Optional – For Custom Domain)

If you have a domain (e.g. `bestcast.com`), update your **Apache VirtualHost** as follows:

```bash
sudo vim /etc/apache2/sites-available/bestcast.conf
```

### Example Configuration (for domain-based access)

```apache
<VirtualHost *:80>
    ServerAdmin admin@bestcast.com
    DocumentRoot /var/www/bestcast_web/public
    ServerName bestcast.com
    ServerAlias www.bestcast.com

    <Directory /var/www/bestcast_web/public>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/bestcast_error.log
    CustomLog ${APACHE_LOG_DIR}/bestcast_access.log combined
</VirtualHost>
```

Enable the configuration and restart Apache:

```bash
sudo a2ensite bestcast.conf
sudo a2enmod rewrite
sudo systemctl restart apache2
```

<br><br>

## Check Configuration and Reload Apache

```bash
sudo apache2ctl configtest
sudo systemctl reload apache2
```