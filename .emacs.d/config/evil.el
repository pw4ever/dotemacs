(setq evil-default-state 'emacs)
(setq evil-auto-indent t)
(setq evil-shift-width 8)
(setq evil-repeat-move-cursor t)
(setq evil-find-skip-newlines nil)
(setq evil-want-fine-undo nil)
(setq evil-regexp-search t)
(setq evil-search-wrap t)
(setq evil-flash-delay 10)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll nil)

(require 'evil)
(evil-mode +1)

;;; https://stackoverflow.com/a/10166400
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
In Delete Selection mode, if the mark is active, just deactivate it;
then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)