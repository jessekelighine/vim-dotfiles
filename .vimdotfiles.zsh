#!/bin/zsh

tlmgr list --only-installed > pack/lang/opt/tex/PACKAGES.txt

git add .
