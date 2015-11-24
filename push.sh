#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME=".emacs"
SOURCE="$DIR/$NAME"
TARGET="$HOME/$NAME"
cp -v "$SOURCE" "$TARGET"

NAME=".emacs.d"
SOURCE="$DIR/$NAME"
TARGET="$HOME/$NAME"
mkdir -p "$TARGET"
cp -vr "$SOURCE" "$TARGET"
