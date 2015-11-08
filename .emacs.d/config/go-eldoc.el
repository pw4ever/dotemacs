;; https://github.com/syohex/emacs-go-eldoc

;; dependencies
;; * gocode
;;   - go get -u github.com/nsf/gocode
;; * go-mode

(require 'go-eldoc)

(eval-after-load "go-mode"
  '(progn
	 (add-hook 'go-mode-hook 'go-eldoc-setup)))
