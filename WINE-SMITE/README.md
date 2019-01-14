System-info : https://paste.pound-python.org/show/F8FyrW5VKvgJGsvGFqYV/

Dependencies : DXVK win7

`WINEPREFIX="/home/kreyren/Games/SMITE" wine HiRezLauncherUI.exe` results in `bad command line` error (https://i.imgur.com/MC6RMVl.png)

`WINEPREFIX="/home/kreyren/Games/SMITE" wine LauncherV7.exe` results in `bad command line` error 

```
kreyren@dreamon ~/Games/SMITE/drive_c/users/kreyren/Desktop $ cat Smite.desktop 
[Desktop Entry]
Name=Smite
Exec=env WINEPREFIX="/home/kreyren/Games/SMITE" /usr/lib/wine-staging-4.0_rc5_p1/bin/wine C:\\\\windows\\\\command\\\\start.exe /Unix /home/kreyren/Games/SMITE/dosdevices/c:/users/Public/Desktop/Smite.lnk
Type=Application
StartupNotify=true
Path=/home/kreyren/Games/SMITE/dosdevices/c:/Program Files (x86)/Hi-Rez Studios
Icon=C288_Icon300.0
StartupWMClass=hirezlauncherui.exe
```
Interesting..

```
kreyren@dreamon ~/Games/SMITE/drive_c/users/kreyren/Desktop $ cat Smite.ink
cat: Smite.ink: No such file or directory
```

Relevant http://forums.smitegame.com/showthread.php?181616-Bad-command-line-(SMITE)
