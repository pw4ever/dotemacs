(defvar file-name-mode-alist '())
(add-to-list 'savehist-additional-variables 'file-name-mode-alist)
(savehist-mode +1)
(append-to-list 'auto-mode-alist file-name-mode-alist)

(defun remember-extensionless-file-name-mode ()
  "Remember major mode of extension-less files."
  (when (and buffer-file-name
             (not (file-name-extension buffer-file-name)))
    ;; https://emacs.stackexchange.com/questions/3397/how-to-replace-an-element-of-an-alist
    (setf (cdr (assoc buffer-file-name file-name-mode-alist)) major-mode)
    (setf (cdr (assoc buffer-file-name auto-mode-alist)) major-mode)))

(add-hook 'after-change-major-mode-hook
          #'remember-extensionless-file-name-mode)

(provide 'remember-extensionless-file-name-mode)