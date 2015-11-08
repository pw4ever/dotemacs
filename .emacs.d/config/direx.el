;; https://github.com/m2ym/direx-el
(require 'direx)

(global-set-key (kbd "<f7>")
				'direx:jump-to-directory-other-window)

(eval-after-load "popwin"
  '(progn
	 (push '(direx:direx-mode :position left :width 25 :dedicated t)
		   popwin:special-display-config)))
