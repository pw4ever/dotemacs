#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TARGET=~/.emacs
cp -v ${DIR}/.emacs ${TARGET}

TARGET=~/.emacs.d
mkdir -p ${TARGET}
cp -vr ${DIR}/.emacs.d/config ${TARGET}
