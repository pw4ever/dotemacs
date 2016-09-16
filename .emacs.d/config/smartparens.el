(require 'smartparens-config)

(dolist
	(hook '(lisp-hook-mode
			emacs-lisp-mode-hook
			
			cider-mode-hook
			cider-repl-mode-hook
			clojure-mode-hook

			go-mode-hook

			comint-mode-hook
			
			lisp-interaction-mode-hook
			slime-repl-mode-hook

			scheme-mode-hook

			ess-mode-hook
			ess-R-post-run-hook

			latex-mode-hook
			LaTeX-mode-hook

			html-mode-hook
			sgml-mode-hook
			css-mode-hook

			c-mode-hook
			c++-mode-hook
			asm-mode-hook))
  (add-hook hook (lambda () (smartparens-strict-mode +1))))

;; https://github.com/Fuco1/smartparens/wiki/Example-configuration

										;(smartparens-global-mode t)
;;(smartparens-global-strict-mode t)

;; highlights matching pairs
(show-smartparens-global-mode t)

;;;;;;;;;;;;;;;;;;;;;;;;
;; keybinding management

(define-key sp-keymap (kbd "C-M-f") 'sp-forward-sexp)
(define-key sp-keymap (kbd "C-M-b") 'sp-backward-sexp)

(define-key sp-keymap (kbd "C-M-d") 'sp-down-sexp)
(define-key sp-keymap (kbd "C-M-a") 'sp-backward-down-sexp)
(define-key sp-keymap (kbd "C-S-a") 'sp-beginning-of-sexp)
(define-key sp-keymap (kbd "C-S-d") 'sp-end-of-sexp)

(define-key sp-keymap (kbd "C-M-e") 'sp-up-sexp)
(define-key emacs-lisp-mode-map (kbd ")") 'sp-up-sexp)
(define-key sp-keymap (kbd "C-M-u") 'sp-backward-up-sexp)
(define-key sp-keymap (kbd "C-M-t") 'sp-transpose-sexp)

(define-key sp-keymap (kbd "C-M-n") 'sp-next-sexp)
(define-key sp-keymap (kbd "C-M-p") 'sp-previous-sexp)

(define-key sp-keymap (kbd "C-M-k") 'sp-kill-sexp)
(define-key sp-keymap (kbd "C-M-w") 'sp-copy-sexp)

(define-key sp-keymap (kbd "M-<delete>") 'sp-unwrap-sexp)
(define-key sp-keymap (kbd "M-<backspace>") 'sp-backward-unwrap-sexp)

(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)
(define-key sp-keymap (kbd "C-M-<left>") 'sp-backward-slurp-sexp)
(define-key sp-keymap (kbd "C-M-<right>") 'sp-backward-barf-sexp)

(define-key sp-keymap (kbd "M-D") 'sp-splice-sexp)
(define-key sp-keymap (kbd "C-M-<delete>") 'sp-splice-sexp-killing-forward)
(define-key sp-keymap (kbd "C-M-<backspace>") 'sp-splice-sexp-killing-backward)
(define-key sp-keymap (kbd "C-S-<backspace>") 'sp-splice-sexp-killing-around)

(define-key sp-keymap (kbd "C-]") 'sp-select-next-thing-exchange)
(define-key sp-keymap (kbd "C-M-[") 'sp-select-previous-thing)
(define-key sp-keymap (kbd "C-M-]") 'sp-select-next-thing)

(define-key sp-keymap (kbd "M-F") 'sp-forward-symbol)
(define-key sp-keymap (kbd "M-B") 'sp-backward-symbol)

(define-key sp-keymap (kbd "C-M-m T") 'sp-prefix-tag-object)
(define-key sp-keymap (kbd "C-M-m P") 'sp-prefix-pair-object)

(define-key sp-keymap (kbd "C-M-m c") 'sp-convolute-sexp)
(define-key sp-keymap (kbd "C-M-m a") 'sp-absorb-sexp)
(define-key sp-keymap (kbd "C-M-m e") 'sp-emit-sexp)
(define-key sp-keymap (kbd "C-M-m p") 'sp-add-to-previous-sexp)
(define-key sp-keymap (kbd "C-M-m n") 'sp-add-to-next-sexp)
(define-key sp-keymap (kbd "C-M-m j") 'sp-join-sexp)
(define-key sp-keymap (kbd "C-M-m s") 'sp-split-sexp)

;;;;;;;;;;;;;;;;;;
;; pair management

(sp-local-pair 'minibuffer-inactive-mode "'" nil :actions nil)

;;; markdown-mode
(sp-with-modes '(markdown-mode gfm-mode rst-mode)
  (sp-local-pair "*" "*" :bind "C-*")
  (sp-local-tag "2" "**" "**")
  (sp-local-tag "s" "```scheme" "```")
  (sp-local-tag "<"  "<_>" "</_>" :transform 'sp-match-sgml-tags))

;;; tex-mode latex-mode
(sp-with-modes '(tex-mode plain-tex-mode latex-mode)
  (sp-local-tag "i" "\"<" "\">"))

;;; html-mode
(sp-with-modes '(html-mode sgml-mode)
  (sp-local-pair "<" ">"))

;;; lisp modes
(sp-with-modes sp--lisp-modes
  (sp-local-pair "(" nil :bind "C-("))
