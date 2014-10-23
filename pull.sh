#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

cp -v ~/.emacs ${DIR}/.emacs
cp -vr ~/.emacs.d/config ${DIR}/.emacs.d/