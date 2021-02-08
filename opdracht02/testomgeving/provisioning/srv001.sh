#! /bin/bash
#
# Provisioning script for srv001

#------------------------------------------------------------------------------
# Bash settings
#------------------------------------------------------------------------------

set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't mask errors in piped commands

#------------------------------------------------------------------------------
# Variables
#------------------------------------------------------------------------------

# Location of provisioning scripts and files
export readonly PROVISIONING_SCRIPTS="/vagrant/provisioning/"
# Location of files to be copied to this server
export readonly PROVISIONING_FILES="${PROVISIONING_SCRIPTS}/files/${HOSTNAME}"

#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Utility functions
source ${PROVISIONING_SCRIPTS}/util.sh
# Actions/settings common to all servers
source ${PROVISIONING_SCRIPTS}/common.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------
#! /bin/bash
#
log "Starting server specific provisioning tasks on ${HOSTNAME}"

# TODO: insert code here, e.g. install Apache, add users (see the provided
# functions in utils.sh), etc.

install_packages() {
	#install and start Apache
	log "Httpd"
	dnf install -y httpd

	#install mariadb
	log "Mariadb"
	dnf install mariadb-server -y

	#install php
	log "php"
	dnf install -y @php
	dnf install -y php php-{cli,mysqlnd,json,opcache,xml,mbstring,gd,curl}

	#install drupal & packages
	log "drupal"
    drupal

    #install firewalld incase it's not installed yet
	log "install firewall"
	dnf install firewalld -y

	#Install and enable cockpit
	log "cockpit"
	dnf install cockpit -y
}


drupal(){
	if [ ! -d "/var/www/html/drupal" ]; then
		sudo dnf -y install wget		
		yum install policycoreutils-python-utils -y
		DRUPAL_VERSION="8.7.8"
		wget https://ftp.drupal.org/files/projects/drupal-${DRUPAL_VERSION}.tar.gz
		tar xvf drupal-${DRUPAL_VERSION}.tar.gz
		mv drupal-${DRUPAL_VERSION} /var/www/html/drupal
		mkdir /var/www/html/drupal/sites/default/files
		cp /var/www/html/drupal/sites/default/default.settings.php /var/www/html/drupal/sites/default/settings.php
		semanage fcontext -a -t httpd_sys_rw_content_t "/var/www/html/drupal(/.*)?"
		semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/drupal/sites/default/settings.php'
		semanage fcontext -a -t httpd_sys_rw_content_t '/var/www/html/drupal/sites/default/files'
		restorecon -Rv /var/www/html/drupal
		restorecon -v /var/www/html/drupal/sites/default/settings.php
		restorecon -Rv /var/www/html/drupal/sites/default/files
		chown -R apache:apache  /var/www/html/drupal
		echo "<VirtualHost *:80>
    ServerAdmin webmaster@example.com
    ServerName example.com
    DocumentRoot /var/www/html/drupal
    <Directory /var/www/html/drupal/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
    </Directory>
    ErrorLog /var/log/httpd/drupal_error.log
    CustomLog /var/log/httpd/drupal_access.log combined
</VirtualHost>" > /etc/httpd/conf.d/drupal.conf
	else	
		log "drupal already installed, skipping ..."
	fi
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
	systemctl enable --now php-fpm
	systemctl start cockpit.socket
	systemctl enable --now cockpit.socket
}

configure_mariadb() { 
if mysqladmin --user=root status > /dev/null 2>&1 ; then
    mysql --user=root <<_EOF_
    UPDATE mysql.user SET Password=PASSWORD('${ROOTPASS}') WHERE User='root';
    DELETE FROM mysql.user WHERE User='';
    DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
    DROP DATABASE IF EXISTS test;
    DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
    FLUSH PRIVILEGES;
_EOF_
fi

#Mysql User + database aanmaken
mysql --user=root --password="${ROOTPASS}" <<_EOF_
DROP USER IF EXISTS ${db_user};
DROP DATABASE IF EXISTS ${MAINDB};
CREATE DATABASE ${MAINDB};
GRANT ALL ON ${MAINDB}.* TO '${db_user}'@'%' IDENTIFIED BY '${ROOTPASS}';
FLUSH PRIVILEGES;
_EOF_
#	if [ ! -d "/var/lib/mysql/${MAINDB}" ]; then
#		log "Creating db for drupal"
#		mysql -e "CREATE DATABASE ${MAINDB} /*\!40100 DEFAULT CHARACTER SET utf8 */;"
#		mysql -e "CREATE USER ${MAINDB}@localhost IDENTIFIED BY '${ROOTPASS}';"
#		mysql -e "GRANT ALL PRIVILEGES ON ${MAINDB}.* TO '${MAINDB}'@'localhost';"
#		mysql -e "FLUSH PRIVILEGES;"
#		mysqladmin -u root password "${ROOTPASS}"
#	else
#		log "db already exists, skipping section"
#	fi
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

lamp_config() {	
	#Set SELINUX strictness (permissive=0,strict=1)
	setenforce 0
	install_packages
	enable_services
	configure_mariadb
	log "Configuring firewall"
	configure_firewall
	log "installing drupal"
	#install_drupal
	
	log "Setting up phpinfo page"
	echo "<?php phpinfo(); ?>" > /var/www/html/phpinfo.php
	log "reloading httpd"
	setenforce 1
	systemctl reload httpd
}

lamp_config

log "Create user"
ensure_user_exists "${USERNAME}"
echo "${PASSWORD}" | passwd --stdin "${USERNAME}"

log "Make Group"
ensure_group_exists "${GROUPNAME}"
assign_groups "${USERNAME}" "${GROUPNAME}"
assign_groups "${USERNAME}" wheel

