#!/bin/bash
DIR=$(dirname "$(readlink -f "$0")")
cp "$DIR/_vimrc" "$DIR/_vimrc_old"
cp ~/.vimrc "$DIR/_vimrc"
