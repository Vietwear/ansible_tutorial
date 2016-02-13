import sys
sys.stderr.write('this is stderr text')
sys.stderr.flush()
sys.stdout.write('this is stdout text\n')
print(sys.argv[0])
if len(sys.argv) > 1:
    print(sys.argv[1])
else:
    print(sys.argv[0])
