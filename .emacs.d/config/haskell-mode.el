(eval-after-load "which-func"
  '(add-to-list 'which-func-modes 'haskell-mode))

(eval-after-load "haskell-mode"
  '(progn
     ;; https://github.com/haskell/haskell-mode/wiki/Haskell-Interactive-Mode-Setup
     ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-unicode-input-method)
     (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
     (add-hook 'haskell-mode-hook 'turn-on-haskell-decl-scan)
     (add-hook 'haskell-mode-hook 'interactive-haskell-mode)

     (custom-set-variables
      '(haskell-process-suggest-remove-import-lines t)
      '(haskell-process-auto-import-loaded-modules t)
      '(haskell-process-log t))

     ;; speedbar
     (speedbar-add-supported-extension ".hs")     
     
     (define-key haskell-mode-map (kbd "C-,") 'haskell-move-nested-left)
     (define-key haskell-mode-map (kbd "C-.") 'haskell-move-nested-right)  
     (define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
     (define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
     (define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
     (define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
     (define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)
     
     ;; ;; https://github.com/haskell/haskell-mode/wiki/Browsing-Haddocks
     ;; (require 'w3m-haddock)
     ;; (define-key w3m-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)
     ;; (define-key w3m-mode-map (kbd "M-.") 'w3m-haddock-find-tag)
     ;; (add-hook 'w3m-display-hook 'w3m-haddock-display)

     ;; (defcustom haskell-w3m-haddock-dirs
     ;;   '("~/.cabal/share/doc/"))
     ;; (define-key haskell-mode-map (kbd "C-c C-d") 'haskell-w3m-open-haddock)

     ))


(eval-after-load "haskell-cabal-mode"
  '(progn
     (define-key haskell-mode-map (kbd "C-c v c") 'haskell-cabal-visit-file)
     (define-key haskell-cabal-mode-map (kbd "C-`") 'haskell-interactive-bring)
     (define-key haskell-cabal-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
     (define-key haskell-cabal-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
     (define-key haskell-cabal-mode-map (kbd "C-c c") 'haskell-process-cabal)))

(custom-set-variables
  '(haskell-process-type 'cabal-repl))

;; https://github.com/haskell/haskell-mode/wiki/Haskell-Interactive-Mode-Tags

;; (custom-set-variables
;;   '(haskell-tags-on-save t))

(define-key haskell-mode-map (kbd "M-.") 'haskell-mode-jump-to-def-or-tag)
