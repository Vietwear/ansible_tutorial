import os,syspath
print os.path.expanduser('~')
print os.path.dirname('/Users/vutrannguyen')
print os.path.basename('/')
import random
from imp import reload
for i in range(10):
    x = random.random()
    print x
def print_lyrics():
    print "I'm a lumberjack, and I'm okay."
    print 'I sleep all night and I work all day.'



if __name__ == '__main__':
    syspath.anhyeu()
    print_lyrics()
    reload(syspath)