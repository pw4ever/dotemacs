#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

TARGET=${DIR}/.emacs
cp -v ~/.emacs ${DIR}/.emacs

TARGET=${DIR}/.emacs.d/config/
mkdir -p ${TARGET}
cp -vr ~/.emacs.d/config/*.el ${TARGET}
