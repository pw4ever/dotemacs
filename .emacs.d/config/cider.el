;;; cider --- configure cider

;;; Commentary:
;; https://github.com/clojure-emacs/cider/blob/master/README.md#configuration

;;; Code:
(require 'cider)

;; (setenv "PATH" (concat (getenv "PATH") ":/opt/java/bin"))
;; (setq exec-path (append exec-path '("/opt/java/bin")))

(setenv "PATH" (concat (getenv "PATH") ":~/bin/"))
(setq exec-path (append exec-path '("~/bin/")))

;; (custom-set-variables
;;  '(cider-server-command "~/tools/bin/lein repl :headless"))

(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)

(setq nrepl-log-messages t) ; for debugging CIDER

(setq nrepl-hide-special-buffers nil)

(setq cider-repl-tab-command 'cider-repl-indent-and-complete-symbol)
;;(setq cider-repl-tab-command 'indent-for-tab-command)
(setq cider-prefer-local-resources t)

(setq cider-repl-pop-to-buffer-on-connect t)
(setq cider-show-error-buffer t)
(setq cider-auto-select-error-buffer t)

;; valid filter types: java, clj, repl, tooling, dup
(setq cider-stacktrace-default-filters '(tooling dup))

(setq nrepl-buffer-name-separator "-")
(setq nrepl-buffer-name-show-port t)
(setq cider-repl-display-in-current-window t)
(setq cider-prompt-save-file-on-load nil)
(setq cider-repl-result-prefix ";; => ")
(setq cider-interactive-eval-result-prefix ";; => ")
(setq cider-repl-use-clojure-font-lock t)

;; do not force SSH over the remote hosts, e.g., for Figurehead connection
(setq nrepl-force-ssh-for-remote-hosts nil)

(setq cider-switch-to-repl-command 'cider-switch-to-relevant-repl-buffer)
										;(setq cider-switch-to-repl-command 'cider-switch-to-current-repl-buffer)

;; REPL history
(setq cider-repl-wrap-history t)
(setq cider-repl-history-size 1000) ; the default is 500
(setq cider-repl-history-file "~/.emacs.d/cider.history")

(dolist (hook '(cider-mode-hook
				cider-repl-mode-hook
				clojure-mode-hook))
  (add-hook hook
			(lambda ()
			  ;; turn off ggtags mode to prevent collision
			  (when (boundp 'ggtags-mode)
				(ggtags-mode -1))
			  (when (boundp 'yas-activate-extra-mode)
				(yas-activate-extra-mode 'clojure-mode))))
  (dolist (mode '(subword-mode))
    (add-hook hook mode)))

;; ;; integration with other modes
;; (add-hook 'cider-repl-mode-hook 'subword-mode) ;; for editing CamelCase
;; (add-hook 'cider-repl-mode-hook 'smartparens-strict-mode)
;; (add-hook 'cider-repl-mode-hook 'rainbow-delimiters-mode)
;; (add-hook 'cider-repl-mode-hook 'company-mode)
;; (add-hook 'cider-mode-hook 'company-mode)

;;; customize keybinding

(define-key cider-repl-mode-map (kbd "C-c M-o") 'cider-repl-clear-buffer)
