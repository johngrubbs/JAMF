#!/bin/bash
##########################
# John Grubbs
# Watermark Community Church
# 05/13/21
##########################
#Script for assigning name for a laptop used at Dallas Campus

#get last user that logged in
lastUser=$(defaults read /Library/Preferences/com.apple.loginwindow.plist lastUserName)

##############################################
# Set naming convention for Dallas laptop ********
##############################################
convName="DAL-$lastUser-mbp"

#Assign last user as user for computer in JAMF
jamf recon -endUsername "$lastUser"
jamf recon -assetTag "$lastUser"

#Change computer name to naming convention
jamf setComputerName -name "$convName"

#set hostname and local hostname
/usr/sbin/scutil --set HostName "$convName"
/usr/sbin/scutil --set LocalHostName "$convName"

exit 0