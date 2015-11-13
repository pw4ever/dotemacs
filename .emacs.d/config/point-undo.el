;; http://www.emacswiki.org/emacs/point-undo.el

(require 'point-undo)
(global-set-key (kbd "C-,") 'point-undo)
(global-set-key (kbd "C-.") 'point-redo)
