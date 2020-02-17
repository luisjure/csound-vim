#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
generates a list of opcodes form the command "csound -z"
this file is part of csound-vim
https://github.com/luisjure/csound-vim
Last change: 2020-02-16

@author: lj
"""

import subprocess as sp
import re
import os
import shutil

# exit if Csound not found
csound=shutil.which("csound")
if csound==None:
    print("Csound not found. Nothing to do")
    exit()

# output file
outfile="./syntax/mycsound_opcodes"

# check if the file already exists and whether to overwrite it or not
if os.path.isfile(outfile):
    mycsound=open(outfile, "r")
    csound_version=mycsound.readline()
    print("The file {0} already exists".format(outfile))
    print("for {0}".format(csound_version[2:]), end="")
    cont = ""
    while cont == "":
        x = input("Do you want to overwrite it? (y/n): ")
        if x.lower() in ('y', 'yes'):
            cont="yes"
        elif x.lower() in ('n', 'no'):
            print("The file {0} will not be replaced, exiting".format(outfile))
            cont="no"
            exit()
        else:
            print("Not a valid option, please enter y[es] or n[o]")

# dump the output of csound -z into a string and split by lines into a list
output = sp.check_output("csound -z 2>&1; exit 0", shell=True, universal_newlines=True)
output_split = output.split('\n')

# find the beginning of the opcode list
x1 = output_split.index("")

for x in output_split:
    if x.startswith("--Csound version"):
        csound_version = '" ' + x[2:]
    # find the end of the opcode list
    elif re.match("^\d* opcodes", x):
        x2 = output_split.index(x)

# crop to the list of opcodes and flatten the list
opcode_list = [x.split() for x in output_split[x1+1:x2]]
opcodes = [opcode for line in opcode_list for opcode in line]

# remove words related to instrument and opcode definition
# and control opcodes
words = [
        "cggoto",
        "cigoto",
        "cingoto",
        "ckgoto",
        "cngoto",
        "cnkgoto",
        "endin",
        "endop",
        "goto",
        "igoto",
        "instr",
        "kgoto",
        "loop_ge",
        "loop_gt",
        "loop_le",
        "loop_lt",
        "opcode",
        "rigoto",
        "tigoto",
        "timout"
        ]

for j in words:
    opcodes.remove(j)

# calculate number of opcodes
opcodes_number = str(len(opcodes))
# opcode_number = '" ' + str(len(opcodes)) + ' opcodes'
opcodes.sort()

with open(outfile, 'w') as outf:
    print("\nWriting list of {0} opcodes to {1}\n".format(opcodes_number, outfile))
    outf.write(csound_version + "\n")
    outf.write('" ' + opcodes_number + " opcodes\n")
    for opcode in opcodes:
        outf.write("syn keyword CsOpcode " + opcode + "\n")

