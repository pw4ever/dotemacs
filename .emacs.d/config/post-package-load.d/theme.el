(setq custom-safe-themes t)             ; consider all themes as safe

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
