;; http://github.com/clojure-emacs/inf-clojure

(autoload 'inf-clojure "inf-clojure" "Run an inferior Clojure process" t)

;; Don't enable inf-clojure-minor-mode and cider-mode at the same time.
;; They have overlapping functionality and keybindings and the result will be nothing short of havoc.
;;(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)

(add-hook 'inf-clojure-mode-hook #'eldoc-mode)
