;; https://github.com/m2ym/direx-el
(require 'direx)

(eval-after-load "popwin"
  '(progn
	 (push '(direx:direx-mode :position left :width 25 :dedicated t)
		   popwin:special-display-config)
	 (global-set-key (kbd "C-x C-j")
					 'direx:jump-to-directory-other-window)))
