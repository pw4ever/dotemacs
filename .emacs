;;(load-file "~/.emacs.d/config/package-emacs23.el") ;; needed for Emacs 23
(load-file "~/.emacs.d/config/package.el")

;;; install (if not yet) and load packages
(defvar *package-names*
  '(
	;; first things first
	"async"
	"exec-path-from-shell"
	
    ;; color themes
    "solarized-theme"
    "monokai-theme"
    "zenburn-theme"

    ;; general packages
	"flx"
	"flx-ido"
	"smartparens"
    "rainbow-delimiters"
	"pretty-mode"
    "sr-speedbar"
    ;;"w3m"
    "ggtags"
    "unify-opening"
    "use-package"
    "runner"
    "hideshow-org"
	"popwin"
	"direx"
	"point-undo"
	"eval-sexp-fu"
    
    ;; auto complete
    "auto-complete"
    "ac-helm"
    "ac-math"
    "ac-ispell"
    "ac-etags"
    "ac-html"

    ;; company
    "company"
    "company-auctex"
    "company-c-headers"
	"company-flx"
    "company-ghc"
    "company-go"
    "company-math"

	;; Google-related packages
	"google-this"
	"google-translate"
	"google-maps"
	"google-contacts"

    ;; helm
    "helm"
	"helm-bibtex"
	"helm-cider-history"
	"helm-flx"
	"helm-flyspell"
    "helm-flycheck"
	"helm-fuzzier"
	"helm-fuzzy-find"
	"helm-go-package"
    "helm-google"
    "helm-gtags"
    "helm-themes"
    "helm-helm-commands"
    "helm-make"
    "helm-package"

	;; Org Mode
	"org"
    "org-plus-contrib"
	
    ;; snippets
    "yasnippet"
    "java-snippets"
    "clojure-snippets"
    "datomic-snippets"
	"go-snippets"

    ;; flycheck
    "flycheck"
    "flycheck-color-mode-line"
	"flycheck-clojure"

	;; !!! DO NOT USE the built-in flymake; use flycheck as above
    
    ;; Common Lisp
    ;;"slime"
    ;;"ac-slime"

    ;; Clojure
    "cider"
	"cider-eval-sexp-fu"
    "clj-refactor"
	"cljr-helm"	
    "clojure-mode"
    "clojure-mode-extra-font-locking"
	"inf-clojure"
    "clojure-cheatsheet"
	"slamhound"
    "ac-cider"
    "4clojure"

	;; Go
	"go-mode"
	"go-autocomplete"
	"go-complete"
	"go-direx"
	"go-eldoc"	
	"go-errcheck"
	"go-playground"
	"go-scratch"
	"go-stacktracer"
	"gorepl-mode"
	"gotest"
	"govet"
	
    ;; Java
    "jdee"

    ;; Haskell
    ;;"haskell-mode"
    ;;"company-cabal"    
    ;;"ac-haskell-process"
    ;;"flycheck-haskell"
    ;;"hi2"
    ;;"shm"

    ;; Ruby
    ;;"ruby-mode"
    ;;"rinari"
    ;;"rspec-mode"
    ;;"rvm"
    ;;"ac-inf-ruby"
    ;;"company-inf-ruby"
    ;;"ruby-additional"
    ;;"ruby-electric"
    ;;"ruby-hash-syntax"
    ;;"ruby-guard"
    ;;"ruby-tools"
    ;;"helm-rubygems-org"
    ;;"helm-rb"
    ;;"helm-rails"

    ;; ESS/R
    "ess"
    "ess-R-data-view"
    "ess-R-object-popup"
    "ess-smart-equals"
    
    ;; misc
    "auctex"
	"gist"
	"hackernews"
    "zencoding-mode"
	))

(defun load-file-if-exists (file)
  "Load FILE when (file-exists-p FILE); otherwise no-op."
  (let ((file (expand-file-name file)))
	(when (file-exists-p file)
	  (load-file file))))

(load-file-if-exists "~/.emacs.d/config/pre-package-load.el")

(let ((refreshed-p nil))
  (dolist (package-name *package-names*)
	(let ((package (intern package-name))
		  (package-config-path (format "~/.emacs.d/config/%s.el" package-name)))
	  (unless (package-installed-p package)
		(unless refreshed-p
		  (package-refresh-contents)
		  (setq refreshed-p t))
		(package-install package))
	  (load-file-if-exists package-config-path))))

(load-file-if-exists "~/.emacs.d/config/post-package-load.el")

(load-file-if-exists "~/.emacs.local")
