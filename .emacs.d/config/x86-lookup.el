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

;; Hack the definition of x86-lookup-browser-pdf-any.
;; * Add SumatraPDF as a PDF browser.
;; * Deprioritize doc-view because it hangs Emacs when opening the 20+MB Intel SDM.
(defun x86-lookup-browse-pdf-any (pdf page)
  "Try visiting PDF using the first viewer found."
  (or (ignore-errors (x86-lookup-browse-pdf-mupdf pdf page))
      (ignore-errors (x86-lookup-browse-pdf-sumatrapdf pdf page))
      (ignore-errors (x86-lookup-browse-pdf-xpdf pdf page))
      (ignore-errors (x86-lookup-browse-pdf-okular pdf page))
      (ignore-errors (x86-lookup-browse-pdf-gv pdf page))
      (ignore-errors (x86-lookup-browse-pdf-zathura pdf page))
      (ignore-errors (x86-lookup-browse-pdf-evince pdf page))
      (ignore-errors (x86-lookup-browse-pdf-browser pdf page))
      (ignore-errors (x86-lookup-browse-pdf-pdf-tools pdf page))
      (ignore-errors (x86-lookup-browse-pdf-doc-view pdf page))
      (error "Could not find a PDF viewer.")))

(setq x86-lookup-browse-pdf-function
      #'x86-lookup-browse-pdf-any)
