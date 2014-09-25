;;; general config
(load-file "~/.emacs.d/config/general.el")
;(load-file "~/.emacs.d/config/package-emacs23.el") ;; needed for Emacs 23
(load-file "~/.emacs.d/config/package.el")

;;; install (if not yet) and load packages
(defvar *package-names*
  '(
    ;; general
    "color-theme"
    "helm"
    "company"
    "smartparens"
    "rainbow-delimiters"
    "auto-complete"
    "yasnippet"

    "ac-helm"
    "ac-math"
    "ac-ispell"
    "ac-etags"
    
    ;; Common Lisp
    "slime"
    "ac-slime"

    ;; Clojure
    "cider"
    "clojure-mode"
    "clojure-cheatsheet"
    "clj-refactor"
    "slamhound"
    "ac-cider"
    "clojure-snippets"
    "datomic-snippets"
    
    "auctex"
    "zencoding-mode"

    "ess"
    "org"
    ))

(dolist (package-name *package-names*)
  (let ((package (intern package-name))
	(package-config-path (format "~/.emacs.d/config/%s.el" package-name)))
    (unless (package-installed-p package)
      (package-refresh-contents)
      (package-install package))
    (when (file-exists-p package-config-path)
      (load-file package-config-path))))
