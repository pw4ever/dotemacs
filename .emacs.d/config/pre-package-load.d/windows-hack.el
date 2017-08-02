(when (eq system-type 'windows-nt)
  ;; to be unset in post-package-load.d
  (setq package-check-signature nil))
