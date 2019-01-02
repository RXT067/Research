#!/bin/bash
# Date : (2012-04-12)
# Last revision : (2018-12-05 16:30)
# Distribution used to test : Debian Strech
# Author : Quentin PÂRIS, Valentin PERRUSSEL, Pierre ETCHEMAITE, Jacob Hrbek
# Licence : GPLv3
# WineHQ: http://winebuild.playonlinux.com/wine/wine-patches/LeagueOfLegends2/
 
# Changelog
# (2012-05-11) 22:50 - Quentin PÂRIS
#        - New wine patches for better perfomances
# (2012-05-11) 23:38 - Quentin PÂRIS
#        - Dirty hack that fixes problems
# (2012-05-12) 09:45 - Quentin PÂRIS
#        - Patches for osx
# (2012-05-28) 11:00 - Quentin PÂRIS
#        - Checks for recent version of PoL (InsertBeforeWine is bad supported by 4.0.14)
# (2013-03-10) 22:51 - Pierre ETCHEMAITE
#       - Use web downloader
# (2013-04-07) 22:23 - Pierre ETCHEMAITE
#       - Reverted as they somehow broke PMB (not even installed)
# (2013-04-13) 20:12 - GNU_Raziel
#       - Added POL_Wine_SetVideoDriver function
# (2013-09-07) 21:17 - Pierre ETCHEMAITE
#       - Fix for newer LoL versions
# (2014-09-01) 21:17 - Quentin PÂRIS
#       - Fix for newer LoL versions (added d3dx9)
# (2015-01-09) 00:54 - Pierre ETCHEMAITE
#       - Update Wine to fix missing libgcrypto symlink
# (2015-02-10) 20:25 = Pierre ETCHEMAITE
#       - Use official standalone installer/patcher
# (2015-05-31) 08:27 = Pierre ETCHEMAITE
#       - use Wine 1.7.44-LeagueOfLegends2 to fix patcher issue
# (2016-01-26) 12:55 (UTC) - Jeddunk
#       - upgrade Wine to 1.9.2-LeagueOfLegends5
# (2018-12-05) 21:30 (UTC) - Jorge Sanabria
#       - upgrade Wine to 3.21-staging
#       - upgrade download urls files
# (2018-12-29) 14:33:41 (UTC) - Jacob Hrbek
#       - Added adobeair dependency which is required to fix slow launcher
#       - Added GLSL disable that is required based on WineHQ
#       - Added todo for gallium9 patches which improve performance.
#       - Added other regions to the installer
#       - Added support for system wine (?)
#       - Removed x86 arch which is limiting (should be invoked on multilib wine)
 
[ "$PLAYONLINUX" = "" ] && exit 0
source "$PLAYONLINUX/lib/sources"
 
WINE_CHECK=$(wine --version); IFS=- read -r _ WINE_VERSION WINE_REVISION _ <<<"$WINE_CHECK"; 

if [[ -e $(command -v wine) ]] && [[ WINE_VERSION -ge 3.21 ]] && [[ $(wine --version | grep -o "(Staging)") == "(Staging)" ]]; then
    echo "WINE is sufficient" &> /dev/null
    echo "FIXME: Using system wine"
    break

    else
        echo "FATAL: WINE is not sufficient"
        expected "Wine 3.21-staging or higher"
        WINEVERSION="3.21-staging"
        USING_POL_WINE=TRUE
        exit 0
fi
 
TITLE="League of Legends"
PREFIX="LeagueOfLegends"
SHORTCUT_NAME="League of Legends"
 
POL_GetSetupImages "http://files.playonlinux.com/resources/setups/$PREFIX/top.jpg" "http://files.playonlinux.com/resources/setups/$PREFIX/left.jpg" "$TITLE"
 
POL_SetupWindow_Init
POL_RequiredVersion "4.0.18" || POL_Debug_Fatal "$APPLICATION_TITLE 4.0.18 is required to install $TITLE"
POL_SetupWindow_SetID 1135
         
which glxinfo || POL_Debug_Error "$(eval_gettext 'glxinfo is not installed. Please install mesa-utils package')"
 
if ! glxinfo | grep -q GL_EXT_texture_compression_s3tc; then
    POL_SetupWindow_message "$(eval_gettext 'Warning! S3TC compression is not available on your system.\n\nIf you have a free driver, you might need to install a proprietary driver \n\nOtherwise, you can enable it by installing libtxc-dxtn0 package or libtxc-dxtn-s2tc0,libtxc-dxtn-s2tc-bin if the first doesn t work, but you might get slower results')"
    POL_Debug_Warning "S3TC not enabled!"
fi
 
POL_Debug_Init
 
