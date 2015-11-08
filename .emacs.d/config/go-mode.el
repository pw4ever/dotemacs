(require 'go-mode-autoloads)

;; if GOPATH envar is not defined, define it to be $HOME/go
(unless (getenv "GOPATH")
  (let ((home (getenv "HOME")))
	(when home
	  (setenv "GOPATH" (concat (file-name-as-directory home) "go")))))

(add-to-list 'exec-path (concat (file-name-as-directory (getenv "GOPATH")) "bin"))
