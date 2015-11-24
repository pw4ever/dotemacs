;; http://github.com/clojure-emacs/inf-clojure

(autoload 'inf-clojure "inf-clojure" "Run an inferior Clojure process" t)
(add-hook 'clojure-mode-hook #'inf-clojure-minor-mode)
