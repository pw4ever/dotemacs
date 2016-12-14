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
