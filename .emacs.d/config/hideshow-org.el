(require 'hideshow)
(require 'hideshow-org)

(global-set-key (kbd "C-c @ TAB")
		'hs-org/minor-mode)

(dolist (hook '(lisp-hook-mode
		emacs-lisp-mode-hook
		
		cider-mode-hook
		cider-repl-mode-hook
		clojure-mode-hook
                
		lisp-interaction-mode-hook
		slime-repl-mode-hook

		scheme-mode-hook

		ruby-mode-hook

		ess-mode-hook
		ess-R-post-run-hook

		latex-mode-hook
		LaTeX-mode-hook))
  (add-hook hook (lambda () (hs-org/minor-mode))))
