Concept: Allow me gaming on gentoo while emerge is chooching packages

Expected: if 'important app' needs system resources -> share them untill it's satisfied -> share waste across other processes.

### MISC
Lower your MAKEOPTS -> unemergefull, would cause slow compilation and affect 'important app'.

### NICE
PORTAGE_NICENESS="19" is not sufficient assuming problem with a RAM -> if game needs lots of RAM and portage pulls package that needs more RAM then it's physically available the system is going to hard freeze.

`CONFIG_SCHED_AUTOGROUP` in kernel affects how nice works(?)

### CGROUP
https://en.wikipedia.org/wiki/Cgroups

Developed by google ppl



### SCHED
`chrt` command in linux
