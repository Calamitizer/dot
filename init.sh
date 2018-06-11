#!/usr/bin/env bash
# local.sh

# To run this script locally, run:
# $ bash <(curl -s "https://raw.githubusercontent.com/calamitizer/dot/master/init.sh")
# This will run a script to clone this repo locally
# and copy stuff to relevant places.

cd ~

sudo apt-get install -qqy curl git vim
declare -r URL_DOT="https://github.com/calamitizer/dot.git"
declare -r D_DOT=~/git/dot
git clone -q ${URL_DOT} ${D_DOT}

declare -r D_TILDE=${D_DOT}/tilde

### Copy static files ###

cp -r ${D_TILDE}/.bash{rc,_{logout,profile},-defs} ~
cp ${D_TILDE}/.git{config,ignore-global} ~
cp -r ${D_TILDE}/.config ~

### Vim ###
cp ${D_TILDE}/.vimrc ~

declare -r D_VIM=~/.vim
mkdir -p ${D_VIM}/{bundle,colors}

declare -r URL_BADWOLF="https://raw.githubusercontent.com/sjl/badwolf/master/colors/badwolf.vim"
cd ${D_VIM}/colors; curl -s ${URL_BADWOLF} -O; cd - > /dev/null

declare -r URL_VUNDLE="https://github.com/VundleVim/Vundle.vim.git"
cd ${D_VIM}/bundle; git clone -q ${URL_VUNDLE}; cd - > /dev/null
vim +PluginInstall +qall
