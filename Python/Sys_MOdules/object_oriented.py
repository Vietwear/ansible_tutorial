#!/usr/bin/python
import random
class mynum(object):
    def __init__(self):
        print "calling __init__"
        self.val=0
    def increment(self):
        self.val=self.val + 1
dd=mynum()
dd.increment()
print dd.val
class myclass(object):
    def dothis(self):
        self.rand_val=random.randint(1,10)
myinst=myclass()
myinst.dothis()
print(myinst.rand_val)
print;print