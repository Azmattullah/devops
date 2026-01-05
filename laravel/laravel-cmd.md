# Laravel Important Commands


### Application Setup

```bash
# Generate application key
php artisan key:generate
```

<br>

### Database Management

```bash
# Run all migrations
php artisan migrate

# Check migration status
php artisan migrate:status

# Rollback last migration
php artisan migrate:rollback

# Create a new seeder
php artisan make:seeder <SeederName>
```

**Example:**

```bash
php artisan make:seeder UserSeeder
```

<br>

### Clear & Cache Configuration

```bash
# Clear all caches
php artisan optimize:clear

# Clear individual caches
php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear

# Rebuild caches for better performance
php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan optimize
```

<br>

### Logging Configuration

Edit your `.env` file to change log settings:

```
LOG_CHANNEL=daily
```

Then clear and reload configuration:

```bash
php artisan config:clear
```

<br>

### Service Management

```bash
# Restart PHP and Apache
sudo systemctl restart php8.2-fpm
sudo systemctl restart apache2
```
<br>

### Example: Full Cache Maintenance Flow

```bash
cd /var/www/laravel_project

php artisan cache:clear
php artisan config:clear
php artisan route:clear
php artisan view:clear
php artisan optimize:clear

php artisan config:cache
php artisan route:cache
php artisan view:cache
php artisan optimize
```