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
# Load scripts for LAMP-stack
#source ${PROVISIONING_SCRIPTS}/LAMPConfig.sh

#------------------------------------------------------------------------------
# Provision server
#------------------------------------------------------------------------------
#! /bin/bash
#
log "Starting server specific provisioning tasks on ${HOSTNAME}"

# TODO: insert code here, e.g. install Apache, add users (see the provided
# functions in utils.sh), etc.

install_docker(){
    yum install -y yum-utils device-mapper-persistent-data lvm2

    #for centos 7
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install docker-ce docker-ce-cli containerd.io -y
    #for centos 8
    #dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
    #dnf install docker-ce --nobest -y
simple_webpage(){
    echo '<!DOCTYPE html><html lang="en"><head>    <meta charset="UTF-8">    <title>Index</title></head><body>    <h1>A default webpage!</h1>  </body></html>' > /home/user/website/index.html

}
systemctl start docker
systemctl enable docker    
}
install_containers(){
    docker network create lampnetwork
    docker run --network lampnetwork --name drupal -p 8080:80 -d drupal
    #enkel nodig indien we ook httpd moeten runnen
    docker run --network lampnetwork --name httpd -p 8090:80 -v /home/user/website/:/usr/local/apache2/htdocs/ -d httpd
    simple_webpage
    docker run -d --name mysql --network lampnetwork -e MYSQL_DATABASE=drupal -e MYSQL_USER=user -e MYSQL_PASSWORD=password -e MYSQL_ROOT_PASSWORD=password mysql:5.7   
}
install_cockpit(){
    yum install -y cockpit
    #this does not work in centos 8
    yum install -y cockpit-docker
    systemctl start cockpit
    systemctl enable cockpit

}

install_docker
install_containers
install_cockpit


log "Create user"
ensure_user_exists ${USERNAME}
echo "${PASSWORD}" | passwd --stdin ${USERNAME}

log "Make Group"
ensure_group_exists ${GROUPNAME}
assign_groups ${USERNAME} ${GROUPNAME}
assign_groups ${USERNAME} wheel