POL_SetupWindow_presentation "League of Legends" "Riot" "http://www.riotgames.com/" "Quentin PÂRIS, BlondVador" "LeagueOfLegends"
 
POL_SetupWindow_InstallMethod "DOWNLOAD,LOCAL"
 
if [ "$INSTALL_METHOD" = "LOCAL" ]; then
    cd "$HOME"
    POL_SetupWindow_browse "$(eval_gettext 'Please select the setup file to run.')" "$TITLE" "" "Windows Executables (*.exe)|*.exe;*.EXE"
 
    if strings "$APP_ANSWER"|grep -q '\(name="Pando Media Booster Downloader"\|Advanced Installer\)'; then
        NOBUGREPORT="TRUE"
        POL_Debug_Fatal "$(eval_gettext 'Cant install using the official downloader, sorry')"
    fi
    FULL_INSTALLER="$APP_ANSWER"
else # DOWNLOAD
    POL_System_TmpCreate "$PREFIX"
 
    # view-source:https://signup.na.leagueoflegends.com/en/signup/redownload
    # view-source:https://signup.euw.leagueoflegends.com/en/signup/redownload
    # view-source:https://signup.eune.leagueoflegends.com/en/signup/redownload
    POL_SetupWindow_menu "$(eval_gettext 'Select installer to download:')" "$TITLE" "$(eval_gettext 'North America')~$(eval_gettext 'Europe West')~$(eval_gettext 'Europe Nordic and East')" "~"
    case "$APP_ANSWER" in
        "$(eval_gettext 'North America')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20NA.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'Europe West')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20EUW.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'Europe Nordic and East')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20EUNE.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'Brazil')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20BR.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'AN')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20AN.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'LAS')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20LAS.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'OCE')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20OCE.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'RU')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20RU.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'TR')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20TR.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'JP')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20JP.exe"
            $DOWNLOAD_MD5=""
            ;;
        "$(eval_gettext 'SEA')")
            DOWNLOAD_URL="https://riotgamespatcher-a.akamaihd.net/releases/live/installer/deploy/League%20of%20Legends%20installer%20SEA.exe"
            $DOWNLOAD_MD5=""
            ;;
    esac
    DOWNLOAD_FILE="$POL_System_TmpDir/$(basename "$DOWNLOAD_URL")"
 
    POL_Call POL_Download_retry "$DOWNLOAD_URL" "$DOWNLOAD_FILE" "$DOWNLOAD_MD5" "$TITLE standalone installer"
 
    FULL_INSTALLER="$DOWNLOAD_FILE"
fi
 
# POL_System_SetArch "x86" - TODO: Can POL make multilib wineprefix?
POL_Wine_SelectPrefix "$PREFIX"

if [[ USING_POL_WINE=TRUE ]]; then
    POL_Wine_PrefixCreate "$WINEVERSION" 
fi
 
# Dependencies
POL_Call POL_Install_corefonts
POL_Call POL_Install_vcrun2008
POL_Call POL_Install_vcrun2017
POL_Call POL_Install_d3dx9
POL_Call POL_Install_adobeair

Set_GLSL Off

# TODO: Gallium9 patches improve performance in-game.
 
Set_OS "winxp"
 
POL_SetupWindow_message "$(eval_gettext 'Warning: You must not tick the checkbox "Run $TITLE" when setup is done')" "$TITLE"
 
POL_Wine_WaitBefore "$TITLE"
POL_Wine "$FULL_INSTALLER"
 
Set_OS winxp
 
# Set Graphic Card informations keys for wine
POL_Wine_SetVideoDriver
 
POL_Call POL_Function_OverrideDLL builtin,native dnsapi
POL_Shortcut "LeagueClient.exe" "$SHORTCUT_NAME" "$SHORTCUT_NAME.png" "" "Game;RolePlaying;"
 
if [ "$INSTALL_METHOD" = "DOWNLOAD" ]; then
    # Free some disk space
    POL_System_TmpDelete
fi
 
if [ "$POL_OS" = "Linux" ]; then
    if [ "$(cat /proc/sys/net/ipv4/tcp_timestamps)" = "1" ]; then
        FORUM_URL='http://forums.euw.leagueoflegends.com/board/showthread.php?t=2058453'
        POL_SetupWindow_question "$(eval_gettext 'If you get connection errors when attempting to login, try disabling tcp_timestamps in the kernel.')\n$(eval_gettext 'Do you want to read original thread in League of Legends forums?')" "$TITLE"
        [ "$APP_ANSWER" = "TRUE" ] && POL_Browser "${FORUM_URL}"
    fi
fi
 
POL_SetupWindow_Close
exit 0
