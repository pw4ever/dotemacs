;;; https://github.com/syohex/emacs-helm-gtags
(require 'helm-gtags)

(define-global-minor-mode global-helm-gtags-mode
  helm-gtags-mode
  helm-gtags-mode)

;; customize
(custom-set-variables
 '(helm-gtags-path-style 'relative)
 '(helm-gtags-ignore-case t)
 '(helm-gtags-auto-update nil))

;; key bindings
(eval-after-load "helm-gtags"
  '(progn
	 (global-set-key (kbd "<f6>") 'global-helm-gtags-mode)
	 (define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
	 (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-previous-history)
	 (define-key helm-gtags-mode-map (kbd "C-M-,") 'helm-gtags-next-history)
     (define-key helm-gtags-mode-map (kbd "M-g M-t") 'helm-gtags-find-tag)
     (define-key helm-gtags-mode-map (kbd "M-g M-r") 'helm-gtags-find-rtag)
     (define-key helm-gtags-mode-map (kbd "M-g M-s") 'helm-gtags-find-symbol)
     (define-key helm-gtags-mode-map (kbd "M-g M-p") 'helm-gtags-parse-file)
     (define-key helm-gtags-mode-map (kbd "M-g M-u") 'helm-gtags-update-tags)
	 (define-key helm-gtags-mode-map (kbd "M-g [") 'helm-gtags-previous-history)
     (define-key helm-gtags-mode-map (kbd "M-g ]") 'helm-gtags-next-history)
	 (define-key helm-gtags-mode-map (kbd "M-/") 'helm-gtags-find-files)))
