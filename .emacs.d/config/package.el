(require 'package)

;; add-to-list add to list's front unless by t

;; reset
;;(setq package-archives nil)

;; default GNU ELPA
;; (add-to-list 'package-archives
;; 	     '("gnu" . "http://elpa.gnu.org/packages/"))

(add-to-list 'package-archives
			 '("org" . "https://orgmode.org/elpa/") t)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)

;; (when (boundp 'package-pinned-packages)
;;   (setq package-pinned-packages
;; 		'((cider . "melpa-stable"))))

(package-initialize)
