(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-i") 'company-complete)

;; (defun indent-or-complete ()
;;   (interactive)
;;   (if (looking-at "\\_>")
;;       (company-complete-common)
;;     (indent-according-to-mode)))

;; (defun complete-or-indent ()
;;   (interactive)
;;   (if (company-manual-begin)
;;       (company-complete-common)
;;     (indent-according-to-mode)))

;; (global-set-key (kbd "<tab>")
;; 		'indent-or-complete)


