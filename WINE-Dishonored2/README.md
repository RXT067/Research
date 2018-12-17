# Dishonored 2 debug
Wine bug: https://bugs.winehq.org/show_bug.cgi?id=46307#add_comment

Installed `xact` + `d3dx9` via winetricks for 64-bit prefix

Starts in blackscreen and becames unresponsive.

Tried to add `corefonts` = same issue

NEW RESULT: Reinstalled DXVK = Game crashes on startup.

Noticed:
![ERROR](https://i.imgur.com/Wkv2dK5.jpg "ERROR")
- Can't click on anything, resizing using meta+mouse2 on i3

Using to debug:

```
WINEDEBUG='fixme-all,+dll' WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe 
```

### Missing libraries?
Suspect problem with libraries since game is able to launch on lutris. On Lutris game has performance issues (freezes everytime it player reach area that wasn't explored before + microfreezes every few seconds + Controller input has long delay).

Lutris Installer: https://lutris.net/games/install/6425/view

Lutris uses "Lutris runtime" which is folder full of libraries that are provided with the installer if configured.

Trying to greb loaded libs on lutris.

### Missing codec/player?
There seems to be a splash screen video at the beggining of the game. Suspect missing codec/player

- There is `$GAMEDIR/base/video` full of `file.bk2` 
- `bk2` seems to be `Bink Video format`  (https://en.wikipedia.org/wiki/Bink_Video)
- found `binkw32` in `winetricks` 
   - Unable to install `binkw32` in 64-bit wineprefix
- Wine is unable to open `.bk2` (tested in explorer)
![BK2_WINE](https://i.imgur.com/9lwZgiY.jpg)


### Lutris
Installed lutris with lutris's winesteam and installed dihhonored 2 https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/Lutris_debug.log

This is a known issues with fontconfig libraries that lutris uses in it's runtime.. Like to point out that i've reported this issue and the only response i've got it "This is Gentoo issue.." https://github.com/lutris/lutris/issues/1167

Fixing Lutris's butterflies.. <br />
Located broken libs in:<br />
`/home/kreyren/.local/share/lutris/runtime/lib32/libfontconfig.so.1`<br />
`/home/kreyren/.local/share/lutris/runtime/lib64/libfontconfig.so.1`<br />
Replaced them with gentoo's libs from <br />
`/usr/lib32/libfontconfig.so.1`<br />
`/usr/lib64/libfontconfig.so.1`<br />

