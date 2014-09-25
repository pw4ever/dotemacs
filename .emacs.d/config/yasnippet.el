(require 'yasnippet)

(define-key yas-minor-mode-map
  (kbd "<tab>") nil)
(define-key yas-minor-mode-map
  (kbd "TAB") nil)
(define-key yas-minor-mode-map
  (kbd "C-;") 'yas-expand)

(define-key yas-minor-mode-map
  (kbd "C-'") 'yas-next-field-or-maybe-expand)

(define-key yas-minor-mode-map
  (kbd "C-\"") 'yas-prev-field)

(yas-global-mode 1)
