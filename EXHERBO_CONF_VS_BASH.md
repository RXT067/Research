Expected: Measure load time of .conf vs .bash


## REFERENCES
#linux on freenode
```
<kreyren> anyone benchmarked loading time of .conf vs .bash?
<01> kreyren: load by what?
<01> kreyren: what would go in each of these files?
<kreyren> 01, anything, was told that .conf is faster
<01> kreyren: that's meaningless in a void context
<kreyren> 01: anything relevant
<02> i benchmark with "time" command
<01> kreyren: if you have a shell script and you "configure" it by sourcing another shell script, such as a file with a .bash extension, sourcing will be much faster than writing a loop to read configuration out of some other format using shell code.
<03> 05: to us humans it doesn't make diff, the machine knows it's an archive, and it may be so that AR archives and LIB archives may share the same magic bit which makes things even more confusing.
<01> kreyren: if you're not configuring the behavior of a shell script then I'm not at all clear on how bash enters in to it
<kreyren> 01, confirm that if both files has same variable with same value -> load time is same?
<01> kreyren: the same as what?
<01> kreyren: how are you "load"ing them? From where?
<05> 03: again, yeah, linux knows its an archive. who knows what mingw thinks it is
<kreyren> example: `variable: 123` vs `VARIABLES="123"` 
<03> 01: so why are there .a files then that happen to be in ELF and ASCII format
<03> 05 clearly confirmed there is a discrepancy
<01> kreyren: if you have a shell script and in it you say "source foo.conf" and then you cp foo.conf foo.bash and change your shell script to "source foo.bash" there will be no difference in time to source.
<01> kreyren: file NAMES are irrelevant
<kreyren> thats what i wanted to know thanks
<01> kreyren: if you have a file of lines like "key: value\n" and you want to convert each key in the file in to a variable in your shell script then you must write a read loop. This will be much, much slower than having a file with lines like 'key=value\n' and having bash just source that file.
<01> kreyren: but I propose to you a thought experiment: if your shell script requires a config file, should it still be written in shell?
```
