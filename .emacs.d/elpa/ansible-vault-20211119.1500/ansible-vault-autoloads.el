;;; ansible-vault-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ansible-vault" "ansible-vault.el" (0 0 0 0))
;;; Generated autoloads from ansible-vault.el

(autoload 'ansible-vault--fingerprint-buffer "ansible-vault" "\
Parse and store the ansible-vault header values." nil nil)

(autoload 'ansible-vault--is-encrypted-vault-file "ansible-vault" "\
Identifies if the current buffer is an encrypted `ansible-vault' file.

This function just looks to see if the first line of the buffer
is matched by `ansible-vault--file-header-regex'." nil nil)

(autoload 'ansible-vault--kill-emacs-hook "ansible-vault" "\
`kill-emacs-hook' for Emacs when `ansible-vault-mode' is loaded.

Ensures deletion of ansible-vault generated password files." nil nil)

(autoload 'ansible-vault-mode "ansible-vault" "\
Minor mode for manipulating ansible-vault files

This is a minor mode.  If called interactively, toggle the
`ansible-vault mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `ansible-vault-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "ansible-vault" '("ans"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ansible-vault-autoloads.el ends here
