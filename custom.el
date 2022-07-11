(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "<f9>") (lambda() (interactive)(find-file (concat doom-private-dir "custom.el"))))

;; Load any .el files inside extra directory
(setq extra-config-directory (expand-file-name (concat doom-private-dir "extra")))
(if (file-directory-p extra-config-directory)
    (mapc 'load (directory-files extra-config-directory t "\\.el$")))