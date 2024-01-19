#!/bin/zsh
#set -x
############################################################################################
##
## Script to ensure "Show all filename extensions" -setting is enabled
##
############################################################################################

## Copyright (c) 2023 Microsoft Corp. All rights reserved.
## Scripts are not supported under any Microsoft standard support program or service. The scripts are provided AS IS without warranty of any kind.
## Microsoft disclaims all implied warranties including, without limitation, any implied warranties of merchantability or of fitness for a
## particular purpose. The entire risk arising out of the use or performance of the scripts and documentation remains with you. In no event shall
## Microsoft, its authors, or anyone else involved in the creation, production, or delivery of the scripts be liable for any damages whatsoever
## (including, without limitation, damages for loss of business profits, business interruption, loss of business information, or other pecuniary
## loss) arising out of the use of or inability to use the sample scripts or documentation, even if Microsoft has been advised of the possibility
## of such damages.
## Feedback: neiljohn@microsoft.com

# Define variables
appname="ShowAllFilenameExtensions"
logandmetadir="/Library/Logs/Microsoft/IntuneScripts/$appname"
log="$logandmetadir/$appname.log"

# Check if the log directory has been created
if [ -d $logandmetadir ]; then
    # Already created
    echo "$(date) | Log directory already exists - $logandmetadir"
else
    # Creating Metadirectory
    echo "$(date) | creating log directory - $logandmetadir"
    mkdir -p $logandmetadir
fi

# Enables "Show all filename extensions" -setting from Finder from current user
ShowAllFilenameExtensions() {
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true" && killall Finder
echo "$(date) | 'Show all filename extensions' -setting is now enabled or it is already enabled from Finder for user $USER. Closing script..."
}

# Start logging
exec &> >(tee -a "$log")

# Begin Script Body
echo ""
echo "##############################################################"
echo "# $(date) | Starting running of script $appname"
echo "############################################################"
echo ""

# Run function
ShowAllFilenameExtensions