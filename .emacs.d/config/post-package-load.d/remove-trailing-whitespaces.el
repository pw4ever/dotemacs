;; Appending, instead of prepending, the followings to prevent
;; them from interfering with other before-save hooks, e.g., gofmt-before-save.
(add-hook 'before-save-hook 'delete-trailing-lines t)
(add-hook 'before-save-hook 'delete-trailing-whitespace t)
