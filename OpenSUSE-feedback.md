OpenSUSE Tumbleweed

## Zypper update is not sane, but allowed to be invoked?

```
Kreyren, The Ultimate Breakerdnes v 13:57
How do you stabilize geeko? I have uptime under 15 hours with it..
LCPdnes v 13:58
what are you doing to it
Kreyren, The Ultimate Breakerdnes v 13:59
nothin i just updated it using zypper update o.o
+ it has performance issues alike games locked on 60FPS are dropping under 50 with configuration that held rock solid on gentoo
LCPdnes v 14:00
with tumbleweed always zypper dup
zypper update will most likely kill your system
Kreyren, The Ultimate Breakerdnes v 14:01
now you tell me! :smile:
how do i rescue it then? zypper dup?
LCPdnes v 14:01
sure, try that
Kreyren, The Ultimate Breakerdnes v 14:01
why zypper update breaks it?
ziltiBOTdnes v 14:04
"zypper update will most likely kill your system"

Is that a new "feature"? It used to just do nothing on Tumbleweed
That's kinda important to know...
LCPdnes v 14:10
nah, it always did something
there is different solver in both commands
and tumbleweed requires upgrade solver
```

Needs investigation

## Xorg is not supported

Why? WHYYYYYY

## OpenRC is not supported

Why? WHYYYYYY

## BUG: Video group permission issue
New user after installation of Tumbleweed is not added in video group -> causes permission issues with /dev/dri/card0

## BUG: Radeon is not blacklisted 
Radeon is not blacklisted automatically -> Causes VRK_ERROR_INITIALIZATION_FAILED on some systems

```
/home/abuild/rpmbuild/BUILD/Vulkan-Tools-1.1.97.0/vulkaninfo/vulkaninfo.c:3847: failed with VK_ERROR_INITIALIZATION_FAILED
kreyren@linux-n6tn:~> 
```

Solution is to blacklist radeon from loading since radeon doesn't support vulkan and is used for MESA on OpenGL only..

Reproducable always on AMD7870 GPU

## Lutris is broken in OpenSUSE

https://github.com/PhoenicisOrg/scripts/pull/783#issuecomment-463306885
