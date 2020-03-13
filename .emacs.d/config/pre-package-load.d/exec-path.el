(defun prepend-to-path-if-exists (path)
  "Prepend path to Emacs settings if it exists."
  (let ((path (expand-file-name path)))
    (when (file-accessible-directory-p path)
      (ignore-errors
        (setenv "PATH" (concat path path-separator (getenv "PATH")))
        (add-to-list 'exec-path path)))))

(defun load-file-if-exists (file)
  "Load FILE when (file-exists-p FILE); otherwise no-op."
  (let ((file (expand-file-name file)))
    (when (file-exists-p file)
      (ignore-errors
        (load-file file)))))

(dolist (f '("~/bin" "~/usr/bin"))
  (prepend-to-path-if-exists f))

(load-file-if-exists "~/.emacs.d/local.d/exec-path.el")

(when (boundp '*exec-path-local-prepend-list*)
  (dolist (f *exec-path-local-prepend-list*)
    (prepend-to-path-if-exists f)))
