# Dishonored 2 debug
Wine bug: https://bugs.winehq.org/show_bug.cgi?id=46307

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

## WINE

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

Was told that it's waste of time from wine developer.

### Driver issue?

```
WINEDEBUG='fixme-all,+dll' WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe 

004b:err:dc:CreateDCW no driver found for L"\\\\.\\DISPLAY2\\Monitor0"
002d:err:ole:CoGetClassObject class {294935ce-f637-4e7c-a41b-ab255460b862} not registered
002d:err:ole:CoGetClassObject class {294935ce-f637-4e7c-a41b-ab255460b862} not registered
002d:err:ole:create_server class {294935ce-f637-4e7c-a41b-ab255460b862} not registered
002d:err:ole:CoGetClassObject no class object {294935ce-f637-4e7c-a41b-ab255460b862} could be created for context 0x17
WARNING: radv is not a conformant vulkan implementation, testing use only.
X Error of failed request:  BadWindow (invalid Window parameter)
  Major opcode of failed request:  40 (X_TranslateCoords)
  Resource id in failed request:  0x40004a
  Serial number of failed request:  459
  Current serial number in output stream:  459
X Error of failed request:  BadWindow (invalid Window parameter)
  Major opcode of failed request:  10 (X_UnmapWindow)
  Resource id in failed request:  0x2a00001
  Serial number of failed request:  182
  Current serial number in output stream:  185
^C
```

Related: https://comp.emulators.ms-windows.wine.narkive.com/DXFpe3mV/err-dc-createdcw-no-driver-found-for-l-wineps
*suspect you have no access to the Wine PS driver.* 
- What is `Wine PS Driver`? 
   - From context it seems to be `Wine prinding Driver(?)`.
- I'm not using printer - Irelevant?

Related: http://wine.1045685.n8.nabble.com/Bug-42907-New-Wine-crashes-when-loading-The-Specialists-mod-for-Half-Life-td5925388.html

Related: http://wine.1045685.n8.nabble.com/Bug-15392-New-err-dc-CreateDCW-no-driver-found-for-L-quot-DIRDIB-quot-with-Secret-of-the-Loxor-game-td1623006.html

Related: https://bugs.winehq.org/show_bug.cgi?id=19508
- It was fixed in wine-2.22 ?
   - Trying to confirm old fixed(?) bug https://bugs.winehq.org/show_bug.cgi?id=19508#c24
   - Re-emerging crazy wine in case upstream made merge request (2018-12-18 02:30:21 +- 8 min)




## Lutris
Installed lutris with lutris's winesteam and installed dihhonored 2 https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/Lutris_debug.log

This is a known issues with fontconfig libraries that lutris uses in it's runtime.. Like to point out that i've reported this issue and the only response i've got it "This is Gentoo issue.." https://github.com/lutris/lutris/issues/1167

Fixing Lutris's butterflies.. <br />
Located broken libs in:<br />
`/home/kreyren/.local/share/lutris/runtime/lib32/libfontconfig.so.1`<br />
`/home/kreyren/.local/share/lutris/runtime/lib64/libfontconfig.so.1`<br />
Replaced them with gentoo's libs from <br />
`/usr/lib32/libfontconfig.so.1`<br />
`/usr/lib64/libfontconfig.so.1`<br />

Fixed.. https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/PATCHED_LUTRIS_DEBUG.log

Encountered lutris bug where DXVK is not detected which results in black-screen (suspect that launch to blackscreen means no DXVK detected), tried to reinstall the game, but lutris installer is stuck in loop.

Noticed that Dishnored 2 is installed in linuxsteam, Dishonored 2 on Steam play is able to launch dishonored 2.

I had to reinstall Dishonored 2 it seems that lutris corrupted it. (abnormal glitches, freezes)

Reinstalled dishonored 2 game opens, runs on 50FPS, There is significant delay from controller input that is not present in native linux games (e.i: rocket league) + Game freezes if player enters new area.

Conclusion: I'm convinced that lutris pulled linuxsteam instead of winesteam which made it look like it's able to run dishonored 2.

## Steam Play
Game is able to launch and runs on 50FPS with frezes every few seconds + freeze if player enters new area + there is significant delay from controller input.

Proton log: https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/PROTON_LOG.log

Video analysis: https://www.youtube.com/watch?v=1RVQOy38Nwo
