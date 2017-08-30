;; Do not automatically change the visited file
(dolist (f '(delete-trailing-whitespace delete-trailing-lines))
  (setq before-save-hook (delete f before-save-hook)))

;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Customize-Save.html
(setq require-final-newline nil)
(setq mode-require-final-newline nil)
