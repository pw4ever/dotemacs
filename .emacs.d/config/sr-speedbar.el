(require 'sr-speedbar)

(global-set-key '[f8] 'sr-speedbar-toggle)
(global-set-key (kbd "M-_") 'sr-speedbar-toggle)

;; http://www.emacswiki.org/SrSpeedbar
;;(setq speedbar-use-images nil)

(let ((default 25))
  (setq sr-speedbar-default-width default)
  (setq sr-speedbar-width default))

;;(sr-speedbar-open)
