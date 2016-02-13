#!/usr/bin/env python
import subprocess
cmd1='echo A listing of the directory:'
cmd2="ls -al"
cmd=[cmd1,cmd2]
for cd in cmd:
    subprocess.call(cd,shell=True)


