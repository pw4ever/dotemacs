;; http://orgmode.org/
(require 'org-install)

;; file association
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; config
(setq org-log-done t)
(setq org-catch-invisible-edits 'smart)
(setq org-list-demote-modify-bullet t)
(setq org-list-indent-offset 2)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)
(define-key global-map "\C-cb" 'org-iswitchb)

;; org-directory defaults to "$HOME/org/" if:
;; * org-directory has not been set, i.e., is "nil",
;; * $HOME/org is an accessible directory.
(let ((home (getenv "HOME")))
  (when (and (or (not (boundp 'org-directory))
				 (not org-directory)
				 (not (file-accessible-directory-p org-directory)))
			 home)
    (let ((org-home (concat (file-name-as-directory home)
							"org")))
      (if (file-accessible-directory-p org-home)
		  (setq org-directory org-home)))))

;; Set org-mobile-directory to org-directory if uninitialized
(when (or (not (boundp 'org-mobile-directory))
		  (not org-mobile-directory)
		  (not (file-accessible-directory-p org-mobile-directory)))
  (when (and (boundp 'org-directory)
			 (file-accessible-directory-p org-directory))
	(setq org-mobile-directory org-directory)))

;; Add org-directory to org-agenda-files
(when (and (boundp 'org-directory)
		   (file-accessible-directory-p org-directory))
  (if (boundp 'org-agenda-files)
      (add-to-list 'org-agenda-files org-directory)
    (setq org-agenda-files org-directory)))
