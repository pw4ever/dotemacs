;; https://github.com/jackkamm/undo-propose-el

;; Simple configuration

(require 'undo-propose)
(global-set-key (kbd "C-c u") 'undo-propose)

;; Opinionated evil configuration

(with-eval-after-load 'evil
  (global-undo-tree-mode -1)
  (evil-define-key 'normal 'global "u" 'undo-only))

(use-package undo-propose
  :commands undo-propose
  :init
  (evil-define-key 'normal 'global (kbd "C-r") 'undo-propose))
