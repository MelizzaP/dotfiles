#!/bin/bash

# Only install fonts if in a Linux Windows Manager or MacOS
if [[ (-z "$GDMSESSION") || (`uname` == "Darwin") ]]; then
  powerline_dir="/tmp/powerline-fonts"

  # Download fonts
  git clone https://github.com/Lokaltog/powerline-fonts.git $powerline_dir

  # Install fonts
  $powerline_dir/install.sh

  rm -rf $powerline_dir
fi