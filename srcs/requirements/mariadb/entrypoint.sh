#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
exec mysqld_safe