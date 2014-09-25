;(load "auctex.el" nil t t)
;(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-electric-escape nil)
(setq TeX-math-close-double-dollar t)

(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)   ; with AUCTeX LaTeX mode
(setq reftex-plug-into-auctex t)

(add-hook 'LaTeX-mode-hook (lambda () (TeX-fold-mode 1)))
