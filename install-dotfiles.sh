#!/bin/bash

cd "$(dirname "$0")"

git submodule init && git submodule update

cd .awesome-terminal-fonts
./install.sh
