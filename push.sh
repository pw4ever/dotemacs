#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v ${DIR}/.emacs ~/.emacs
cp -vr ${DIR}/.emacs.d/config ~/.emacs.d/
