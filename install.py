#!/usr/bin/python3

## This script is intended to install all dotfiles writen in this repository to the location for each of the files, f.eg.:
# For files on CWD
# vimrc, moved to ~/.vimr
# For direcories: 
# foo, moved to ~/.foo and its child folder/directories, not changing the subdirectory naming
import os
import os
import shutil

## Add here the files you intend to install
FILES = [
    'vimrc'
] 

homeDir = os.environ['HOME']
for x in files:
    shutil.copy(x, os.path.join(homeDir, "." + x))
