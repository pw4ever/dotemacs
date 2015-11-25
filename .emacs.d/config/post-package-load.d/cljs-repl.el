;; https://github.com/clojure/clojurescript/wiki/Emacs-%26-Inferior-Clojure-Interaction-Mode

(defun cljs-repl-using-java ()
  (interactive)
  (run-clojure "java -cp cljs.jar clojure.main repl.clj"))

(defun cljs-repl-using-lein ()
  (interactive)
  (run-clojure "lein trampoline run -m clojure.main repl.clj"))
