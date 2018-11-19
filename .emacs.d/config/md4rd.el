;; https://github.com/ahungry/md4rd
(require 'md4rd)

(global-set-key (kbd "C-x w r") 'md4rd)

;;
;; to be further customized in ~/.emacs.d/local.d/md4rd.el
;;

(setq md4rd-subs-active
      '(lisp+Common_Lisp
        Clojure+Clojurescript
        linux+kernel
        emacs
        java+jvm
        windows+dotnet))

;;
;; re-defuns
;;

(defun md4rd-open ()
  (interactive)
  (save-excursion
    (forward-button 1)
    (condition-case-unless-debug nil
        (let ((md4rd--action-button-ctx 'open))
          (push-button))
      (error
       (condition-case-unless-debug nil
           (progn
             (widget-backward 1)
             (tree-mode-toggle-expand))
         (error
          (message "Cannot open next button.")))))))

(defun md4rd-visit ()
  (interactive)
  (save-excursion
    (forward-button 1)
    (condition-case-unless-debug nil
        (let ((md4rd--action-button-ctx 'visit))
          (push-button))
      (error
       (condition-case-unless-debug nil
           (progn
             (widget-backward 1)
             (tree-mode-toggle-expand))
         (error
          (message "Cannot visit next button.")))))))

(defun md4rd-widget-expand-all (&optional level)
  (interactive "p")
  (tree-mode-goto-root)
  (tree-mode-expand-level (or level 0)))

(defun md4rd-widget-collapse-all (&optional level)
  (interactive "p")
  (tree-mode-goto-root)
  (tree-mode-expand-level (or level 1)))

;;
;; Remap local keys (local-keymap, lower than minor-mode-keymaps).
;;
(defun my-set-md4rd-local-keymap ()
  ;; https://stackoverflow.com/a/21493693
  (let ((oldmap (current-local-map))
        (newmap (make-sparse-keymap)))
    (when oldmap
      (set-keymap-parent newmap oldmap))
    (define-key newmap (kbd "u") 'tree-mode-goto-parent)
    (define-key newmap (kbd "U") 'point-undo)
    (define-key newmap (kbd "o") 'md4rd-open)
    (define-key newmap (kbd "v") 'md4rd-visit)
    (define-key newmap (kbd "e") 'tree-mode-toggle-expand)
    (define-key newmap (kbd "E") 'md4rd-widget-expand-all)
    (define-key newmap (kbd "C") 'md4rd-widget-collapse-all)
    (define-key newmap (kbd "n") 'widget-forward)
    (define-key newmap (kbd "j") 'widget-forward)
    (define-key newmap (kbd "h") 'backward-button)
    (define-key newmap (kbd "p") 'widget-backward)
    (define-key newmap (kbd "k") 'widget-backward)
    (define-key newmap (kbd "l") 'forward-button)
    (use-local-map newmap)))

(add-hook 'md4rd-mode-hook 'my-set-md4rd-local-keymap)