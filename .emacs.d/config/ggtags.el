;; https://github.com/leoliu/ggtags
(require 'ggtags)

(custom-set-variables
 (list 'ggtags-mode-prefix-key (kbd "C-c C-t")))

(define-global-minor-mode global-ggtags-mode
  ggtags-mode
  ggtags-mode)



(eval-after-load 'ggtags
  '(progn
     (define-key ggtags-mode-map (kbd "M-*") 'ggtags-prev-mark)
     (define-key ggtags-mode-map (kbd "M-[") 'ggtags-prev-mark)
     (define-key ggtags-mode-map (kbd "M-{") 'ggtags-prev-mark)
     (define-key ggtags-mode-map (kbd "M-}") 'ggtags-next-mark)
     (define-key ggtags-mode-map (kbd "M-?") 'ggtags-show-definition)
     (define-key ggtags-mode-map (kbd "M-/") 'ggtags-find-file)
     ))

(global-ggtags-mode)
