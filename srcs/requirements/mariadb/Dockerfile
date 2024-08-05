FROM alpine:3.19

RUN apk add --no-cache mariadb

EXPOSE 3306

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
