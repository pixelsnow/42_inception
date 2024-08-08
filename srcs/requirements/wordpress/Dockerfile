FROM alpine:3.19

# Add user www-data to group www-data
RUN adduser -S -D -H -h /var/cache/www-data -s /sbin/nologin -G www-data -g www-data www-data

RUN apk add --no-cache \
    php82-fpm \
    php-mysqli \
    curl

# Copy config
COPY www.conf /etc/php82/php-fpm.d/.

# Copy and set permissions on entrypoint.sh
COPY ./tools/wp_entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/wp_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/wp_entrypoint.sh"]