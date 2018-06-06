(setq gc-cons-threshold 20000000) ; https://github.com/lewang/flx
(setq warning-minimum-level :error)
(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq load-prefer-newer t)
(setq highlight-nonselected-windows t)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program
      (let ((progs (append (list  (getenv "BROWSER")
                                  (getenv "EMACS_BROWSER"))
                           (pcase system-type
                             ('windows-nt '("chrome"
                                            "firefox"))
                             (_ '("google-chrome-stable"
                                  "chromium"
                                  "firefox"))))))
        (dolist (prog progs)
          (when (and prog
                     (executable-find prog))
            (return prog)))))
(setq bookmark-save-flag 1) ; save bookmarks after every modifications

;;(prefer-coding-system 'latin-0)			; edit source code
(prefer-coding-system 'utf-8)

(require 'saveplace)
(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)

;; mark ring settings
(setq global-mark-ring-max (expt 2 20))
(setq mark-ring-max (expt 2 16))
(setq set-mark-command-repeat-pop t)

(add-hook 'prog-mode-hook 'hs-minor-mode)
(add-hook 'apropos-mode-hook (lambda () (hs-minor-mode -1))) ; apropos-mode does not support hs-minor-mode

(global-linum-mode +1)
(global-visual-line-mode +1)
(line-number-mode)
(column-number-mode)
(size-indication-mode)
;;(desktop-save-mode)
(savehist-mode)

(tool-bar-mode -1)

;; speedbar ;; replaced by sr-speedbar
;; (when (window-system)
;;   (speedbar t)
;;   (add-hook 'speedbar-mode-hook
;; 	    '(lambda ()
;; 	       (interactive)
;; 	       (other-frame 0))))

;; (add-hook 'after-change-major-mode-hook 'hl-line-mode) ; hl-line-mode is a buffer-local minor mode

(global-set-key (kbd "<f12>") 'compile)

;; add ~/.emacs.d/config/00deps/ to load-path so can require'd the dependencies
(let ((dep-dirname (expand-file-name "00deps"
									 (concat (getenv "HOME")
											 "/.emacs.d/config/"))))
  (when (file-exists-p dep-dirname)
	(add-to-list 'load-path dep-dirname)))
