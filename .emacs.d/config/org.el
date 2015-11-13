;; http://orgmode.org/
(require 'org-install)

;; file association
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; config
(setq org-log-done t)
(setq org-catch-invisible-edits 'smart)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)


;; org-directory defaults to "$HOME/org/" if:
;; * org-directory has not been set, i.e., is "nil",
;; * $HOME/org is an accessible directory.
(let ((home (getenv "HOME")))
  (when (and (not (boundp 'org-directory)) (not org-directory) home)
	(let ((org-home (concat (file-name-as-directory home)
							"org")))
	  (if (file-accessible-directory-p org-home)
		  (setq org-directory org-home)))))

(if (or (not (boundp 'org-mobile-directory))
	   (not org-mobile-directory)
	   (not (file-accessible-directory-p org-mobile-directory)))
	(setq org-mobile-directory org-directory))
