(setq inferior-lisp-program "/usr/bin/sbcl")
;(add-to-list 'load-path "~/tools/slime/")
(require 'slime-autoloads)
(slime-setup '(slime-fancy slime-banner slime-asdf 
			   slime-indentation slime-sbcl-exts 
			   slime-tramp))

(setq slime-net-coding-system 'utf-8-unix)

(setq common-lisp-hyperspec-root
      "file:///usr/share/doc/HyperSpec/") ; see slime/hyperspec.el

(add-hook 'slime-mode-hook 'my-slime-mode-customization)

(defun my-slime-selector-binding ()
  (local-set-key (kbd "C-c s") 'slime-selector))
(add-hook 'slime-mode-hook 'my-slime-selector-binding)
(add-hook 'slime-repl-mode-hook 'my-slime-selector-binding)
