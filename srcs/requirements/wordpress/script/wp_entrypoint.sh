#!/bin/sh

MAX_ATTEMPTS=100
WAIT_INTERVAL=5
COUNTER=0

# mysqladmin ping checks if the database server is accessible
until mysql -u "wpuser" -p"password" -h "mariadb" -e "SELECT 1;" >/dev/null 2>&1; do
    if [ $COUNTER -eq $MAX_ATTEMPTS ]; then
        echo "Error: Could not connect to the database after $MAX_ATTEMPTS attempts."
        exit 1
    fi
    COUNTER=$((COUNTER+1))
    echo "Trying to connect to the database. Attempt $COUNTER/$MAX_ATTEMPTS..."
    sleep $WAIT_INTERVAL
done

# Create directories for WordPress and PHP runtime files
mkdir -p /var/www/html/wordpress /run/php/

# Change the owner of the /var/www/html directory to the 'www' user and group
chown -R www:www /var/www/html/
# Set the permissions of the /var/www/html directory to 755 (read and execute access for everyone and also write access for the owner of the file)
chmod -R 755 /var/www/html/

cd /var/www/html

if ! wp core is-installed --allow-root 2>/dev/null; then
    # download wp
    wp core download --allow-root

    # create wp config file
    wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root

    # install wp
    wp core install --url=localhost --title=inception --admin_user=vvagapov --admin_password=pass1234 --admin_email=admin@admin.com --allow-root

    # create user
    wp user create lera lera@example.com --role=author --user_pass=password --allow-root

    # install theme
    wp theme activate twentytwentytwo --allow-root

    # set site url and home
    wp option update siteurl "https://vvagapov.42.fr" --allow-root --path=/var/www/html
    wp option update home "https://vvagapov.42.fr" --allow-root --path=/var/www/html
fi

# Start PHP-FPM in the foreground
exec php-fpm82 -F;