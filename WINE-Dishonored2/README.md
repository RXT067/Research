# Dishonored 2 debug

Installed `xact` + `d3dx9` via winetricks for 64-bit prefix

Starts in blackscreen and becames unresponsive.

Tried to add `corefonts` = same issue

Suspect problem with libraries since game is able to launch on lutris. On Lutris game has performance issues.

Noticed:
![ERROR](https://i.imgur.com/Wkv2dK5.jpg "ERROR")
- Can't click on anything, resizing using meta+mouse2 on i3

Using to debug:

```
WINEDEBUG='fixme-all,+dll' WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe 
```

# Missing codec/player?
- There is `$GAMEDIR/base/video` full of `file.bk2` 
- `bk2` seems to be `Bink Video format` 
- found `binkw32` in `winetricks` 
   - Unable to install `binkw32` in 64-bit wineprefix
