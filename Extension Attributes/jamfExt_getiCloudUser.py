#!/usr/bin/python  
##########################
# John Grubbs
# 04/21/21
#
# JAMF Extension attribute to return current use that is signed into iCloud
# **Modified from GitHub user @T-Lark "get_icloudacct.py" script
##########################

#Load Modules
from SystemConfiguration import SCDynamicStoreCopyConsoleUser
from CoreFoundation import CFPreferencesCopyAppValue
from Foundation import NSHomeDirectoryForUser

# Variables
USER, UID, GID = SCDynamicStoreCopyConsoleUser(None, None, None)
USERHOME = NSHomeDirectoryForUser(USER)
FILE = USERHOME + '/Library/Preferences/MobileMeAccounts.plist'

retrunediCloudUser = CFPreferencesCopyAppValue("Accounts", FILE)[0]['AccountID']

# Return results and format for JAMF extension
print("<result>%s</result>"%(retrunediCloudUser))