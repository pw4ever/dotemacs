;; https://github.com/syohex/emacs-go-direx

;; dependencies
;; * direx
;; * gotags
;;   - go get -u github.com/jstemmer/gotags

(require 'go-direx)

(eval-after-load "go-mode"
  '(progn
	 (add-hook 'go-mode-hook
			   (lambda ()
				 (define-key go-mode-map
				   (kbd "C-c C-j") 'go-direx-pop-to-buffer)))))


