;; http://orgmode.org/
(require 'org-install)

;; file association
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

;; config
(setq org-log-done t)
(setq org-catch-invisible-edits 'smart)
(setq org-list-indent-offset 2)
(setq org-use-speed-commands t)
(setq org-enforce-todo-dependencies t)
(setq org-default-notes-file "~/notes.org")
(setq org-todo-keywords '((sequence "TODO(t)" "IN-PROGRESS(i)" "HOLD(h)" "|" "DONE(d)" "CANCELED(r)")))

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

;; org-mobile-directory defaults to "$HOME/org-mobile/" if:
;; * org-mobile-directory has not been set, i.e., is "nil",
;; * "$HOME/org-mobile" is an accessible directory.
(let ((home (getenv "HOME")))
  (when (and (or (not (boundp 'org-mobile-directory))
				 (not org-mobile-directory)
				 (not (file-accessible-directory-p org-mobile-directory)))
			 home)
    (let ((org-home (concat (file-name-as-directory home)
							"org-mobile")))
      (if (file-accessible-directory-p org-home)
		  (setq org-mobile-directory org-home)))))

;; Add org-directory to org-agenda-files
(when (and (boundp 'org-directory)
		   (file-accessible-directory-p org-directory))
  (if (boundp 'org-agenda-files)
      (add-to-list 'org-agenda-files org-directory)
    (setq org-agenda-files (list org-directory))))

;;
;; org-crypt
;;

(require 'org-crypt)
(org-crypt-use-before-save-magic)
(setq org-crypt-disable-auto-save 'encrypt)

(defun org-crypt-enable-keymap ()
  (interactive)
  (define-key org-mode-map (kbd "C-c e") 'org-encrypt-entry)
  (define-key org-mode-map (kbd "C-c E") 'org-encrypt-entries)
  (define-key org-mode-map (kbd "C-c d") 'org-decrypt-entry)
  (define-key org-mode-map (kbd "C-c D") 'org-decrypt-entries))

(org-crypt-enable-keymap)

;; (add-to-list 'org-tags-exclude-from-inheritance "crypt")
;; ;; or (setq org-tags-exclude-from-inheritance nil)
;; (setq org-crypt-tag-matcher "crypt")

(setq org-crypt-key nil) ; symmetric encryption
