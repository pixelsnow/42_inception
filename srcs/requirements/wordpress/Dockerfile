# Use Alpine Linux 3.19 as the base image
FROM alpine:3.19@sha256:95c16745f100f44cf9a0939fd3f357905f845f8b6fa7d0cde0e88c9764060185

# Create a system group 'www'
RUN addgroup -S www
# Add a system user 'www' with
# no home directory (not needed because this is just to run services)
# no shell (increases security),
# and with the primary group also named 'www'
RUN adduser -S -D -H -h /var/cache/www -s /sbin/nologin -G www -g www www

# Install PHP, PHP-FPM (FastCGI Process Manager), PHP extensions, curl, MariaDB client
RUN apk add --no-cache \
    php \
    php82-fpm \
    php-mysqli \
    curl \
    php-mbstring \
    php-phar \
    mariadb-client

# Copy the PHP-FPM configuration file into the image
COPY /config/www.conf /etc/php82/php-fpm.d/.

# Copy the entrypoint script into the image and make it executable
COPY ./script/wp_entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/wp_entrypoint.sh

# Download the WP-CLI (WordPress Command Line Interface) tool
# and make it executable
RUN curl https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -o /usr/local/bin/wp && \
    chmod +x /usr/local/bin/wp

# Set the entrypoint script as the default command to run when the container starts
ENTRYPOINT ["/usr/local/bin/wp_entrypoint.sh"]