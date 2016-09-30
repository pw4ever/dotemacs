(require 'omnisharp)

(dolist
	(hook '(csharp-mode-hook))
  (add-hook hook (lambda () (omnisharp-mode +1))))
