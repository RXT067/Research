Concept: Allow me gaming on gentoo while emerge is chooching packages

Expected: if 'important app' needs system resources -> share them untill it's satisfied -> share waste across other processes.

---

## SCHEDULERS
- Con Kolivas' MuQSS process scheduler.
- Completely Fair Scheduler

### Con Kolivas' MuQSS process scheduler
Scales across all threads -> helps with freezes that are present on CFS.

#### References
- http://ck.kolivas.org/patches/muqss/sched-MuQSS.txt?fbclid=IwAR00BNBnMg02Wv2MzqWzKDJsIUGNmw6IXEAJOMjoyjIGEfP7gnAiqQoaHMg

### Completely Fair Scheduler (CFS)
_Present by default on most kernels_ (based on wikipedia)

Uses sched_entity

`chrt` command in linux
- it manages SCHED_* variables that are recognized in linux(?)
- Linux kernel has a scheduler - TODO: find a corresponding kernel configuration
  - is controlled by SCHED_* variables

I have no hugging idea what does the kernel.org documentation is trying to say

#### References 
- https://cs.wikipedia.org/wiki/Completely_Fair_Scheduler
- https://en.wikipedia.org/wiki/Completely_Fair_Scheduler
- https://www.kernel.org/doc/Documentation/scheduler/sched-design-CFS.txt
- https://www.linuxjournal.com/node/10267

---

## ADDITIONAL INFORMATIONS
Lower your MAKEOPTS -> unemergefull, would cause slow compilation and affect 'important app'.

Since Linux 2.6.23, the default scheduler is CFS, the "Completely Fair Scheduler". The CFS scheduler replaced the earlier "O(1)" scheduler. - http://man7.org/linux/man-pages/man7/sched.7.html

### NICE
PORTAGE_NICENESS="19" is not sufficient assuming problem with a RAM -> if game needs lots of RAM and portage pulls package that needs more RAM then it's physically available the system is going to hard freeze.

`CONFIG_SCHED_AUTOGROUP` in kernel affects how nice works(?)

### CGROUP
https://en.wikipedia.org/wiki/Cgroups

Developed by google ppl

A control group (abbreviated as cgroup) is a collection of processes that are bound by the same criteria and associated with a set of parameters or limits. These groups can be hierarchical, meaning that each group inherits limits from its parent group. The kernel provides access to multiple controllers (also called subsystems) through the cgroup interface;[2] for example, the "memory" controller limits memory use, "cpuacct" accounts CPU usage, etc.




