#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

rm -rf "$HOME"/.emacs
rm -rf "$HOME"/.emacs.d/{config,elpa}

"$_rootdir/push.sh"
