#!/usr/bin/env python
import subprocess
def changename(oldname,newname):
    temp=oldname.split('.')
    name=newname+'.'+temp[1]
    subprocess.call(["mv",oldname,name])
def runBash(cmd):
    p=subprocess.Popen(cmd,shell=True,stdout=subprocess.PIPE)
    out=p.stdout.read().strip()
    return out.split('\n')
def changallname(oldnamesbases,newnamebases):
    files=runBash("ls")
    for afile in files:


oldname="listfile.py"
newname="new"
changename(oldname,newname)