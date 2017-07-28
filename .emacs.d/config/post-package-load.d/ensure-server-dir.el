(defun ensure-server-dir ()
  "Ensure server-dir exists so that Emacs server can be started."
  (interactive)
  (let ((server-dir (if server-use-tcp
                        server-auth-dir
                      server-socket-dir)))
    (when (and server-dir
               (not (file-exists-p server-dir)))
      (make-directory server-dir))))

(ensure-server-dir)
