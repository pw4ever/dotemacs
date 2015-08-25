(setq inhibit-startup-screen t)
(setq make-backup-files nil)
(setq highlight-nonselected-windows t)
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "firefox")
(setq bookmark-save-flag 1) ; save bookmarks after every modifications

(setq save-place-file "~/.emacs.d/saveplace")
(setq-default save-place t)
(require 'saveplace)

(setq load-prefer-newer t)

(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'hs-minor-mode)

(global-linum-mode)
(line-number-mode)
(column-number-mode)
(size-indication-mode)

(tool-bar-mode -1)

;; speedbar ;; replaced by sr-speedbar
;; (when (window-system)
;;   (speedbar t)
;;   (add-hook 'speedbar-mode-hook
;; 	    '(lambda ()
;; 	       (interactive)
;; 	       (other-frame 0))))

;; (add-hook 'after-change-major-mode-hook 'hl-line-mode) ; hl-line-mode is a buffer-local minor mode

;;(global-set-key '[f9] 'shell)
(global-set-key '[f11] 'flyspell-mode)
(global-set-key '[f12] 'compile)
