;; https://github.com/skeeto/elfeed
(require 'elfeed)

(setq elfeed-feeds nil)
(setq-default elfeed-search-filter "@2-week-ago +unread")

(global-set-key (kbd "C-x w f") 'elfeed)

(setq elfeed-feeds
      '(("http://brendangregg.com/blog/rss.xml" perf system personal)
        ("http://nullprogram.com/feed/" emacs elfeed programming personal)
        ("http://lambda-the-ultimate.org/rss.xml" programming theory syndicate)
        ("http://planet.emacsen.org/atom.xml" emacs syndicate)
        ("https://lwn.net/headlines/rss" linux)
        ("https://lwn.net/headlines/Features" linux)))

;;
;; Further customization in ~/.emacs.d/local.d/elfeed.el
;;
;; (append-to-list 'elfeed-feeds
;;                 '(("http://brendangregg.com/blog/rss.xml" perf system personal)
;;                   ("https://sourceware.org/git/gitweb.cgi?p=systemtap.git;a=rss" perf systemtap)
;;                   ("http://nullprogram.com/feed/" programming personal)
;;                   ("https://www.reddit.com/r/kernel/.rss" linux kernel)))