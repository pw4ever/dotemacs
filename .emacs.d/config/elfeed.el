;; https://github.com/skeeto/elfeed
(require 'elfeed)

(setq elfeed-feeds nil)
(setq-default elfeed-search-filter "@2-week-ago +unread")

(global-set-key (kbd "C-x w f") 'elfeed)

;;
;; Setting up further feeds. Recommended: ~/.emacs.d/local.d/elfeed.el
;;
;; (append-to-list 'elfeed-feeds
;;                 '(("http://brendangregg.com/blog/rss.xml" perf system personal)
;;                   ("https://sourceware.org/git/gitweb.cgi?p=systemtap.git;a=rss" perf systemtap)
;;                   ("http://nullprogram.com/feed/" programming personal)
;;                   ("https://www.reddit.com/r/kernel/.rss" linux kernel)))