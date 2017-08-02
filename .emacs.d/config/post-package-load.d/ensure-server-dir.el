(require 'server)

(setq server-dir (if server-use-tcp
                     server-auth-dir
                   server-socket-dir))

(defun ensure-server-dir ()
  "Ensure server-dir exists so that Emacs server can be started."
  (interactive)
  (when (and server-dir
             (not (file-exists-p server-dir)))
    (make-directory server-dir)))

(when (eq system-type 'windows-nt)
  (defun server-ensure-safe-dir (dir)
    "Override original definition to circumvent Emacs on Windows bug."
    t)
  (ensure-server-dir))
