;; https://github.com/purcell/exec-path-from-shell
(require 'exec-path-from-shell)

;; Customize `exec-path-from-shell-variables' to modify the list of variables imported.
(setq exec-path-from-shell-variables
	  '("PATH" "MANPATH"))

;; remove use "-i" (interactive) mode to avoid unsightly warnings
(setq exec-path-from-shell-arguments
	  (remove "-i" exec-path-from-shell-arguments))

(exec-path-from-shell-initialize)
