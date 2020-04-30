;;
;; EasyPG Assistant encryption
;;
;; - https://orgmode.org/worg/org-tutorials/encrypting-files.html
;; -
;; Encrypting the Whole File Using EasyPG:
;; # -*- mode:org; epa-file-encrypt-to: ("me@mydomain.com") -*-

(require 'epa-file)
(epa-file-enable)
(setq epa-file-inhibit-auto-save t)
