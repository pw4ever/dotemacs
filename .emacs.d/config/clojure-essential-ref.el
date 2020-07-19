(require 'clojure-essential-ref)

(use-package clojure-essential-ref-nov
  :quelpa (clojure-essential-ref-nov :fetcher github :repo "p3r7/clojure-essential-ref")
  :after clojure-essential-ref
  :init
  (setq clojure-essential-ref-nov-epub-path "~/Documents/Clojure_The_Essential_Reference.epub"))
