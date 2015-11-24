#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

NAME=.emacs
SOURCE="$HOME/$NAME"
TARGET="$DIR/$NAME"
cp -v "$SOURCE" "$TARGET"

NAME=".emacs.d/config"
SOURCE="$HOME/$NAME"
TARGET="$DIR/$NAME"
mkdir -p "$TARGET"
cp -vr "$SOURCE/"*.el "$TARGET"
cp -vr "$SOURCE/"00deps "$TARGET"

NAME=".emacs.d/config/pre-package-load.d"
SOURCE="$HOME/$NAME"
TARGET="$DIR/$NAME"
mkdir -p "$TARGET"
cp -vr "$SOURCE/"*.el "$TARGET"

NAME=".emacs.d/config/post-package-load.d"
SOURCE="$HOME/$NAME"
TARGET="$DIR/$NAME"
mkdir -p "$TARGET"
cp -vr "$SOURCE/"*.el "$TARGET"
