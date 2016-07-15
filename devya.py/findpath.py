#!/usr/bin/env python3
############################ METADATA ##########################################
#1.PROGRAM   : findpath.py
#2.COPYRIGHT©: SVAKSHA, 2016-Present.
#3.AUTHOR(s) : SVAKSHA, http://svaksha.com/pages/Bio
#4.LICENSE   : GNU AGPLv3 subject to meeting all the terms in the LICENSE file.
#5.TECHNICAL : Small snippets to find the path of files in a directory.
###₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹₹
# PURPOSE :
#   Checks the current path and walks the directory to find upper level, current
#   directory and child directory.  
################################################################################

import os, os.path
import re
import sys
import subprocess
from subprocess import *
from pathlib import Path


homedir = os.path.expanduser('~')
oscwd = os.getcwd()
print(homedir, oscwd)
program_name = 'add_program_name.py'

homedir = os.path.expanduser('~') 
oscwd = os.getcwd()             
print("printing the homedir and oscwd:", homedir, oscwd)
program_name = 'add_program_name.py'
print("printing the os.path.dirname", os.path.dirname(os.path.realpath(__file__)))
print("printing the sys.path", (sys.path[0]))  

fullpath = os.path.abspath(homedir)    
print("printing the fullpath", fullpath)
print ("printing the file", __file__)  
print (os.path.abspath(os.path.join(os.getcwd(),os.path.pardir))) # this works
print (os.chdir(os.path.dirname(os.getcwd())))
print (Path(homedir).parent)

fullpath = (os.path.abspath(os.path.join(homedir, os.pardir)))
print ("Fullpath", fullpath)
parent_path = (os.path.abspath(os.path.join(os.path.dirname(__file__), "..")))
print ("The parent path is: ", parent_path)
# to join low-level dirname
path_samelevel = (os.path.join(parent_path), "data")
print ("The path to join lower level directory is:", path_samelevel)

