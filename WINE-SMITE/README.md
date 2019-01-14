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

Relevant: http://forums.smitegame.com/showthread.php?181616-Bad-command-line-(SMITE) -> Hugging useless

Relevant: http://forums.paladins.com/showthread.php?87221-Command-Line-error -> somewhat helpful

Invoked `kreyren@dreamon ~/Games/SMITE/drive_c/Program Files (x86)/Hi-Rez Studios $ WINEPREFIX="/home/kreyren/Games/SMITE" wine SelfUpdater.exe`
- Is hanging on `Updating Hi-Rez Launcher`, no progress.

```
kreyren@dreamon ~/Games/SMITE/drive_c/Program Files (x86)/Hi-Rez Studios $ WINEPREFIX="/home/kreyren/Games/SMITE" wine HiRezLauncherUI.exe 
000b:fixme:winediag:start_process Wine Staging 4.0-rc5 is a testing version containing experimental patches.
000b:fixme:winediag:start_process Please mention your exact version when filing bug reports on winehq.org.
0026:err:hid:PNP_AddDevice Cannot parse Report Descriptor
0026:err:plugplay:handle_bus_relations AddDevice failed for driver L"WineHID"
0026:err:plugplay:try_add_device Building report descriptor failed, removing device
0009:fixme:gdiplus:resample_bitmap_pixel Unimplemented interpolation 7
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style
0009:fixme:wincodecs:JpegDecoder_Frame_CopyPalette (0x13765c,0x140cb0): stub
0009:fixme:wincodecs:JpegDecoder_Frame_CopyPalette (0x1a9e94,0x1ac8c8): stub
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style
0009:fixme:gdiplus:GdipGetLineSpacing ignoring style

Unhandled Exception:
System.TypeInitializationException: The type initializer for 'Hirez.Patcher.PatcherState' threw an exception. ---> System.InvalidProgramException: Invalid IL code in Hirez.Patcher.PatcherState:.cctor (): IL_000b: stsfld    0x04000032


   --- End of inner exception stack trace ---
  at Hirez.Patcher.PatcherEngine.LoadStateFile () [0x0006d] in <2dadebbf471a48f0a3c31ec6f5a8feb8>:0 
  at Hirez.Patcher.PatcherEngine.Init (System.Int32 gameID, System.Int32 productID, System.Boolean steamMode, System.String steamFolder) [0x00157] in <2dadebbf471a48f0a3c31ec6f5a8feb8>:0 
  at LauncherV7.LauncherV7.EngineStartup () [0x00000] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
  at LauncherV7.LauncherV7.FinishStartup () [0x00044] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
  at LauncherV7.LauncherV7.tDeferStart_Tick (System.Object sender, System.EventArgs e) [0x0000c] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
  at System.Windows.Forms.Timer.OnTick (System.EventArgs e) [0x00008] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Timer.FireTick () [0x00000] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at (wrapper remoting-invoke-with-check) System.Windows.Forms.Timer:FireTick ()
  at System.Windows.Forms.XplatUIWin32.GetMessage (System.Windows.Forms.MSG& msg, System.IntPtr hWnd, System.Int32 wFilterMin, System.Int32 wFilterMax, System.Boolean blocking) [0x00287] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.XplatUIWin32.GetMessage (System.Object queue_id, System.Windows.Forms.MSG& msg, System.IntPtr hWnd, System.Int32 wFilterMin, System.Int32 wFilterMax) [0x00000] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.XplatUI.GetMessage (System.Object queue_id, System.Windows.Forms.MSG& msg, System.IntPtr hWnd, System.Int32 wFilterMin, System.Int32 wFilterMax) [0x00000] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Application.RunLoop (System.Boolean Modal, System.Windows.Forms.ApplicationContext context) [0x00331] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Application.Run (System.Windows.Forms.ApplicationContext context) [0x00011] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Application.Run (System.Windows.Forms.Form mainForm) [0x00006] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at LauncherV7.Program.Main (System.String[] args) [0x0000c] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
[ERROR] FATAL UNHANDLED EXCEPTION: System.TypeInitializationException: The type initializer for 'Hirez.Patcher.PatcherState' threw an exception. ---> System.InvalidProgramException: Invalid IL code in Hirez.Patcher.PatcherState:.cctor (): IL_000b: stsfld    0x04000032


   --- End of inner exception stack trace ---
  at Hirez.Patcher.PatcherEngine.LoadStateFile () [0x0006d] in <2dadebbf471a48f0a3c31ec6f5a8feb8>:0 
  at Hirez.Patcher.PatcherEngine.Init (System.Int32 gameID, System.Int32 productID, System.Boolean steamMode, System.String steamFolder) [0x00157] in <2dadebbf471a48f0a3c31ec6f5a8feb8>:0 
  at LauncherV7.LauncherV7.EngineStartup () [0x00000] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
  at LauncherV7.LauncherV7.FinishStartup () [0x00044] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
  at LauncherV7.LauncherV7.tDeferStart_Tick (System.Object sender, System.EventArgs e) [0x0000c] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
  at System.Windows.Forms.Timer.OnTick (System.EventArgs e) [0x00008] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Timer.FireTick () [0x00000] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at (wrapper remoting-invoke-with-check) System.Windows.Forms.Timer:FireTick ()
  at System.Windows.Forms.XplatUIWin32.GetMessage (System.Windows.Forms.MSG& msg, System.IntPtr hWnd, System.Int32 wFilterMin, System.Int32 wFilterMax, System.Boolean blocking) [0x00287] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.XplatUIWin32.GetMessage (System.Object queue_id, System.Windows.Forms.MSG& msg, System.IntPtr hWnd, System.Int32 wFilterMin, System.Int32 wFilterMax) [0x00000] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.XplatUI.GetMessage (System.Object queue_id, System.Windows.Forms.MSG& msg, System.IntPtr hWnd, System.Int32 wFilterMin, System.Int32 wFilterMax) [0x00000] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Application.RunLoop (System.Boolean Modal, System.Windows.Forms.ApplicationContext context) [0x00331] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Application.Run (System.Windows.Forms.ApplicationContext context) [0x00011] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at System.Windows.Forms.Application.Run (System.Windows.Forms.Form mainForm) [0x00006] in <dfcf5e19b3744f6abc3507fe9dffa1dd>:0 
  at LauncherV7.Program.Main (System.String[] args) [0x0000c] in <82e344d7cfe84c8aa0d20d1fdfeab1ce>:0 
```

Relevant : https://steamcommunity.com/app/386360/discussions/2/1474222595302379301/

```
3. In SMITE launcher, click on cog button in left bottom corner, then click on "troubleshoot", then try to re-run prerequisites, if it didn't helped, validate/repair and reinstall. You want to disable your antivirus while doing this, to prevent corrupted visual c++ redistributable and visual studio installation. Fixes msvcp110.dll error.
64-bit Visual C++ Redist is NOT included in prerequisities!!! Google it!!!
```

C++ (vcrun) is mandatory? Installed vcrun2008 and vcrun2017 -> same issue
- Warned about this may fail on non-XP version -> trying winxp

Invoked `WINEPREFIX="/home/kreyren/Games/SMITE" winetricks --force winxp vcrun2008 vcrun2017`

Results in `bad command line` error

Trying to install dotnet472 - Download(?), Why did it fail on proton? -> results in error after https://i.imgur.com/0uqoY64.png


