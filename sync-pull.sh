#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ${DIR}/.emacs
rm -rf ${DIR}/.emacs.d/config
rm -rf ${DIR}/.emacs.d/elpa
${DIR}/pull.sh
