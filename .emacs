;;(load-file "~/.emacs.d/config/package-emacs23.el") ;; needed for Emacs 23

;(setq debug-on-error t)                 ; uncomment this to show stacktrace on error

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(load-file "~/.emacs.d/config/package.el")

;;; install (if not yet) and load packages
(defvar *package-names*
  '(
    ;; first things first
    "async"
    "gnu-elpa-keyring-update"
    ;;"exec-path-from-shell"

    ;; color themes
    "solarized-theme"
    "monokai-theme"
    "zenburn-theme"

    ;; auto complete mode
    "auto-complete"
    ;"ac-c-headers"
    ;"ac-capf"                           ; completion at point
    ;"ac-clang"
    "ac-cider"
    ;"ac-emoji"
    "ac-helm"
    ;"ac-math"
    ;;"ac-ispell"
    ;"ac-etags"
    ;"ac-html"

    ;; company mode
    "company"
    ;;"company-auctex"	; not updated anymore and create startup error.
    ;"company-c-headers"
    ;"company-flx"
    ;"company-ghc"
    ;"company-go"
    ;"company-math"
    ;"company-web"

    ;; Ivy mode
    "ivy"

    ;; Evil mode
    "evil"
    "evil-goggles"
    "evil-magit"
    "evil-nerd-commenter"
    "evil-smartparens"

    ;; Google-related packages
    "google-this"
    "google-translate"
    "google-maps"
    "google-contacts"

    ;; Groovy/Gradle
    ;"groovy-mode"
    ;"groovy-imports"
    ;"gradle-mode"

    ;; helm
    "helm"
    ;"f3"
    "helm-ag"
    ;"helm-bibtex"
    ;"helm-cider"
    ;"helm-cider-history"
    "helm-company"
    ;"helm-dired-history"
    ;"helm-emmet"
    ;"helm-flx"
    ;;"helm-flyspell"
    ;;"helm-flycheck"
    ;;"helm-fuzzier" ; helm-fuzzier breaks completing-read for, e.g.,  Clojure CIDER's REPL shortcut handler.
    ;"helm-fuzzy-find"
    ;"helm-go-package"
    ;"helm-google"
    ;"helm-gtags"
    "helm-themes"
    ;"helm-helm-commands"
    ;"helm-make"
    ;"helm-package"

    ;; JavaScript
    ;"indium"

    ;; Magit
    "magit"
    "magithub"

    ;; Org Mode
    "org"
    ;;"org-plus-contrib"

    ;; snippets
    "yasnippet"
    ;"java-snippets"
    ;"clojure-snippets"
    ;"datomic-snippets"
    ;"go-snippets"

    ;; flycheck
    ;"flycheck"
    ;"flycheck-color-mode-line"
    ;"flycheck-clojure"

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
    ;"clojure-mode-extra-font-locking"
    ;"inf-clojure"
    ;"clojure-cheatsheet"
    ;"slamhound"
    ;;"ac-cider"
    "4clojure"

    ;; Go
    ;"go-mode"
    ;"go-autocomplete"
    ;"go-complete"
    ;"go-direx"
    ;"go-eldoc"
    ;"go-errcheck"
    ;"go-playground"
    ;"go-scratch"
    ;"go-stacktracer"
    ;"gorepl-mode"
    ;"gotest"
    ;"govet"

    ;; rtags
    "rtags"
    "helm-rtags"
    ;"ac-rtags"
    "company-rtags"
    ;"flycheck-rtags"
    "ivy-rtags"

    ;; Java
    ;"jdee"

    ;; C#
    ;"csharp-mode"
    ;"omnisharp"

    ;; PowerShell
    ;"powershell"

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
    ;"ess-R-data-view"
    ;"ess-R-object-popup"
    ;"ess-smart-equals"

    ;; Markdown
    "markdown-mode"
    "markdown-toc"

    ;; Elfeed
    "elfeed"
    "elfeed-goodies"
    "elfeed-org"
    "elfeed-protocol"
    "elfeed-web"

    ;; CMake
    "cmake-mode"
    "cmake-project"
    "cmake-ide"
    "cmake-font-lock"
    "cpputils-cmake"

    ;; Scala
    ;"ensime"
    ;"flycheck-ensime"

    ;; Kotlin
    ;"kotlin-mode"
    ;"flycheck-kotlin"

    ;; misc
    ;"auctex"
    "cmake-mode"
    "engine-mode"
    "nasm-mode"
    "x86-lookup"
    "gist"
    "md4rd"
    "hackernews"
    "emmet-mode"
    "xahk-mode"
    "zencoding-mode"
    "lua-mode"
    "systemtap-mode"

    ;; general packages
    "ag"
    "hlinum"
    "linum-relative"
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
    ;"point-undo"
    "eval-sexp-fu"
    "0blayout"
    ))

(defun load-file-if-exists (file)
  "Load FILE when (file-exists-p FILE); otherwise no-op."
  (let ((file (expand-file-name file)))
    (when (file-exists-p file)
      (ignore-errors
        (load-file file)))))

(load-file-if-exists "~/.emacs.d/config/pre-package-load.el")

(let ((dir (expand-file-name "~/.emacs.d/config/pre-package-load.d/")))
  (when (file-accessible-directory-p dir)
    (dolist (f (directory-files dir t "\\.el$"))
      (load-file-if-exists f))))

;; Build package-selected-packages from *package-names*.
(setq package-selected-packages nil)
(dolist (package-name *package-names*)
  (setq package-selected-packages
        (cons (intern package-name)
              package-selected-packages)))

;; Refresh package on startup only if EMACS_REFRESH_PACKAGE environment variable is defined.
(let ((refreshed-p (if (getenv "EMACS_REFRESH_PACKAGE")
                       nil
                     t)))
  (dolist (package-name *package-names*)
    (let ((package (intern package-name))
          (package-config-path (format "~/.emacs.d/config/%s.el" package-name)))
      ;; (unless (package-installed-p package)
      ;;   (unless refreshed-p
      ;;     (package-refresh-contents)
      ;;     (setq refreshed-p t))
      ;;   (package-install package))
      (ignore-errors
        (unless (package-installed-p package)
          (unless refreshed-p
            (package-refresh-contents)
            (setq refreshed-p t))
          (package-install package)))
      ;(message "%s" package-config-path) ; debug: for identifying faulting file with `debug-on-error'
      (load-file-if-exists package-config-path))))

(load-file-if-exists "~/.emacs.d/config/post-package-load.el")

(let ((dir (expand-file-name "~/.emacs.d/config/post-package-load.d/")))
  (when (file-accessible-directory-p dir)
    (dolist (f (directory-files dir t "\\.el$"))
      (load-file-if-exists f))))

(load-file-if-exists "~/.emacs.local")  ; for backward compatiblity of previous config
(load-file-if-exists "~/.emacs.d/local.el")
(let ((dir (expand-file-name "~/.emacs.d/local.d/")))
  (when (file-accessible-directory-p dir)
    (dolist (f (directory-files dir t "\\.el$"))
      (load-file-if-exists f))))
