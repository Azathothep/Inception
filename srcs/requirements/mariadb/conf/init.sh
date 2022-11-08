service mysql start

mysql -e "CREATE DATABASE IF NOT EXISTS ${MARIADB_DATABASE};"
mysql -e "CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON ${MARIADB_DATABASE}.* TO ${MARIADB_USER}@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PASSWORD}';"