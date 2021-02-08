#! /usr/bin/bash
#
# Provisioning script common for all servers

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------
# TODO: put all variable definitions here. Tip: make them readonly if possible.
export readonly USERNAME="jorn"
export readonly PASSWORD="paswoord"
export readonly GROUPNAME="admin"
export readonly MAINDB="demodb"
export readonly ROOTPASS="pass"
#------------------------------------------------------------------------------
# Provisioning tasks
#------------------------------------------------------------------------------

log 'Starting common provisioning tasks'

# TODO: insert common provisioning code here, e.g. install EPEL repository, add
# users, etc.

lamp_config() {	
	#Set SELINUX strictness (permissive=0,strict=1)
	setenforce 0
	install_packages
	enable_services
	configure_mariadb
	log "Configuring firewall"
	configure_firewall
	log "installing drupal"
	install_drupal
	
	log "Setting up phpinfo page"
	echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
	log "reloading httpd"
	systemctl reload httpd
}

install_packages() {
	#update package manager just in case
	dnf update -y

	#install and start Apache
	log "Httpd"
	dnf install -y httpd

	#install mariadb
	log "Mariadb"
	dnf install mariadb-server -y

	#install php
	log "php"
	dnf install -y php php-common #php-pecl-apcu php-cli php-pear php-pdo php-mysqlnd php-pgsql php-gd php-mbstring php-xml
	
	#install drupal & packages
	log "drupal"
	dnf install -y drupal8 drupal8-httpd php-opcache -y

	#Install and enable cockpit
	log "cockpit"
	dnf install cockpit -y
	systemctl enable --now cockpit.socket
}

enable_services()
{
	log "Enabling and starting services"
	#Start httpd (apache)
	systemctl start httpd
	#Start apache & mysql on boot
	systemctl enable --now httpd
	systemctl enable --now mariadb
	#enable and start firewall
	systemctl enable firewalld
	systemctl start firewalld
}

configure_mariadb() { 
	if [ ! -d "/var/lib/mysql/${MAINDB}" ]; then
		log "Creating db for drupal"
		mysql -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
		mysql -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${ROOTPASS}';"
		mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
		mysql -e "FLUSH PRIVILEGES;"
		mysqladmin -u root password "${ROOTPASS}"
	else
		log "db already exists, skipping section"
	fi
}
install_drupal() {
	setsebool -P httpd_can_network_connect_db=1
	setsebool -P httpd_can_sendmail=1
	sed -i 's/Require local/Require all granted/' /etc/httpd/conf.d/drupal8.conf
	sudo cp /etc/drupal8/sites/default/default.settings.php /etc/drupal8/sites/default/settings.php
	sudo chmod 666 /etc/drupal8/sites/default/settings.php
	systemctl restart httpd
}
configure_firewall(){
	#Configure firewall
	firewall-cmd --add-service=http
	firewall-cmd --add-service=http --permanent
	firewall-cmd --add-service=https
	firewall-cmd --add-service=https --permanent
	firewall-cmd --add-service=cockpit
	firewall-cmd --add-service=cockpit --permanent
	firewall-cmd --zone=public --add-port=80/tcp
	firewall-cmd --zone=public --add-port=443/tcp
	firewall-cmd --add-service=mysql --permanent
	firewall-cmd --reload
	systemctl restart firewalld
}