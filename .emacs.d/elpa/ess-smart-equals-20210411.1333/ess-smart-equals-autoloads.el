;;; ess-smart-equals-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "ess-smart-equals" "ess-smart-equals.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from ess-smart-equals.el

(autoload 'ess-smart-equals-percent "ess-smart-equals" "\
Completion and cycling through %-operators only, unless in comment or string.
Outside a comment or string, this forces a % context as described
in `ess-smart-equals-contexts', so the corresponding list can be
customized to determine ordering. This should be bound to the `%'
key.

\(fn &optional LITERAL)" t nil)

(autoload 'ess-smart-equals-open-brace "ess-smart-equals" "\
Inserts properly indented and spaced brace pair.

\(fn &optional LITERAL)" t nil)

(autoload 'ess-smart-equals-open-paren "ess-smart-equals" "\
Inserts properly a properly spaced paren pair with an active keymap inside.
Point is left in the middle of the paren pair and associated with
a special keymap, where tab deletes the extra space and moves
point out of the parentheses and comma inserts a spaced comma,
keeping point on the special space character. 

\(fn &optional LITERAL)" t nil)

(autoload 'ess-smart-equals-activate "ess-smart-equals" "\
Turn on `ess-smart-equals-mode' in current and future buffers of ACTIVE-MODES.
If non-nil, each entry of ACTIVE-MODES is either a major-mode
symbol or a list of two symbols (major-mode major-mode-hook). In
the former case, the hook symbol is constructed by adding
\"-hook\" to the major mode symbol name. If ACTIVE-MODES is nil,
the specification in `ess-smart-equals-default-modes' is used
instead.

This adds to each specified major-mode hook a function that will
enable `ess-smart-equals-mode' and also enables the minor mode in
all current buffers whose major mode is one of the major modes
just described.

\(fn &rest ACTIVE-MODES)" t nil)

(autoload 'ess-smart-equals "ess-smart-equals" "\
Insert or complete a properly-spaced R/S (assignment) operator at point.
With a prefix argument (or with LITERAL non-nil) insert this key
literally, repeated LITERAL times if a positive integer.
Otherwise, complete a partial operator or insert a new operator
based on context (major mode and syntactic context) according to
the specification given in `ess-smart-equals-contexts'.
Immediately following invocations of the command cycle through
operators in this context based list in the specified priority
order. Immediately following insertion selected keys (e.g.,
backspace) will remove the inserted operator or (e.g., tab) allow
selection of an inserted operator by completion. See
`ess-smart-equals-cancel-keys'; a shift-modified one of these
keys (except 'C-g') will do a single character deletion and
restore the standard meaning of keys.

\(fn &optional LITERAL)" t nil)

(autoload 'ess-smart-equals-mode "ess-smart-equals" "\
Minor mode enabling a smart key for context-aware operator insertion/cycling.

If called interactively, enable Ess-Smart-Equals mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

Ess-smart-equals-mode is a buffer-local minor mode. Enabling it
binds a key ('=' by default) to a function that inserts,
completes, or cycles among operators chosen by the syntactic
context at point. These contexts and the priorities of insertion
and cycling are customizable. The operators inserted are usually
assignment operators but can include others as well, e.g.,
comparison operators in and `if' or `while'. When
`ess-smart-equals-extra-ops' is appropriately set, this minor
mode also activates additional smart operators for convenience.

When called interactively, `ess-smart-equals-mode' toggles the
mode without a prefix argument; disables the mode if the prefix
argument is a non-positive integer; and enables the mode if the
prefix argument is a positive integer. When called from Lisp, the
command toggles the mode with argument `toggle'; disables the
mode for a non-positive integer; and enables the mode otherwise,
even with an omitted or nil argument.

Do not set the variable `ess-smart-equals-mode' directly; use the
function of the same name instead.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "ess-smart-equals" '("ess")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; ess-smart-equals-autoloads.el ends here
