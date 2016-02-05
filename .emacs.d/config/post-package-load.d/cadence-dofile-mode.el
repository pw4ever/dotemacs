;;; cadence-dofile-mode.el --- Major mode for editing Cadence `.do' files. -*- coding: utf-8 -*-
;; Author: Wei Peng <wei.peng@intel.com>

;;; Commentary:
;;
;; This mode is designed to edit Cadence Do-files.


;;; Code:

(require 'newcomment)

;; Variables:

(defvar cadence-dofile-mode-map
  (let ((map (make-sparse-keymap))
		(menu-map (make-sparse-keymap)))
    map)
  "Local keymap for `cadence-dofile-mode' buffers.")

(defvar cadence-dofile-mode-syntax-table
  (let ((table (make-syntax-table)))
	;; symbol constituents
	(modify-syntax-entry ?- "_" table)
	(modify-syntax-entry ?_ "_" table)
	(modify-syntax-entry ?$ "_" table)
	;; punctuation
	(modify-syntax-entry ?> "." table)
	;; comments
	(modify-syntax-entry ?/ ". 12" table)
	(modify-syntax-entry ?\n ">" table)
	(modify-syntax-entry ?\r ">" table)
	(modify-syntax-entry ?\" "\"" table)
	;;
	(modify-syntax-entry ?\( "()" table)
    (modify-syntax-entry ?\) ")(" table)
	table)
  "Syntax table for `cadence-dofile-mode' buffers.")

(defvar cadence-dofile-font-lock-keywords
  '(("^[ \t]*\\_<\\(abstract\\|add\\|analyze\\|commit\\|compare\\|delete\\|elaborate\\|exit\\|read\\|rem\\(?:ove\\)?\\|report\\|reset\\|save\\|set\\|test\\|uniquify\\|tclmode\\|vpxmode\\|write\\|map\\|source\\)\\_>" 1 'font-lock-keyword-face) ; keywords
	(">>?" . 'font-lock-keyword-face) 	; direct command
	("\\_<\\(-\\(?:gol\\(?:den\\)?\\|rev\\(?:ised\\)?\\)\\)\\b" 1 'font-lock-type-face) ; special parameter specifiers
	("\\_<\\(-\\(?:\\sw\\|\\s_\\)+\\)" 1 'font-lock-function-name-face) ;  parameter specifiers
	("\\_<\\([~$]\\(?:\\sw\\|\\s_\\|\\s$\\)+\\)" 1 'font-lock-variable-name-face) ; variable ($, ~)
	)
  "Keywords to highlight in (cadence-dofile-mode).")



;;;###autoload
(defun cadence-dofile-mode ()
  "Mode for Cadence `do' files."
  (interactive)

  (kill-all-local-variables)
  (use-local-map cadence-dofile-mode-map)
  (setq major-mode 'cadence-dofile-mode
		mode-name "Cadence-Dofile")

  ;; font lock
  (set (make-local-variable 'font-lock-defaults)
	   '(cadence-dofile-font-lock-keywords ; keywords
		 nil							   ; keywords-only: nil => also syntax-based 
		 t								   ; case-fold: t => ignore case
		 nil							   ; syntax-aliat
		 nil							   ; syntax-begin
		 ;; other variables
		 ))
  
  ;; Let newcomment.el decide this for itself.
  ;;(set (make-local-variable 'comment-use-syntax) t)
  (set (make-local-variable 'parse-sexp-ignore-comments) t)
  
  
  (set-syntax-table cadence-dofile-mode-syntax-table)
  (run-mode-hooks 'cadence-dofile-mode-hook))

(add-to-list 'auto-mode-alist '("\\.do\\'" . cadence-dofile-mode))
(add-to-list 'auto-mode-alist '("\\.dofile\\'" . cadence-dofile-mode))

(provide 'cadence-dofile-mode)

;;; cadence-dofile-mode.el ends here
