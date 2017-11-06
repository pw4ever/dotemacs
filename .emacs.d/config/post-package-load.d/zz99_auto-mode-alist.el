;; Forcibly prepend the following auto-mode-alist.
(seq-doseq (mode '(("\\.[sS]\\'" . asm-mode)))
  (add-to-list 'auto-mode-alist mode
               nil (lambda (a b) nil)))
