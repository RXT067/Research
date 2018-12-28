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

