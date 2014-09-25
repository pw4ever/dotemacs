(require 'rainbow-delimiters)

(dolist (hook '(cider-mode-hook
		cider-repl-mode-hook
		clojure-mode-hook

		emacs-lisp-mode-hook

		lisp-mode-hook
		lisp-interaction-mode-hook
		slime-repl-mode-hook

		scheme-mode-hook

		ess-mode-hook
		ess-R-post-run-hook))
  (add-hook hook (lambda () (rainbow-delimiters-mode +1))))

