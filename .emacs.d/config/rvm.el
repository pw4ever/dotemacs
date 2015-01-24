(require 'rvm)
(rvm-use-default)
(add-hook 'inf-ruby-mode-hook
	  'rvm-activate-corresponding-ruby)
(add-hook 'ruby-mode-common-hook
	  'rvm-activate-corresponding-ruby)

