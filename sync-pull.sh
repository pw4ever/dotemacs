#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

rm -rf "$_rootdir"/.emacs
rm -rf "$_rootdir"/.emacs.d/{config,elpa}

"$_rootdir/pull.sh"
