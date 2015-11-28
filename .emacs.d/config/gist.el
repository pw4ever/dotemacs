;;

(require 'gist)

(global-set-key (kbd "C-c C-/ RET") #'gist-list-user)
(global-set-key (kbd "C-c C-/ l") #'gist-list-user)
(global-set-key (kbd "C-c C-/ f") #'gist-fetch)
(global-set-key (kbd "C-c C-/ M-f") #'gist-fork)
(global-set-key (kbd "C-c C-/ p") #'gist-region-or-buffer-private)
(global-set-key (kbd "C-c C-/ M-p") #'gist-region-or-buffer)
