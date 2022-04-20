#!/bin/zsh

# get all the installed packages of latex.
tlmgr list --only-installed > pack/lang/opt/tex/PACKAGES.txt

git add after/
git add autoload
git add ftplugin
git add lua/
git add misc/
git add pack
git add snippets/
git add spell/
git add syntax/
git add filetype.vim

git add .gitignore
git add ginit.vim
git add init.vim
git add notes.md
git add .vimdotfiles.zsh
