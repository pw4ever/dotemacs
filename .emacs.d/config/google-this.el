;; http://github.com/Malabarba/emacs-google-this

;; Unmask "C-c /" for org-check-*
(setq google-this-keybind (kbd "C-x g"))

(require 'google-this)

(add-hook 'text-mode-hook 'google-this-mode)
(add-hook 'prog-mode-hook 'google-this-mode)
