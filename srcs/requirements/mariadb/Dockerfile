FROM alpine:3.19

# Install MariaDB server and client packages
RUN apk add --no-cache mariadb mariadb-client

# Initialize the MariaDB database with a user mysql and data directory /var/lib/mysql
RUN /usr/bin/mariadb-install-db --user=mysql --datadir=/var/lib/mysql

# Create a directory for the MariaDB error log
RUN mkdir -p /var/log/mysql
# Change the owner of the log directory to the mysql user
RUN chown -R mysql:mysql /var/log/mysql
# Create an empty error log file
RUN touch /var/log/mysql/error.log

# Create a directory for the MariaDB process ID file
RUN mkdir /run/mysqld

# Copy the MariaDB server configuration file into the image
COPY mariadb-server.cnf /etc/my.cnf.d/.
# Copy the SQL initialization file into the image
COPY init.sql /etc/my.cnf.d/.

EXPOSE 3306

# Copy the entrypoint script into the image and make it executable
COPY entrypoint.sh /usr/local/bin/.
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]