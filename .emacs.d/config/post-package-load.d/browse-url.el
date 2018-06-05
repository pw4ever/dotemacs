(eval-after-load "browse-url"
  (setq browse-url-generic-program
        (let ((progs (pcase system-type
                       ('windows-nt '("chrome"
                                      "firefox"))
                       (_ '("google-chrome-stable"
                            "chromium"
                            "firefox")))))
          (dolist (prog progs)
            (when (executable-find prog)
              (return prog))))))
