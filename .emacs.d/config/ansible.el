;; https://github.com/k1LoW/emacs-ansible

(add-hook 'yaml-mode-hook '(lambda () (ansible 1)))
(add-hook 'ansible-hook 'ansible-auto-decrypt-encrypt)
