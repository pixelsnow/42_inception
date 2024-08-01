FROM alpine:3.19

RUN apk update && \
    apk upgrade && \
    apk add --no-cache php82-fpm

COPY ./tools/wp_entrypoint.sh /usr/local/bin/wp_entrypoint.sh
RUN chmod +x /usr/local/bin/wp_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/wp_entrypoint.sh"]