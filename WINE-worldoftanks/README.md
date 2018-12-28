Related: https://bugs.winehq.org/show_bug.cgi?id=46378

======

Clear wineprefix

winetricks dxvk corefonts

System info: https://paste.pound-python.org/show/ul4WeP2SZHzJTV0LAYDL/

Launcher crashes https://paste.pound-python.org/show/XCLTQqGOQE5ghQvH4ASC/

== Next

based on https://appdb.winehq.org/objectManager.php?sClass=version&iId=36493&iTestingId=103745

Trying WINEARCH="win64" in new prefix

winetricks dxvk corefonts

Launcher crashes again https://paste.pound-python.org/show/7Z1Ju38Qm0IJN5CPzGXv/

Conclusion: WINEARCH is irelevant.

== Next 

Clear prefix

WINEPREFIX="/home/kreyren/.wine-wot" winetricks dxvk corefonts win7 vcrun2008 vcrun2017

Related: https://appdb.winehq.org/objectManager.php?sClass=version&iId=36493&iTestingId=101904&bShowAll=true

Same issue: https://paste.pound-python.org/show/2prAeL8wleZaQ6npEUnG/

Trying winetricks d3dx9_36 d3dx9_43 vcrun2008 msxml3 wininet corefonts ie8 d3dcompiler_43

ei8 is not working on multilib prefix?

Turned off uploading

Fixed the launcher.. # TODO: Needs investigating 

Same issue: https://paste.pound-python.org/show/nwsge6e2b8hW02ySQbeX/

seems as connection problem

win7 wasn't set, trying again..

Same issue

trying gallium9

Same issue 

Adding `WINEPREFIX="/home/kreyren/.wine-wot" winetricks d3dx9 d3dx10 d3dx11_43 dotnet472 dotnet40 dxvk vcrun2012 xact`

```
016d:err:rpc:I_RpcReceive we got fault packet with status 0x3e6
00df:fixme:dbghelp:elf_search_auxv can't find symbol in module
```
investigating 

Related: https://forum.winehq.org/viewtopic.php?f=8&t=30225

`WINEPREFIX="/home/kreyren/.wine-wot" wine notepad` is not affected => WOT issue

Related: https://appdb.winehq.org/objectManager.php?sClass=application&iId=18336

adding vcrun2015 with --force

Related: https://lutris.net/games/install/7701/view

Trying w10

Same issue

== NEXT

trying proton

Proton doesn't care 

== NEXT 

Related: https://www.playonlinux.com/en/app-1592-World_Of_Tanks.html

Trying POL

Won't open https://paste.pound-python.org/show/RF3lnR7wGwKroKXhJizD/

== NEXT

Trying lutris

Wont even download..

== NEXT

Give up


