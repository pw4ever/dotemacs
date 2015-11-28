;; https://github.com/manute/gorepl-mode
;; dependencies
;; * gore: https://github.com/motemen/gore
;;   - go get github.com/motemen/gore

;; disable the following line to prevent gorepl-mode everywhere

(eval-after-load "go-mode"
  '(progn
	 (add-hook 'go-mode-hook
			   #'gorepl-mode)))

