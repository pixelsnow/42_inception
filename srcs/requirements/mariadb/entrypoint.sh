#!/bin/sh

MAX_ATTEMPTS=100
WAIT_INTERVAL=1
ATTEMPTS=0

echo "MariaDB ENTRYPOINT script executing"

# Start the MariaDB server in the background
# The --user option specifies the user to run mysqld as
# The --skip-networking option disables all TCP/IP connections
# The --socket option specifies the Unix socket file to use for local connections
# The --pid-file option specifies the file to use for recording the server's process ID
# & runs the preceding command in the background
# mysqld --user=mysql --skip-networking --socket=/run/mysqld/mysqld.sock --pid-file=/run/mysqld/mysqld.pid &

# Loop until the database server is up and running
# The mysqladmin ping command checks if the server is running
# The -h option specifies the host to connect to
# The --silent option disables all output
# until mysqladmin ping -h localhost --silent; do
#     ATTEMPTS=$((ATTEMPTS+1))
#     echo "Trying to start the database. Attempt $ATTEMPTS/$MAX_ATTEMPTS..."
#     if [ $ATTEMPTS -eq $MAX_ATTEMPTS ]; then
#         echo "Error: Could not connect to the database after $MAX_ATTEMPTS attempts."
#         exit 1
#     fi
#     sleep $WAIT_INTERVAL
# done

# echo "MariaDB is up and running"

# Run the MariaDB server in the foreground
# This will keep the container running as long as the MariaDB server is running
echo "Starting MariaDB server"
exec mysqld