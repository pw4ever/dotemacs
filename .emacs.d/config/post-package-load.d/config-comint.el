;;; clear comint buffer
;; http://emacsredux.com/blog/2015/01/18/clear-comint-buffers/
(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;; in case other mode shadow one of the bindings
(define-key comint-mode-map "\C-c\M-o" #'comint-clear-buffer)
(define-key comint-mode-map "\C-co" #'comint-clear-buffer)
(define-key comint-mode-map "\C-cO" #'comint-clear-buffer)