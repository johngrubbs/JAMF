#!/bin/zsh

##########################
# John Grubbs
# Watermark Community Church
# 05/21/21
##########################
# Sanitize file names for OneDrive Syncing

# Define company name for use is finding correct OneDrive folder (~/OneDrive - CompanyName/)
companyName='WatermarkChurch'

loggedInUser=$( echo "show State:/Users/ConsoleUser" | scutil | awk '/Name :/ && ! /loginwindow/ { print $3 }' )

if [[ -z "$loggedInUser" ]] || [[  "$loggedInUser" == 'root' ]] || [[ "$loggedInUser" == "loginwindow" ]] ; then
    loggedInUser="$3"
fi
autoload zmv

oneDriveFolder="/Users/$loggedInUser/OneDrive - $companyName"

if [[ -d "${oneDriveFolder}" ]] ; then

cd "${oneDriveFolder}"

zmv '(**/)(*)' '$1${2//[^A-Za-z0-9. ]/_}'

else

echo "OneDrive Folder not Found"

fi