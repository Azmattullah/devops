# Apache2 Domain mapping .conf file HTTP/HTTPS

<br><br>

## File name cybertools.conf

```
<VirtualHost *:80>
    ServerName cyber.tools65.com
    ServerAlias www.cyber.tools65.com

    ServerAdmin admin@tool65.com
    DocumentRoot /var/www/cybertools/public

    <Directory /var/www/cybertools/public>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/cyber.tools65.error.log
    CustomLog ${APACHE_LOG_DIR}/cyber.tools65.access.log combined
RewriteEngine on
RewriteCond %{SERVER_NAME} =www.cyber.tools65.com [OR]
RewriteCond %{SERVER_NAME} =cyber.tools65.com
RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
```

---

<br><br>

## File name cybertools-le-ssl.conf


```
<IfModule mod_ssl.c>
<VirtualHost *:443>
    ServerName cyber.tools65.com
    ServerAlias www.cyber.tools65.com

    ServerAdmin admin@tool65.com
    DocumentRoot /var/www/cybertools/public

    <Directory /var/www/cybertools/public>
        Options FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/cyber.tools65.error.log
    CustomLog ${APACHE_LOG_DIR}/cyber.tools65.access.log combined

SSLCertificateFile /etc/letsencrypt/live/cyber.tools65.com/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/cyber.tools65.com/privkey.pem
Include /etc/letsencrypt/options-ssl-apache.conf
</VirtualHost>
</IfModule>
```
---
<br><br>


## File name qrcode.conf 
```
<VirtualHost *:80>
    ServerName qrcode.tools65.com
    ServerAlias www.qrcode.tools65.com

    DocumentRoot /var/www/qrcode

    <Directory /var/www/qrcode>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/qrcode_error.log
    CustomLog ${APACHE_LOG_DIR}/qrcode_access.log combined
RewriteEngine on
RewriteCond %{SERVER_NAME} =www.qrcode.tools65.com [OR]
RewriteCond %{SERVER_NAME} =qrcode.tools65.com
RewriteRule ^ https://%{SERVER_NAME}%{REQUEST_URI} [END,NE,R=permanent]
</VirtualHost>
```

----
<br><br>

 ## File name qrcode-le-ssl.conf 
 ```
<IfModule mod_ssl.c>
<VirtualHost *:443>
    ServerName qrcode.tools65.com
    ServerAlias www.qrcode.tools65.com

    DocumentRoot /var/www/qrcode

    <Directory /var/www/qrcode>
        AllowOverride All
        Require all granted
    </Directory>

    ErrorLog ${APACHE_LOG_DIR}/qrcode_error.log
    CustomLog ${APACHE_LOG_DIR}/qrcode_access.log combined


Include /etc/letsencrypt/options-ssl-apache.conf
SSLCertificateFile /etc/letsencrypt/live/qrcode.tools65.com/fullchain.pem
SSLCertificateKeyFile /etc/letsencrypt/live/qrcode.tools65.com/privkey.pem
</VirtualHost>
</IfModule>
```