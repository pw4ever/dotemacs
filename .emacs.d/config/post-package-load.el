;; set color theme

;;(load-theme 'solarized-light t)
;;(load-theme 'solarized-dark t)

;;(load-theme 'zenburn t)

(load-theme 'monokai t)

;; http://emacsredux.com/blog/2015/01/18/clear-comint-buffers/
(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;; let's bind the new command to a keycombo
(define-key comint-mode-map "\C-c\M-o" #'comint-clear-buffer)
