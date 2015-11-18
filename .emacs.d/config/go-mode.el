;; https://github.com/dominikh/go-mode.el

(require 'go-mode)

;; set $GOPATH to $HOME/go by default
(let ((gopath (getenv "GOPATH")))
  (when (or (not gopath)
		   (string= gopath "")
		   (not (file-accessible-directory-p gopath)))
	(let ((home (getenv "HOME")))
	  (when (and home
			   (file-accessible-directory-p home))
		(setenv "GOPATH" (concat (file-name-as-directory home) "go"))))))

;; add $GOPATH/bin to exec-path
(add-to-list 'exec-path
			 (concat (file-name-as-directory (getenv "GOPATH"))
					 "bin"))

;; add $GOROOT/bin to exec-path if $GOROOT is defined
(let ((goroot (getenv "GOROOT")))
  (when (and goroot
		   (file-accessible-directory-p goroot))
	(add-to-list 'exec-path
				 (concat (file-name-as-directory goroot)
						 "bin"))))

;; recommended by go-mode doc
(add-hook 'before-save-hook #'gofmt-before-save)

;; go get github.com/rogpeppe/godef
(add-hook 'go-mode-hook (lambda ()
                          (local-set-key (kbd "M-.") #'godef-jump)))

;; https://github.com/dougm/goflymake
;; deps: go get -u github.com/dougm/goflymake
;; go-flycheck.el is under ~/.emacs.d/config/00deps/ added in pre-package-load.el
(require 'go-flycheck)

(define-key go-mode-map (kbd "C-c d") 'godef-describe)
(define-key go-mode-map (kbd "C-c C-d") 'godoc)

(define-key go-mode-map (kbd "C-c c") 'go-coverage)
(define-key go-mode-map (kbd "C-c C-c") 'go-coverage)

;; test
(eval-after-load "gotest"
  '(progn
	 (define-key go-mode-map (kbd "C-c C-t b") 'go-test-current-benchmark)
	 (define-key go-mode-map (kbd "C-c C-t C-b") 'go-test-current-benchmark)    
	 (define-key go-mode-map (kbd "C-c C-t c") 'go-test-current-coverage)
	 (define-key go-mode-map (kbd "C-c C-t C-c") 'go-test-current-coverage)
	 (define-key go-mode-map (kbd "C-c C-t f") 'go-test-current-file)
	 (define-key go-mode-map (kbd "C-c C-t C-f") 'go-test-current-file)
	 (define-key go-mode-map (kbd "C-c C-t p") 'go-test-current-project)
	 (define-key go-mode-map (kbd "C-c C-t C-p") 'go-test-current-project)
	 (define-key go-mode-map (kbd "C-c C-t t") 'go-test-current-test)
	 (define-key go-mode-map (kbd "C-c C-t C-t") 'go-test-current-test)))

;; go fmt
(define-key go-mode-map (kbd "C-c f") 'gofmt)
(define-key go-mode-map (kbd "C-c C-f") 'gofmt)

;; go run
(define-key go-mode-map (kbd "C-c r") 'go-run)
(define-key go-mode-map (kbd "C-c C-r") 'go-run)

;; go vet
(eval-after-load "govet"
  '(progn
	 (define-key go-mode-map (kbd "C-c v") 'govet)
	 (define-key go-mode-map (kbd "C-c C-v") 'govet)))

;; imports
(define-key go-mode-map (kbd "C-c C-i g") 'go-goto-imports)
(define-key go-mode-map (kbd "C-c C-i C-g") 'go-goto-imports)
(define-key go-mode-map (kbd "C-c C-i a") 'go-import-add)
(define-key go-mode-map (kbd "C-c C-i C-a") 'go-import-add)
(define-key go-mode-map (kbd "C-c C-i u") 'go-remove-unused-imports)
(define-key go-mode-map (kbd "C-c C-i C-u") 'go-remove-unused-imports)

;; play 
(define-key go-mode-map (kbd "C-c C-p d") 'go-download-play)
(define-key go-mode-map (kbd "C-c C-p C-d") 'go-download-play)
(define-key go-mode-map (kbd "C-c C-p r") 'go-play-region)
(define-key go-mode-map (kbd "C-c C-p C-r") 'go-play-region)
(define-key go-mode-map (kbd "C-c C-p b") 'go-play-buffer)
(define-key go-mode-map (kbd "C-c C-p C-b") 'go-play-buffer)




