(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (when (display-graphic-p)
       (color-theme-pok-wog))))
