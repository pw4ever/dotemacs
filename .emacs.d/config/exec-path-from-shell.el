;; https://github.com/purcell/exec-path-from-shell
(require 'exec-path-from-shell)

;; Customize `exec-path-from-shell-variables' to modify the list of variables imported.
(setq exec-path-from-shell-variables
	  '("PATH" "MANPATH"))

;; do not warn about wrong startup files
(setq exec-path-from-shell-check-startup-files
	  nil)

;; Only on system that has a built-in compatible shell
(when (memq system-type
			'(gnu
			  gnu/linux
			  gnu/kfreebsd
			  darwin
			  ;; ms-dos
			  ;; windows-nt
			  cygwin))
  (exec-path-from-shell-initialize))
