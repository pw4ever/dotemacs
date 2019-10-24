;; https://www.emacswiki.org/emacs/LoadPath#toc2
(setq debug-on-error t)
(dolist (path '("~/usr/share/emacs/site-lisp/"))
  (let ((path (expand-file-name path)))
    (when (file-accessible-directory-p path)
      ;; prepend path to load-path
      (let ((default-directory path))
        (setq load-path
              (append
               (let ((load-path (copy-sequence load-path))) ;; Shadow
                 (append
                  (copy-sequence (normal-top-level-add-to-load-path '(".")))
                  (normal-top-level-add-subdirs-to-load-path)))
               load-path))))))
