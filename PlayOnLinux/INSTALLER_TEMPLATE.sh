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


## REFERENCES
# Introduction - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_1:_Getting_to_know_Bash
# Basic Functions - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_2:_Basic_Functions
# Variables - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_3:_Variables
# Conditions - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_4:_Conditions
# Wine - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_5:_Wine
# Filesystem - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_6:_The_Filesystem
# Installation Media - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_7:_Installation_Media
# Real Script - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_8:_My_First_Real_Script
# Standartization - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_9:_Standardization
# Script translation - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_10:_Script_Translation
# List of functions - http://wiki.playonlinux.com/index.php/Scripting_-_Chapter_11:_List_of_Functions

## FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/tree/df9e090b4db5b7a41f72145877cc541b908c319b/lib
# DEBUG FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/debug.lib 
# DEPRECATED FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/deprecated.lib
# DOSBOX FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/dosbox.lib
# POL FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/playonlinux.lib
# PLUGINS FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/plugins.lib
# SCRIPT FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/scripts.lib
# SETUP WINDOW FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/setupwindow.lib
# SOURCES FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/sources
# VARIABLE FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/variables
# WEBSITE FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/website.lib
# WINE FUNCTIONS - https://github.com/PlayOnLinux/POL-POM-4/blob/df9e090b4db5b7a41f72145877cc541b908c319b/lib/wine.lib

exit 0
## Closes.. something(?)
