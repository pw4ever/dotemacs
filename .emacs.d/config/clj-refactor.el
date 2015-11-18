(require 'clj-refactor)

(cljr-add-keybindings-with-prefix "C-c C-m")

(dolist (hook '(cider-mode-hook
				cider-repl-mode-hook
				clojure-mode-hook))
  (add-hook hook (lambda ()
				   (clj-refactor-mode +1))))

