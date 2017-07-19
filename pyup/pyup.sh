#!/bin/zsh

# pyup
# 
# A simple and lazy way to set up Python projects. This script creates a
# virtualenv with either versions of Python interpreters, upgrades pip
# configurations and adds enviroment helper scripts and Makefiles
# 
# Usage:
#   ./pyup proj_name <python_ver>


mkdir $1
cd $1
dirname="$(basename $1)"

# select version of Python for virtualenv - default is 2
if [ "$2" = "3" ]; then
    virtualenv -p /usr/bin/python3 .venv3
else
    virtualenv .venv
fi

# initialize project structure
mkdir $dirname tests
touch requirements.txt $dirname/__init__.py
echo ".venv*/\n*.pyc\n__pycache__/" > .gitignore

# add helper scripts and directories
cp ~/helper-scripts/pyup/Makefile .

# update virtualenv
source .venv*/bin/activate
pip install -U pip
deactivate
