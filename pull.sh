#!/bin/bash - 

_rootdir=${_rootdir:-"$(dirname "$(readlink -f "$0")")"}

if hash rsync 2>/dev/null; then
  cmd="rsync -rvhtW --no-compress --progress"
else
  cmd="cp -rv"
fi

eval $cmd \"$HOME\"/.emacs \"$_rootdir\"

_target="$_rootdir/.emacs.d"
mkdir -p "_target"
eval $cmd \"$HOME\"/.emacs.d/{elpa,config} \"$_target\"
find "$_target" -name '*.elc' -delete # remove byte-compiled elisp files
unset _target
