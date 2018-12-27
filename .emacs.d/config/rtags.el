;; https://github.com/Andersbakken/rtags

;; preparation
;; for i in gcc g++ cc c++; do ln -sf $(which gcc-rtags-wrapper.sh) ~/bin/$i; done

(require 'gtags)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)