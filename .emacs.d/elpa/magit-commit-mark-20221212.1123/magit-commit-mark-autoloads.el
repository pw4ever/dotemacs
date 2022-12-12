;;; magit-commit-mark-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "magit-commit-mark" "magit-commit-mark.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from magit-commit-mark.el

(autoload 'magit-commit-mark-toggle-read "magit-commit-mark" "\
Toggle the current commit read status.
ARG is the bit which is toggled, defaulting to 1 (read/unread)." t nil)

(autoload 'magit-commit-mark-toggle-star "magit-commit-mark" "\
Toggle the current commit star status.
ARG is the bit which is toggled, defaulting to 1 (read/unread)." t nil)

(autoload 'magit-commit-mark-toggle-urgent "magit-commit-mark" "\
Toggle the current commit urgent status.
ARG is the bit which is toggled, defaulting to 1 (read/unread)." t nil)

(autoload 'magit-commit-mark-next-unread "magit-commit-mark" "\
Jump to the next unread message." t nil)

(autoload 'magit-commit-mark-prev-unread "magit-commit-mark" "\
Jump to the previous unread message." t nil)

(autoload 'magit-commit-mark-mode "magit-commit-mark" "\
Magit Commit Mark Minor Mode.

This is a minor mode.  If called interactively, toggle the
`Magit-Commit-Mark mode' mode.  If the prefix argument is
positive, enable the mode, and if it is zero or negative, disable
the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `magit-commit-mark-mode'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "magit-commit-mark" '("magit-commit-mark-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; magit-commit-mark-autoloads.el ends here
