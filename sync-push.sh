#!/bin/bash - 

# http://stackoverflow.com/a/246128/1527494
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

rm -rf ~/.emacs
rm -rf ~/.emacs.d/config
rm -rf ~/.emacs.d/elpa
${DIR}/push.sh
