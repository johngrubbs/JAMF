#!/bin/bash
##########################
# John Grubbs
# Watermark Community Church
# 05/24/21
##########################

# Set Variable to look for, in this case OneDrive
appToCheck="OneDrive"

# Search for process by name
PROCESS=$(pgrep $appToCheck)

# See if process is currently running
if [[ -z "$PROCESS" ]]; then
        RESULT="Not Running"
    else
        RESULT="Running"
fi

# Report results in a JAMF EA usable way using variable that was named
echo "<result>$appToCheck is ${RESULT}</result>"