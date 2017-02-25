;;
;; Load $HOME/theme.el, which should contain a single "load-theme" funcall, if it exists.
;; This allowes customization without touching the version-controlled config.
;;

;; color themes:
;; - adwaita
;; - solarized-light
;; - solarized-dark
;; - zenburn
;; - monokai
(let* ((default-theme 'monokai)
	   (home (getenv "HOME"))
	   (theme-file-name (and home
							 (concat (file-name-as-directory home)
									 "theme.el")))
	   (theme-file (and theme-file-name
						(file-exists-p theme-file-name)
						theme-file-name)))
  (if theme-file
	  (load-file theme-file)
	(load-theme default-theme t)))

;;; clear comint buffer
;; http://emacsredux.com/blog/2015/01/18/clear-comint-buffers/
(defun comint-clear-buffer ()
  (interactive)
  (let ((comint-buffer-maximum-size 0))
    (comint-truncate-buffer)))

;; in case other mode shadow one of the bindings
(define-key comint-mode-map "\C-c\M-o" #'comint-clear-buffer)
(define-key comint-mode-map "\C-co" #'comint-clear-buffer)
(define-key comint-mode-map "\C-cO" #'comint-clear-buffer)

;;; finding tag files

;; http://www.emacswiki.org/emacs/EmacsTags#toc4
(defun find-file-upwards (file-to-find)
  (cl-labels
      ((find-file-r (path)
                    (let* ((parent (file-name-directory path))
                           (possible-file (concat parent file-to-find)))
                      (cond
                       ((file-exists-p possible-file) possible-file) ; Found
                       ;; The parent of ~ is nil and the parent of / is itself.
                       ;; Thus the terminating condition for not finding the file
                       ;; accounts for both.
                       ((or (null parent) (equal parent (directory-file-name parent))) nil) ; Not found
                       (t (find-file-r (directory-file-name parent))))))) ; Continue
    (find-file-r default-directory)))

(let ((my-tags-file (find-file-upwards "TAGS")))
  (when my-tags-file
    (message "Loading tags file: %s" my-tags-file)
    (visit-tags-table my-tags-file)))

(setq-default c-default-style "linux"
			  tab-width 4
			  indent-tabs-mode t)

(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)
