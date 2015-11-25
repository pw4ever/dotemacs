#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME=".emacs"
SOURCE="$DIR/$NAME"
cp -v "$SOURCE" "$HOME"

NAME=".emacs.d"
SOURCE="$DIR/$NAME"
cp -vr "$SOURCE" "$HOME"
