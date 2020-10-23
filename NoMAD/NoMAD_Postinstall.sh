#!/bin/bash

# Post-installation script for NoMAD
# Written by Johan McGwire - Yohan @ MacAdmins Slack - Johan@McGwire.tech

# This script re-boots the launch agent for NoMAD after Richard Purves's pre-install script
# Credit to Richard for the main bulk of the script

# Where is everything?
install_dir=$( /usr/bin/dirname $0 )

# Logging stuff starts here
LOGFOLDER="/private/var/log"
LOGFILE="${LOGFOLDER}/NoMAD-Postinstall.log"

if [ ! -d "$LOGFOLDER" ];
then
	/bin/mkdir "$LOGFOLDER"
fi

if [ ! -f "$LOGFILE" ];
then
	/usr/bin/touch ${LOGFILE}
fi

function logme()
{
# Check to see if function has been called correctly
	if [ -z "$1" ]; then
		/bin/echo "$(date '+%F %T') - logme function call error: no text passed to function! Please recheck code!"
		/bin/echo "$(date '+%F %T') - logme function call error: no text passed to function! Please recheck code!" >> ${LOGFILE}		
		exit 1
	fi

# Log the passed details
	/bin/echo "$(date '+%F %T') - $1"
	/bin/echo "$(date '+%F %T') - $1" >> ${LOGFILE}
}

# Start the preinstallation process.
logme "NoMAD Post-Installation Script"

# Find if there's a console user or not. Blank return if not.
consoleuser=$( echo "show State:/Users/ConsoleUser" | /usr/sbin/scutil | /usr/bin/awk '/Name :/&&!/loginwindow/{print $3}' )


# Find if there's a launch agent present
logme "Checking for LaunchAgent presence."
laloc="/Library/LaunchAgents/com.trusourcelabs.NoMAD.plist"
if [ -f "$laloc" ];
then
	# Restart the launch agent.
	logme "loading NoMAD LaunchAgent at: $laloc"
	/usr/bin/sudo -iu "$consoleuser" launchctl load "$laloc"
else
	logme "NoMAD LaunchAgent not found"
fi

logme "LaunchAgent restart completed"
