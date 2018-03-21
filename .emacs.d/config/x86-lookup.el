;; https://github.com/skeeto/x86-lookup/blob/master/x86-lookup.el

(require 'x86-lookup)

(global-set-key (kbd "C-h x") #'x86-lookup)

(let ((home (getenv "HOME")))
  (when (and (boundp 'home)
			 home)
	(let ((default-x86-lookup-pdf (concat (file-name-as-directory home)
										  (file-name-as-directory "Documents")
										  "intel-sdm.pdf")))
	  (when (and (file-exists-p default-x86-lookup-pdf)
				 (not x86-lookup-pdf))
		(setq x86-lookup-pdf default-x86-lookup-pdf)))))

;; Hack the definition of `x86-lookup-create-index' to make sure the coding system is utf-8.
(cl-defun x86-lookup-create-index (&optional (pdf x86-lookup-pdf))
  "Create an index alist from PDF mapping mnemonics to page numbers.
This function requires the pdftotext command line program."
  (let ((mnemonic (concat "\\(?:.*\n\n?\\)?"
                          "\\([[:alnum:]/[:blank:]]+\\)[[:blank:]]*\\(?:--\\|—\\)\\(?:.*\n\n?\\)\\{1,3\\}"
                          "[[:blank:]]*Opcode"
                          ))
		(coding-system-for-read 'utf-8)
		(coding-system-for-write 'utf-8)
        (case-fold-search t))
    (with-temp-buffer
      (call-process x86-lookup-pdftotext-program nil t nil
                    (file-truename pdf) "-")
      (setf (point) (point-min))
      (cl-loop for page upfrom 1
               while (< (point) (point-max))
               when (looking-at mnemonic)
               nconc (x86-lookup--expand (match-string 1) page) into index
               do (forward-page)
               finally (cl-return
                        (cl-remove-duplicates
                         index :key #'car :test #'string= :from-end t))))))

(defun x86-lookup-browse-pdf-sumatrapdf (pdf page)
  "View PDF at PAGE using Sumatra PDF."
  (start-process "sumatrapdf" nil "sumatrapdf" "-page" (format "%d" page) pdf))

;; Hack the definition of x86-lookup-browser-pdf-any.
;; * Add SumatraPDF as a PDF browser.
;; * Deprioritize doc-view because it hangs Emacs when opening the 20+MB Intel SDM.
(defun x86-lookup-browse-pdf-any (pdf page)
  "Try visiting PDF using the first viewer found."
  (or (ignore-errors (x86-lookup-browse-pdf-evince pdf page))
      (ignore-errors (x86-lookup-browse-pdf-sumatrapdf pdf page))
      (ignore-errors (x86-lookup-browse-pdf-xpdf pdf page))
      (ignore-errors (x86-lookup-browse-pdf-okular pdf page))
      (ignore-errors (x86-lookup-browse-pdf-gv pdf page))
      (ignore-errors (x86-lookup-browse-pdf-zathura pdf page))
      (ignore-errors (x86-lookup-browse-pdf-mupdf pdf page))
      (ignore-errors (x86-lookup-browse-pdf-browser pdf page))
      (ignore-errors (x86-lookup-browse-pdf-pdf-tools pdf page))
      (ignore-errors (x86-lookup-browse-pdf-doc-view pdf page))
      (error "Could not find a PDF viewer.")))

(setq x86-lookup-browse-pdf-function
	  #'x86-lookup-browse-pdf-any)
