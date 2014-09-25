(eval-after-load 'cider-doc
  '(progn
     (define-key cider-doc-map (kbd "c") 'clojure-cheatsheet)
     (define-key cider-doc-map (kbd "\C-c") 'clojure-cheatsheet)))


