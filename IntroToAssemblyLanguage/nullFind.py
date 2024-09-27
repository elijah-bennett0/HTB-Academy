import sys

shellcode = sys.argv[1]
print("%d bytes - Found NULL byte" % (len(shellcode)/2)) if [i for i in shellcode if i == 0] else print("%d bytes - No NULL bytes" % (len(shellcode)/2))
