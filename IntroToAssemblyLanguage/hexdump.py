#!/bin/python3
import sys
from pwn import *

context(os="linux", arch="amd64", log_level="error")
binary = ELF(sys.argv[1])
print(binary.section(".text").hex())
