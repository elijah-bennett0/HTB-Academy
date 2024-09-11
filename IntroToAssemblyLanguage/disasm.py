#!/bin/python3
import sys
from pwn import *

shellcode = sys.argv[1]
context(os="linux", arch="amd64", log_level="error")
print(disasm(unhex(shellcode), arch="amd64"))
