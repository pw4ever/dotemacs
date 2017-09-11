;; flyspell mode
;; http://www.emacswiki.org/emacs/FlySpell
;;(add-hook 'text-mode-hook 'flyspell-mode)
(setq flyspell-use-meta-tab nil)		; prevent it from clashing with, e.g., Org's M-TAB
(setq flyspell-issue-welcome-flag nil)
(setq flyspell-issue-message-flag nil)
(eval-after-load "helm"
  '(progn
	 (global-set-key (kbd "C-c # w") 'helm-flyspell-correct)))
(global-set-key (kbd "C-c # b") 'flyspell-buffer)
