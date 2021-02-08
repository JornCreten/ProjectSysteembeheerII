set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

export readonly USERNAME="jorn"
export readonly PASSWORD="paswoord"
export readonly GROUPNAME="admin"
export readonly MAINDB="demodb"
export readonly ROOTPASS="pass"

configure_mariadb() { 
	#log "Creating db for drupal"
	if [ ! -d "/var/lib/mysql/${MAINDB}" ]; then
    #if [ ! mysql -u root -e "use ${MAINDB}" ]; then
		mysql -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
		mysql -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${ROOTPASS}';"
		mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
		mysql -e "FLUSH PRIVILEGES;"
		mysqladmin -u root password "${ROOTPASS}"
	fi
}

configure_mariadb