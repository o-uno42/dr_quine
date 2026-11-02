WRITEFILE=lambda quine: open("Grace_kid.py", "w").write(quine)
PROGRAM=lambda src:WRITEFILE(src %(34,34,34,34,10,10,34,DNA,34,10,10))
DNA="WRITEFILE=lambda quine: open(%cGrace_kid.py%c, %cw%c).write(quine)%cPROGRAM=lambda src:WRITEFILE(src %%(34,34,34,34,10,10,34,DNA,34,10,10))%cDNA=%c%s%c%cPROGRAM(DNA)%c"
PROGRAM(DNA)
