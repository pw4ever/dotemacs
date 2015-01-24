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
    "company"
    "smartparens"
    "rainbow-delimiters"
    "async"
    ;;"pretty-mode"
    "sr-speedbar"
    ;;"w3m"
    
    ;; auto complete
    "auto-complete"
    "ac-helm"
    "ac-math"
    "ac-ispell"
    "ac-etags"

    ;; helm
    "helm"
    "helm-flycheck"

    ;; snippets
    "yasnippet"
    "java-snippets"
    "clojure-snippets"
    "datomic-snippets"

    ;; flycheck
    "flycheck"
    "flycheck-color-mode-line"
    
    ;; Common Lisp
    ;;"slime"
    ;;"ac-slime"

    ;; Clojure
    "cider"
    "clojure-mode"
    "clojure-cheatsheet"
    "clj-refactor"
    "slamhound"
    "ac-cider"

    ;; Haskell
    "haskell-mode"
    "ac-haskell-process"
    "flycheck-haskell"
    "hi2"
    "shm"

    ;; Ruby
    "rinari"
    "rvm"
    
    ;; misc
    "auctex"
    "zencoding-mode"

    "ess"
    "org"
    "org-plus-contrib"
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
