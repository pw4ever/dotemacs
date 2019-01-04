;;
;; https://stackoverflow.com/a/9414763
;;
(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))

(global-set-key (kbd "C-`") 'copy-file-name-to-clipboard)

;;
;; Delete trailing emptyspace
;;

(setq delete-extra-emptyspace-modes
      '(delete-trailing-whitespace delete-blank-lines))

(defun delete-extra-emptyspace  ()
  "Remove trailing empty space."
  (interactive)
  (dolist (f delete-extra-emptyspace-modes)
    (funcall f)))

(global-set-key (kbd "C-~") 'delete-extra-emptyspace)

(defun enable-delete-extra-emptyspace-at-saving  ()
  "Remove trailing empty space before saving."
  (interactive)
  (dolist (f delete-extra-emptyspace)
    (cl-pushnew f before-save-hook)))

(defun disable-delete-extra-emptyspace-at-saving ()
  "Don't remove trailing empty space before saving."
  (interactive)
  (dolist (f delete-extra-emptyspace-modes)
    (setq before-save-hook
          (delete f before-save-hook))))
