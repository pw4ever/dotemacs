;; https://github.com/Andersbakken/rtags

;; WARNING: Make sure rdm/rc are compatible with the rtags.el etc
;; RECOMMENDATION: Clone and build rtags on the target system.
;;
;; Tip: Clone, build, and install rtags into "HOME/usr".
;; git clone --recursive https://github.com/Andersbakken/rtags.git; cd rtags; mkdir build; cd build; cmake -DCMAKE_INSTALL_PREFIX=$HOME/usr ..; make -j$(nproc) all install

(require 'rtags)
;(require 'gtags)
;(require 'ggtags)

(add-hook 'c-mode-hook 'rtags-start-process-unless-running)
(add-hook 'c++-mode-hook 'rtags-start-process-unless-running)

(rtags-enable-standard-keybindings)

;; (setq rtags-rdm-include "") ; Additional include paths.
(setq rtags-process-flags "--error-limit 0 --no-Wall --no-spell-checking")

;;
;; For debug
;;
;; (setq rtags-process-flags "--error-limit 0 --no-Wall --no-spell-checking --log-file /tmp/rdm.log --log-file-log-level verbose-debug") ; for debug
;; (setq rtags-rc-log-enabled t) ; for debug

;; https://github.com/Andersbakken/rtags#fall-back-to-other-taggers

(defun use-rtags (&optional useFileManager)
  (and (rtags-executable-find "rc")
       (cond ((not (gtags-get-rootpath)) t)
             ((and (not (eq major-mode 'c++-mode))
                   (not (eq major-mode 'c-mode))) (rtags-has-filemanager))
             (useFileManager (rtags-has-filemanager))
             (t (rtags-is-indexed)))))

(defun tags-find-symbol-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-symbol-at-point prefix)) rtags-last-request-not-indexed)
      (gtags-find-tag)))
(defun tags-find-references-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-references-at-point prefix)) rtags-last-request-not-indexed)
      (gtags-find-rtag)))
(defun tags-find-symbol ()
  (interactive)
  (call-interactively (if (use-rtags) 'rtags-find-symbol 'gtags-find-symbol)))
(defun tags-find-references ()
  (interactive)
  (call-interactively (if (use-rtags) 'rtags-find-references 'gtags-find-rtag)))
(defun tags-find-file ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-find-file 'gtags-find-file)))
(defun tags-imenu ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-imenu 'idomenu)))

(define-key c-mode-base-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function tags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-;") (function tags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function tags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function tags-find-references))
;;(define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key c-mode-base-map (kbd "M-i") (function tags-imenu))

(defun tags-history-prev ()
  (interactive)
  (if (use-rtags)
      (rtags-location-stack-back)
    (ggtags-prev-mark)))

(defun tags-history-next ()
  (interactive)
  (if (use-rtags)
      (rtags-location-stack-forward)
    (ggtags-next-mark)))

(define-key c-mode-base-map (kbd "C-<") (function tags-history-prev))
(define-key c-mode-base-map (kbd "C->") (function tags-history-next))

;; Promote rtags keybinding globally.
(rtags-enable-standard-keybindings global-map "C-c r")
