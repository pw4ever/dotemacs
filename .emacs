;;(load-file "~/.emacs.d/config/package-emacs23.el") ;; needed for Emacs 23

;;(setq debug-on-error t)                 ; uncomment this to show stacktrace on error

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
    "nov"
    "quelpa"
    "quelpa-use-package"
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
    "helm-projectile"

    ;; projectiles
    "projectile"
    "projectile-direnv"
    "projectile-ripgrep"

    ;; JavaScript
    ;"indium"

    ;; Magit
    "magit"
    "magithub"

    ;; Org Mode
    "org"
    ;;"org-plus-contrib"
    "org-projectile"
    "org-projectile-helm"

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
    "clojure-essential-ref"

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
    "scala-mode"
    "sbt-mode"
    ;"ensime"
    ;"flycheck-ensime"

    ;; Kotlin
    ;"kotlin-mode"
    ;"flycheck-kotlin"

    ;; Ansible
    "ansible"
    "ansible-vault"
    "poly-ansible"
    "company-ansible"

    ;; YAML
    "yaml-mode"
    "yaml-imenu"

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
    "clang-format"
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
    "undo-propose"
    "eval-sexp-fu"
    "0blayout"
    ))

(defun load-file-if-exists (file)
  "Load FILE when (file-exists-p FILE); otherwise no-op."
  (let ((file (expand-file-name file)))
    (when (file-exists-p file)
      (ignore-errors
        (load-file file)))))

(defun add-to-load-path-if-exists (path)
  "Prepend path to load-path if it exists."
  (let ((path (expand-file-name path)))
    (when (file-accessible-directory-p path)
      (ignore-errors
        (add-to-list 'load-path path)))))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ggtags-mode-prefix-key "")
 '(package-selected-packages
   '(protobuf-mode go-mode plantuml-mode ansible ansible-vault company-ansible poly-ansible yaml-imenu yaml-mode clang-format projectile-ripgrep helm-projectile org-projectile org-projectile-helm projectile projectile-direnv org-plus-contrib nov clojure-essential-ref 0blayout eval-sexp-fu undo-propose direx popwin hideshow-org runner use-package unify-opening ggtags sr-speedbar pretty-mode rainbow-delimiters smartparens flx-ido flx linum-relative hlinum ag systemtap-mode lua-mode zencoding-mode xahk-mode emmet-mode hackernews md4rd gist x86-lookup nasm-mode engine-mode cmake-mode sbt-mode scala-mode cpputils-cmake cmake-font-lock cmake-ide cmake-project cmake-mode elfeed-web elfeed-protocol elfeed-org elfeed-goodies elfeed markdown-toc markdown-mode ess ivy-rtags company-rtags helm-rtags rtags 4clojure clojure-mode cljr-helm clj-refactor cider-eval-sexp-fu cider yasnippet org magithub magit helm-themes helm-company helm-ag helm google-contacts google-maps google-translate google-this evil-smartparens evil-nerd-commenter evil-magit evil-goggles evil ivy company ac-helm ac-cider auto-complete zenburn-theme monokai-theme solarized-theme gnu-elpa-keyring-update async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
