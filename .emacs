;;(load-file "~/.emacs.d/config/package-emacs23.el") ;; needed for Emacs 23
(load-file "~/.emacs.d/config/package.el")

;;; install (if not yet) and load packages
(defvar *package-names*
  '(
    ;; color themes
    "solarized-theme"
    "monokai-theme"
    "zenburn-theme"

    ;; general packages
    "helm"
    "company"
    "smartparens"
    "rainbow-delimiters"
    "auto-complete"
    "yasnippet"

    "async"

    "ac-helm"
    "ac-math"
    "ac-ispell"
    "ac-etags"

    "java-snippets"
    
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

(load-file "~/.emacs.d/config/pre-package-load.el")

(dolist (package-name *package-names*)
  (let ((package (intern package-name))
	(package-config-path (format "~/.emacs.d/config/%s.el" package-name)))
    (unless (package-installed-p package)
      (package-refresh-contents)
      (package-install package))
    (when (file-exists-p package-config-path)
      (load-file package-config-path))))

(load-file "~/.emacs.d/config/post-package-load.el")
