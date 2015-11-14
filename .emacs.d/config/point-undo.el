;; http://www.emacswiki.org/emacs/point-undo.el

(require 'point-undo)
(global-set-key (kbd "C-,") 'point-undo)
(global-set-key (kbd "M-[") 'point-undo)
(global-set-key (kbd "C-.") 'point-redo)
(global-set-key (kbd "M-]") 'point-redo)
