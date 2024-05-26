#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
cp ~/.vimrc ~/.vimrc_old
cp "$DIR/_vimrc" ~/.vimrc
