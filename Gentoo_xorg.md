This is a research for xorg on Gentoo using USE="-*" on amdgpu, debugging on chroot environment.

### FROM ROOT
```
sysresccd / # startx-lxqt
/usr/bin/startx-lxqt: line 146: hostname: command not found
xauth:  file /root/.serverauth.3639 does not exist


X.Org X Server 1.20.3
X Protocol Version 11, Revision 0
Build Operating System: Linux 4.18.18-gentoo-r1 x86_64 Gentoo
Current Operating System: Linux sysresccd 4.14.80-std532-amd64 #2 SMP Sun Nov 11 18:59:44 UTC 2018 x86_64
Kernel command line: initrd=initram.igz BOOT_IMAGE=rescue64 docache
Build Date: 05 February 2019  05:09:00AM
 
Current version of pixman: 0.36.0
	Before reporting problems, check http://wiki.x.org
	to make sure that you have the latest version.
Markers: (--) probed, (**) from config file, (==) default setting,
	(++) from command line, (!!) notice, (II) informational,
	(WW) warning, (EE) error, (NI) not implemented, (??) unknown.
(==) Log file: "/var/log/Xorg.1.log", Time: Tue Feb  5 05:57:33 2019
(==) Using config directory: "/etc/X11/xorg.conf.d"
(==) Using system config directory "/usr/share/X11/xorg.conf.d"
(EE) 
Fatal server error:
(EE) no screens found(EE) 
(EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
(EE) Please also check the log file at "/var/log/Xorg.1.log" for additional information.
(EE) 
(EE) Server terminated with error (1). Closing log file.
^Cxinit: giving up
xinit: unable to connect to X server: Connection refused
xinit: unexpected signal 2
```

### FROM USER:
```
startx-lxqt
/usr/bin/startx-lxqt: line 146: hostname: command not found
xauth:  error in locking authority file /home/kreyren/.serverauth.4116
xauth:  timeout in locking authority file /root/.Xauthority
^C^Cxauth:  timeout in locking authority file /root/.Xauthority

(EE) 
Fatal server error:
(EE) Cannot open log file "/home/kreyren/.local/share/xorg/Xorg.1.log"
(EE) 
(EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
(EE) 
xinit: giving up
xinit: unable to connect to X server: Connection refused
xinit: server error
Couldn't get a file descriptor referring to the console
```

**(EE) no screens found(EE)** is important now.
- Kernel configuration is correct assuming that same configuration worked on profile use flags.
- udev?
 - is emerged.. ?
- system didn't change resolution once booted -> AMDGPU not loaded, confirmed in `lspci -k | grep kernel`.
 - radeonsi is disabled in grub and not loaded.
 - xauth?

`nano /etc/portage/package.use/00-custom.use -> Segmentation fault`
- File is present and non-corrupted -> nano broken?
