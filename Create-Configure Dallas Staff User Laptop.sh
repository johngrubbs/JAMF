#!/bin/bash
####
## John Grubbs
## Watermark Community Church
####

###################################
# Set naming convention for laptop
###################################
convName="DAL-$username-mbp"

# Set names for variables that will be passed from JAMF to something easy to remember
username=$4
realname=$5
password=$6

##########
# Script
##########

# Create Local Admim user
jamf createAccount -username ${username} -realname "${realname}" -password "${password}" -home "/Users/${username}" -admin -suppressSetupAssistant

# Assign given username as user for computer in JAMF
jamf recon -endUsername "$username"
jamf recon -assetTag "$username"
# Set computer name using naming convention
jamf setComputerName -name "$convName"
# set hostname and local hostname to match naming convention
/usr/sbin/scutil --set HostName "$convName"
/usr/sbin/scutil --set LocalHostName "$convName"

##########################
# Additional setup options 
##########################

# Install Apps using policy event trigger.
# **Target machine must be included in policy scope**
/usr/local/bin/jamf policy -event install-chrome
/usr/local/bin/jamf policy -event install-office

exit 0