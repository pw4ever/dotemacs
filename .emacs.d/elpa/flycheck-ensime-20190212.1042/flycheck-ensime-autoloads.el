;;; flycheck-ensime-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flycheck-ensime" "flycheck-ensime.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from flycheck-ensime.el

(autoload 'flycheck-ensime-start "flycheck-ensime" "\
This function mapping ensime to flycheck.
Argument CHECKER syntax checker being started.
Argument CONT callback.

\(fn CHECKER CONT)" nil nil)

(with-eval-after-load 'flycheck (with-eval-after-load 'ensime (flycheck-define-generic-checker 'ensime "A Scala (Java) checker using ENSIME." :start 'flycheck-ensime-start :modes '(scala-mode java-mode) :predicate 'ensime-connection-or-nil) (add-to-list 'flycheck-checkers 'ensime)))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flycheck-ensime-autoloads.el ends here
