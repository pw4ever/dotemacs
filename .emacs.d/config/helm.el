(require 'helm)
(require 'helm-config)

;; https://tuhdo.github.io/helm-intro.html

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 helm-scroll-amount 8 ; scroll 4 lines other window using M-<next>/M-<prior>
 helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

 helm-split-window-default-side 'other ;; open helm buffer in another window
 helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
 helm-candidate-number-limit 200 ; limit the number of displayed canidates
 helm-M-x-requires-pattern 0     ; show all candidates when set to 0
 helm-boring-file-regexp-list
 '("\\.git$" "\\.hg$" "\\.svn$" "\\.CVS$" "\\._darcs$" "\\.la$" "\\.o$" "\\.i$") ; do not show these files in helm buffer
 helm-ff-file-name-history-use-recentf t
 helm-move-to-line-cycle-in-source t ; move to end or beginning of source
                                        ; when reaching top or bottom of source.
 ido-use-virtual-buffers t      ; Needed in helm-buffers-list
 helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non--nil
                                        ; useful in helm-mini that lists buffers
 )

;; https://github.com/thierryvolpiatto/emacs-tv-config/blob/master/init-helm-thierry.el#L96

(global-unset-key (kbd "M-x"))
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c <SPC>") 'helm-all-mark-rings)
(global-set-key (kbd "C-x r b")                      'helm-filtered-bookmarks)
(global-set-key (kbd "C-h r") 'helm-info-emacs)
(global-set-key (kbd "C-:") 'helm-eval-expression-with-eldoc)
(global-set-key (kbd "C-,") 'helm-calcul-expression)
(global-set-key (kbd "C-h d") 'helm-info-at-point)
(global-set-key (kbd "C-h i") 'helm-info)
(global-set-key (kbd "C-x C-d") 'helm-browse-project)
(global-set-key (kbd "<f1>") 'helm-resume)
(global-set-key (kbd "C-h C-f") 'helm-apropos)
(global-set-key (kbd "C-h a") 'helm-apropos)
(global-set-key (kbd "<f2>") 'helm-execute-kmacro)
(global-set-key (kbd "C-c i") 'helm-imenu-in-all-buffers)
(global-set-key (kbd "C-s") 'helm-occur)
(define-key global-map [remap jump-to-register]      'helm-register)
(define-key global-map [remap list-buffers] 'helm-mini)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(define-key global-map (kbd "M-g g") 'helm-grep-do-git-grep)
(define-key global-map (kbd "M-g i") 'helm-gid)
(define-key global-map (kbd "C-x r p") 'helm-projects-history)

;; use helm to list eshell history
(add-hook 'eshell-mode-hook
          #'(lambda ()
              (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

  ;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

(helm-autoresize-mode +1)
(helm-mode +1)





