(require 'helm-ag)

(setq helm-ag-insert-at-point 'symbol)
(setq helm-ag-fuzzy-match t)
(setq helm-ag-use-agignore t)

(define-key global-map (kbd "M-g a") 'helm-do-ag)
(define-key global-map (kbd "M-g M-a") 'helm-do-ag-project-root)
(define-key global-map (kbd "M-g C-a") 'helm-do-ag-this-file)