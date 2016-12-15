;; https://github.com/skeeto/x86-lookup/blob/master/x86-lookup.el

(require 'x86-lookup)

(global-set-key (kbd "C-h x") #'x86-lookup)

;; the default build-in pdf browse function hangs Emacs on the large "intel-sdm.pdf".
(setq x86-lookup-browse-pdf-function
	  #'x86-lookup-browse-pdf-evince)

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
  (let ((mnemonic (concat "INSTRUCTION SET REFERENCE, [A-Z]-[A-Z]\n\n"
                          "\\([[:alnum:]/ ]+\\)[- ]?—"))
		(coding-system-for-read 'utf-8)
		(coding-system-for-write 'utf-8)
        (case-fold-search nil))
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
