;; https://github.com/Andersbakken/rtags#code-completion-in-emacs

(require 'rtags)
(require 'company-rtags)
(require 'company)
(global-company-mode)

(setq rtags-completions-enabled t)
(push 'company-rtags company-backends)
(global-company-mode)

(define-key c-mode-base-map
  (kbd "<C-tab>")
  (function company-complete))