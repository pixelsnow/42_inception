FROM alpine:3.19

RUN apk add --no-cache mariadb

# Create directory for error.log
RUN mkdir -p /var/log/mysql
RUN chown -R mysql:mysql /var/log/mysql
# Create directory for pid-file
RUN mkdir /run/mysqld

# Copy configuration file
COPY mariadb-server.cnf /etc/my.cnf.d/.
# Copy init.sql file
COPY init.sql /etc/my.cnf.d/.

#EXPOSE 3306

COPY entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
