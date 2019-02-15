(require 'package)

;; add-to-list add to list's front unless by t

;; reset
;;(setq package-archives nil)

;; default GNU ELPA
;; (add-to-list 'package-archives
;; 	     '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
			 '("org" . "http://orgmode.org/elpa/"))


;; Milkypostman's Emacs Lisp Pakcage Archive (MELPA)
(add-to-list 'package-archives
			 '("melpa" . "http://melpa.milkbox.net/packages/"))

(add-to-list 'package-archives
			 '("melpa-stable" . "http://melpa-stable.milkbox.net/packages/") t)

;; (add-to-list 'package-archives
;;              '("marmalade" . "https://marmalade-repo.org/packages/"))

;; (when (boundp 'package-pinned-packages)
;;   (setq package-pinned-packages
;; 		'((cider . "melpa-stable"))))

(package-initialize)
