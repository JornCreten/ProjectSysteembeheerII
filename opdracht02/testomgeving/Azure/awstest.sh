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


#------------------------------------------------------------------------------
# "Imports"
#------------------------------------------------------------------------------

# Utility functions
source ./util.sh
# Actions/settings common to all servers
source ./common.sh
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


lamp_config

log "Create user"
ensure_user_exists ${USERNAME}
echo "${PASSWORD}" | passwd --stdin ${USERNAME}

log "Make Group"
ensure_group_exists ${GROUPNAME}
assign_groups ${USERNAME} ${GROUPNAME}
assign_groups ${USERNAME} wheel

