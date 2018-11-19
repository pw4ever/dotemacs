;;(load-file "~/.emacs.d/config/package-emacs23.el") ;; needed for Emacs 23

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
    "exec-path-from-shell"

    ;; color themes
    "solarized-theme"
    "monokai-theme"
    "zenburn-theme"

    ;; auto complete mode
    "auto-complete"
    "ac-c-headers"
    "ac-capf"                           ; completion at point
    "ac-clang"
    "ac-cider"
    "ac-emoji"
    "ac-helm"
    "ac-math"
    ;;"ac-ispell"
    "ac-etags"
    "ac-html"

    ;; company mode
    "company"
    ;;"company-auctex"	; not updated anymore and create startup error.
    "company-c-headers"
    "company-flx"
    "company-ghc"
    "company-go"
    "company-math"
    "company-web"

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
    "groovy-mode"
    "groovy-imports"
    "gradle-mode"

    ;; helm
    "helm"
    "f3"
    "helm-ag"
    "helm-bibtex"
    "helm-cider"
    "helm-cider-history"
    "helm-company"
    "helm-dired-history"
    "helm-emmet"
    "helm-flx"
    ;;"helm-flyspell"
    ;;"helm-flycheck"
    ;;"helm-fuzzier" ; helm-fuzzier breaks completing-read for, e.g.,  Clojure CIDER's REPL shortcut handler.
    "helm-fuzzy-find"
    "helm-go-package"
    "helm-google"
    "helm-gtags"
    "helm-themes"
    "helm-helm-commands"
    "helm-make"
    "helm-package"
    "helm-themes"

    ;; JavaScript
    "indium"

    ;; Magit
    "magit"
    "magithub"

    ;; Org Mode
    "org"
    ;;"org-plus-contrib"

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
    ;;"ac-cider"
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

    ;; C#
    "csharp-mode"
    "omnisharp"

    ;; PowerShell
    "powershell"

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

    ;; Markdown
    "markdown-mode"
    "markdown-toc"

    ;; Elfeed
    "elfeed"
    "elfeed-goodies"
    "elfeed-org"
    "elfeed-protocol"
    "elfeed-web"

    ;; misc
    "auctex"
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
    "point-undo"
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

;; Refresh package on startup only if EMACS_REFRESH_PACKAGE environment variable is defined.
(let ((refreshed-p (if (getenv "EMACS_REFRESH_PACKAGE")
                       nil
                     t)))
  (dolist (package-name *package-names*)
    (let ((package (intern package-name))
          (package-config-path (format "~/.emacs.d/config/%s.el" package-name)))
      (ignore-errors
        (unless (package-installed-p package)
          (unless refreshed-p
            (package-refresh-contents)
            (setq refreshed-p t))
          (package-install package)))
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
 '(ac-etags-requires 1)
 '(ac-ispell-fuzzy-limit 2)
 '(ac-ispell-requires 4)
 '(ggtags-mode-prefix-key "")
 '(helm-gtags-auto-update nil)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-path-style (quote relative))
 '(package-selected-packages
   (quote
    (md4rd elfeed elfeed-goodies elfeed-org elfeed-protocol elfeed-web systemtap-mode gradle-mode groovy-imports groovy-mode org lua-mode evil-goggles evil-magit evil-matchit evil-nerd-commenter magit magithub ag helm-ag evil-smartparens evil indium xahk-mode powershell zencoding-mode emmet-mode helm-emmet engine-mode helm-cider json-mode nasm-mode company-math company-go company-ghc company-flx company-c-headers sr-speedbar slamhound runner rainbow-delimiters pretty-mode popwin point-undo omnisharp monokai-theme markdown-toc linum-relative jdee java-snippets inf-clojure hlinum hideshow-org helm-themes helm-package helm-make helm-helm-commands helm-gtags helm-google helm-go-package helm-fuzzy-find helm-flx helm-dired-history helm-company helm-cider-history helm-bibtex hackernews govet gorepl-mode google-translate google-this google-maps google-contacts go-stacktracer go-snippets go-scratch go-playground go-errcheck go-eldoc go-direx go-complete go-autocomplete gist ghc flycheck-color-mode-line flycheck-clojure flx-ido f3 exec-path-from-shell ess-smart-equals ess-R-object-popup ess-R-data-view datomic-snippets clojure-snippets clojure-mode-extra-font-locking clojure-cheatsheet cljr-helm cider-eval-sexp-fu auctex ac-math ac-html ac-helm ac-etags ac-emoji ac-clang ac-cider ac-capf ac-c-headers 4clojure 0blayout))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
