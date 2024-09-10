#!/usr/bin/python3

# Convert shellcode to a binary

import sys, os, stat
from pwn import *

context(os="linux", arch="amd64", log_level="error")
shellcode = sys.argv[1]
ELF.from_bytes(unhex(shellcode)).save(sys.argv[2])
os.chmod(sys.argv[2], stat.S_IEXEC)
