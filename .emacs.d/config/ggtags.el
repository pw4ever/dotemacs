;; https://github.com/leoliu/ggtags
(require 'ggtags)

(custom-set-variables
 (list 'ggtags-mode-prefix-key (kbd "C-c C-t")))

(define-global-minor-mode global-ggtags-mode
  ggtags-mode
  ggtags-mode)

(global-ggtags-mode)
