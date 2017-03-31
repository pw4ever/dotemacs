(defvar *open-buffer-path-prog*
  (cond ((eql system-type 'windows-nt) "explorer")
        (t "xdg-open"))
  "The program used for opening current buffer's path.")

(defvar *open-buffer-path-translator*
  (cond ((eql system-type 'windows-nt)  (lambda (path) (replace-regexp-in-string "/" "\\" path t t)))
        (t (lambda (path) (concat "\""
                                  path
                                  "\""))))
  "The path translator used to feed int *open-buffer-path-prog*.")

(defun open-buffer-path (prefix)
  "Run a program on the current buffer's directory."
  (interactive "P")
  (let ((cmd (concat *open-buffer-path-prog*
                     " "
                     (funcall *open-buffer-path-translator*
                              (expand-file-name
                               (let ((bfn (buffer-file-name)))
                                 (cond (bfn (file-name-directory bfn))
                                       (t default-directory))))))))
    (message cmd)
    (shell-command (if prefix (read-string "Command:" cmd)
                     cmd))))

(global-set-key (kbd "<f11>") #'open-buffer-path)

(provide 'open-buffer-path)
;;; open-buffer-path ends here
