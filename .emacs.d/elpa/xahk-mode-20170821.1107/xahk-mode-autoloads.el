;;; xahk-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "xahk-mode" "xahk-mode.el" (0 0 0 0))
;;; Generated autoloads from xahk-mode.el

(autoload 'xahk-mode "xahk-mode" "\
Major mode for editing AutoHotkey script (AHK).

Shortcuts             Command Name
\\[comment-dwim]       `comment-dwim'

\\[xahk-complete-symbol]      `xahk-complete-symbol'

\\[xahk-lookup-ahk-ref]     `xahk-lookup-ahk-ref'

Complete documentation at URL `http://xahlee.info/mswin/emacs_autohotkey_mode.html'.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "xahk-mode" '("ahk-mode" "xahk-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; xahk-mode-autoloads.el ends here
