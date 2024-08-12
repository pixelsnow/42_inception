#!/bin/sh

MAX_ATTEMPTS=100
WAIT_INTERVAL=5
COUNTER=0

#check_mariadb() {
    # mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" -h "$MYSQL_HOSTNAME" -e "SELECT 1;" >/dev/null 2>&1
    #mysqladmin ping -h mariadb --silent
#}

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
chown -R www-data:www-data /var/www/html/
# Set the permissions of the /var/www/html directory to 755 (read and execute access for everyone and also write access for the owner of the file)
chmod -R 755 /var/www/html/

cd /var/www/html

if ! wp core is-installed --allow-root; then
    # download wp
    wp core download --allow-root

    # create wp config file
    wp config create --dbname=wordpress --dbuser=wpuser --dbpass=password --dbhost=mariadb --allow-root

    # install wp
    wp core install --url=localhost --title=inception --admin_user=admin --admin_password=admin --admin_email=admin@admin.com --allow-root

    # create user
    wp user create username email --role=author --user_pass=password --allow-root

    # install theme
    wp theme install twentytwentytwo --activate --allow-root
fi

# Start PHP-FPM in the foreground
exec php-fpm82 -F;