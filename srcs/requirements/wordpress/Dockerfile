FROM alpine:3.19

RUN adduser -S -D -H -h /var/cache/www-data -s /sbin/nologin -G www-data -g www-data www-data

RUN apk add --no-cache php82-fpm

COPY www.conf /etc/php82/php-fpm.d/.

COPY ./tools/wp_entrypoint.sh /usr/local/bin/wp_entrypoint.sh
RUN chmod +x /usr/local/bin/wp_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/wp_entrypoint.sh"]