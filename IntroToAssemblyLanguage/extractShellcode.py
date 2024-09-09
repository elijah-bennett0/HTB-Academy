#!/usr/bin/python3

import sys
from pwn import *

context(os="linux", arch="amd64", log_level="error")

file = ELF(sys.argv[1]) # give name of binary as arg
shellcode = file.section(".text")
print(shellcode.hex())
