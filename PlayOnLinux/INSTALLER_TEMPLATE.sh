#!/usr/bin/env playonlinux-bash
# Date : 2018-12-31
# Last revision : 2018-12-31 24:59
# Distribution used to test : <LINUX_DISTRO>
# Author(s) : <NAME+SURNAME>, <NAME+SURNAME>
# Licence : <LINCESE>
# WineHQ: http://winebuild.playonlinux.com/wine/wine-patches/LeagueOfLegends2/


### CHANGELOG ###
# (2018-12-31) 24:59 - <NAME+SURNAME>
# 		- Summary 1
# 		- Summary 2
# (2018-12-31) 23:59 - <NAME+SURNAME>
# 		- Summary 1
# 		- Summary 2


### VARIABLES ### 
WINEVERSION="3.21-staging" # WINE version to be used
TITLE="" # Title in POL
PREFIX="" # Name of Wineprefix
SHORTCUT_NAME="" # Name of shortcut


if [[ $PLAYONLINUX=="" ]]; then
	exit 0
	echo "TODO: $PLAYONLINUX variable is empty" # TODO: Why is var required not empty?

else
	source "$PLAYONLINUX/lib/sources"
fi
 
POL_GetSetupImages "URL"
## Gets images(?)
 
POL_SetupWindow_Init 
## Initiates Setup windows (GUI)

POL_RequiredVersion "4.0.18"
## Checks version of POL?

POL_Debug_Fatal "<MESSAGE>"
## Fails the installation with a message

POL_SetupWindow_SetID 1135
## ID of something(?)
         
POL_Debug_Init
## Dunno (?)
 
POL_SetupWindow_presentation "League of Legends" "Riot" "http://www.riotgames.com/" "Quentin PÂRIS, BlondVador" "LeagueOfLegends"
## Dunno (?)
 
POL_SetupWindow_InstallMethod "DOWNLOAD,LOCAL"
## Dunno (?)

POL_SetupWindow_browse ""
## Dunno (?)
 
POL_System_TmpCreate "$PREFIX"
## Dunno (?)

POL_SetupWindow_menu 
## Dunno (?)

POL_Call 
## Dunno (?)
 
POL_System_SetArch "x86"
## Sets arch (?)

POL_Wine_SelectPrefix "$PREFIX"
## Selects prefix (?)

POL_Wine_PrefixCreate "$WINEVERSION"
## Dunno (?)
 
POL_Call POL_Install_<winetricks_dependency>
## Installs dependency from winetricks (?)
 
Set_OS "winxp"
## Sets OS environment for WINE
 
POL_SetupWindow_message "something?"
## Sends Window message (?)
 
POL_Wine_WaitBefore "$TITLE"
## Dunno (?)

POL_Wine "$FULL_INSTALLER"
## Dunno (?)
 
POL_Wine_SetVideoDriver
## Set Graphic Card informations keys for wine
 
POL_Call POL_Function_OverrideDLL builtin,native dnsapi
## Sets DLL Override for dnsapi

POL_Shortcut "LeagueClient.exe" "$SHORTCUT_NAME" "$SHORTCUT_NAME.png" "" "Game;RolePlaying;"
## Sets shortcut (?)
 
POL_System_TmpDelete
## Wipes /tmp/POL-something (?)

POL_SetupWindow_question "something?"
## Asks end-user for something?

POL_Browser "${FORUM_URL}"
## Opens a browser(?)
 
POL_SetupWindow_Close
## Closes Setup Window

exit 0
## Closes.. something(?)
