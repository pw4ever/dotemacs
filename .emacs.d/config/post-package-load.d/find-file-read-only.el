(defvar find-file-read-only-p nil
  "Visit file in read-only mode by default; avoid clobbering file inadvertantly.")

(add-hook 'find-file-hooks
          (lambda ()
            (if find-file-read-only-p
                (setq buffer-read-only t))))
