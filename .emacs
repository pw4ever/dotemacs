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
    
    "smartparens"
    "rainbow-delimiters"
    "async"
    ;;"pretty-mode"
    "sr-speedbar"
    ;;"w3m"
    "ggtags"
    "unify-opening"
    "use-package"
    "runner"
    "hideshow-org"
	"popwin"
	"direx"
    
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
    "company-ghc"
    "company-go"
    "company-math"

    ;; helm
    "helm"
    "helm-flycheck"
    "helm-google"
    "helm-gtags"
    "helm-themes"
    "helm-helm-commands"
    "helm-make"
    "helm-package"
    
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

	;; flymake
	"flymake"
	"flymake-go"
	;;"flymake-google-cpplint"
	;;"flymake-lua"
	"flymake-shell"
    
    ;; Common Lisp
    ;;"slime"
    ;;"ac-slime"

    ;; Clojure
    "cider"
    "clojure-mode"
    "clojure-mode-extra-font-locking"
    "clojure-cheatsheet"
    "clj-refactor"
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
	"gotest"
	
    ;; Java
    "jdee"

    ;; Haskell
    ;"haskell-mode"
    ;"company-cabal"    
    ;"ac-haskell-process"
    ;"flycheck-haskell"
    ;"hi2"
    ;"shm"

    ;; Ruby
    ;"ruby-mode"
    ;"rinari"
    ;"rspec-mode"
    ;"rvm"
    ;"ac-inf-ruby"
    ;"company-inf-ruby"
    ;"ruby-additional"
    ;"ruby-electric"
    ;"ruby-hash-syntax"
    ;"ruby-guard"
    ;"ruby-tools"
    ;"helm-rubygems-org"
    ;"helm-rb"
    ;"helm-rails"

    ;; ESS/R
    "ess"
    "ess-R-data-view"
    "ess-R-object-popup"
    "ess-smart-equals"
    
    ;; misc
    "auctex"
	"gist"
    "zencoding-mode"
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
