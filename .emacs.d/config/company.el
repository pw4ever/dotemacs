(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
;; http://www.emacswiki.org/CompanyMode#toc5
(setq company-idle-delay 0)
(global-set-key (kbd "C-M-i") 'company-complete)

(global-set-key (kbd "<f5>") 'company-mode)

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


