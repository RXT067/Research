Files above are irelevant, formatted in text.

# Dishonored 2 debug
Wine bug: https://bugs.winehq.org/show_bug.cgi?id=46307

**System-info:** https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/wine-report

**Deps:** Installed `xact` + `d3dx9` + `corefonts` via winetricks for 64-bit prefix.

**STATUS:** Has performance issues = Silver(?)

Made RSAID2 script (https://github.com/RXT067/Scripts/RSAID2.sh) that disables introduction.

Using to debug:

```
WINEDEBUG='fixme-all,+dll' WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe 
```

## WINE
Using winesteam only

### SOLVED(?): Missing libraries?

Noticed:
![ERROR](https://i.imgur.com/Wkv2dK5.jpg "ERROR")
- Can't click on anything, resizing using meta+mouse2 on i3

Suspect problem with libraries since game is able to launch on lutris. On Lutris game has performance issues (freezes everytime it player reach area that wasn't explored before + microfreezes every few seconds + Controller input has long delay).

Lutris Installer: https://lutris.net/games/install/6425/view

Lutris uses "Lutris runtime" which is folder full of libraries that are provided with the installer if configured.

Trying to greb loaded libs on lutris = was useless.

Solved: Changed gentoo on multilib, wasn't related, eliminated variables.

### SOLVED(?): Missing codec/player?
There seems to be a splash screen video at the beggining of the game. Suspect missing codec/player

- There is `$GAMEDIR/base/video` full of `file.bk2` 
- `bk2` seems to be `Bink Video format`  (https://en.wikipedia.org/wiki/Bink_Video)
- found `binkw32` in `winetricks` 
 - Unable to install `binkw32` in 64-bit wineprefix
- Wine is unable to open `.bk2` (tested in explorer)
![BK2_WINE](https://i.imgur.com/9lwZgiY.jpg)

SOLVED: Was told that it's waste of time from wine developer.

### Driver issue?

NEW RESULT: Reinstalled DXVK = Game crashes on startup.

#### FIXED: CreateDCW no driver found
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

**FIXED:** Updatating wine on `wine-4.0-rc2-22-g5a8e430b96 (Staging)` Fixed issue above.


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


#### Performance issues

Using:
```
WINEDEBUG='+all,+timestamps' WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe &> dishonored.txt

```

http://www.sysprof.com/ was suggested.

using `+relay` instead of `+all` was suggested.

Running game with `WINEDEBUG="-all"` had no offect on the issue.

Grabbed this log-block:
https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/logblock-freeze.log
- Waited for terminal output to stop generating output, reproduced the issue, killed wine.
- Related https://forum.winehq.org/viewtopic.php?f=8&t=17744
- It's not trying to load those, it's just WARNs from NtQueryAttributesFile, UNCONFIRMED
- Those libraries are required and they might cause an instability, UNCONFIRMED.
 - I'm using gentoo the likelyhood of missing a libs/deps is high since gentoo came with bare minimum by default. Which libraries are required? Do i just download them from some site that hosts .dll and place them in required folders?

- strace for wine was suggested,
- Trying: `strace -o dishonored_trace.log -f -s 10000000 WINEARCH='win64' WINEPREFIX='/home/kreyren/.wine-64' wine /home/kreyren/.wine-64/drive_c/Program\ Files\ \(x86\)/Steam/steamapps/common/Dishonored2/Dishonored2.exe`
 - `wine start /unix '/home/kreyren/.wine-64/drive_c/Program Files (x86)/Steam/steamapps/common/Dishonored2/Dishonored2.exe`  was suggested, Source https://wiki.winehq.org/Start, 
 - Source  https://wiki.winehq.org/Wine_User%27s_Guide  - Section 3
  - Related 3.1.1.1 Using wine start
  - `If you prefer to use a Unix style pathname, use the /unix option to start, e.g.: wine start /unix "$HOME/installers/TronSetup.exe"` was noted, but is it really important for using `wine`? Seems to be relevant for CDs. (?)
 - Command above is creating new prefix in .wine, using WINEPREFIX argument. `WINEPREFIX='/home/kreyren/.wine-64' wine start /unix '/home/kreyren/.wine-64/drive_c/Program Files (x86)/Steam/steamapps/common/Dishonored2/Dishonored2.exe`
 - Results in `Startup Error: Dishonored 2 requires Windows 7 or higher.` -> setting winecfg for 64-bit prefix.
 - Strace present here: https://drive.google.com/file/d/11qYCBeP-jOTTD8JdcKvd3M5cztFU4Jyv/view?usp=sharing (too big for github)
  - Video: https://www.youtube.com/watch?v=mAhcRqM55dc 
 - Using DXVK_HUD was suggested. `DXVK_HUD=devinfo,fps,frametimes,drawcalls,pipelines,memory,version' WINEPREFIX='/home/kreyren/.wine-64' wine start /unix '/home/kreyren/.wine-64/drive_c/Program Files (x86)/Steam/steamapps/common/Dishonored2/Dishonored2.exe`
 - Shader cache relevant? Source: https://www.phoronix.com/scan.php?page=news_item&px=DXVK-Shader-Cache-September
  - https://github.com/RXT067/Research/blob/master/WINE-Dishonored2/IRC_WINE_SUGGESTIOn
  - https://github.com/doitsujin/dxvk/blob/master/README.md#state-cache
   - Using `DXVK_STATE_CACHE='/tmp/dishonored' DXVK_HUD='devinfo,fps,frametimes,drawcalls,pipelines,memory,version' WINEPREFIX='/home/kreyren/.wine-64' wine start /unix '/home/kreyren/.wine-64/drive_c/Program Files (x86)/Steam/steamapps/common/Dishonored2/Dishonored2.exe'`
   - updated system on multilib, reinstalled wine prefixes + game and upgraded system's mesa, vulkan-loader on 9999 = results in graphical issues, suspect mesa/vulkan-loader issue. Problems with performance may be related to shaders.

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
