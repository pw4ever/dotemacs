(require 'cljr-helm)

(eval-after-load 'clojure-mode
  '(progn
	 (define-key clojure-mode-map (kbd "C-c r") #'cljr-helm)
	 (define-key clojure-mode-map (kbd "C-c R") #'cljr-helm)))
