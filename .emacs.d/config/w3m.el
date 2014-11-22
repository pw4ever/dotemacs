(require 'w3m)

;; http://www.emacswiki.org/emacs/emacs-w3m
(setq browse-url-browser-function 'w3m-browse-url)
(autoload 'w3m-browse-url "w3m" "Ask a WWW browser to show a URL." t)
;; optional keyboard short-cut
(global-set-key "\C-xm" 'browse-url-at-point)

;; https://github.com/haskell/haskell-mode/wiki/Browsing-Haddocks
(setq w3m-mode-map (make-sparse-keymap))

(define-key w3m-mode-map (kbd "RET") 'w3m-view-this-url)
(define-key w3m-mode-map (kbd "q") 'bury-buffer)
(define-key w3m-mode-map (kbd "<mouse-1>") 'w3m-maybe-url)
(define-key w3m-mode-map [f5] 'w3m-reload-this-page)
(define-key w3m-mode-map (kbd "M-<left>") 'w3m-view-previous-page)
(define-key w3m-mode-map (kbd "M-<right>") 'w3m-view-next-page)

(defun w3m-maybe-url ()
  (interactive)
  (if (or (equal '(w3m-anchor) (get-text-property (point) 'face))
	 (equal '(w3m-arrived-anchor) (get-text-property (point) 'face)))
      (w3m-view-this-url)))
