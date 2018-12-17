# Dishonored 2 debug

Installed `xact` + `d3dx9` via winetricks for 64-bit prefix

Starts in blackscreen and becames unresponsive.
INFO: https://paste.pound-python.org/raw/Aa4xFhZbGGWS1YUfHTrJ/

Tried to add `corefonts` = same issue

Suspect problem with libraries since game is able to launch on lutris. On Lutris game has performance issues.

Noticed:
![ERROR](https://i.imgur.com/Wkv2dK5.jpg "ERROR")
- Can't click on anything, resizing using meta+mouse2 on i3

Using to debug:

```
WINEDEBUG='fixme-all,+dll' WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe 
```