;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load-theme 'doom-city-lights t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(global-set-key (kbd "<f9>") (lambda() (interactive)(find-file (concat doom-private-dir "config.el"))))

(setq company-idle-delay 0)

;; Load any .el files inside extra directory
(setq extra-config-directory (expand-file-name (concat doom-private-dir "extra")))
(if (file-directory-p extra-config-directory)
    (mapc 'load (directory-files extra-config-directory t "\\.el$")))

;; Custom functions
(defun open-file-in-clipboard ()
  "Open current clipboard content if it's a valid file path."
  (interactive)
  (let* ((clipboard-content (w32-get-clipboard-data))
         (clipboard-content-clean (if clipboard-content
                                      (replace-regexp-in-string
                                       "['\"]+$\\|^['\"]+"
                                       ""
                                       clipboard-content))))
    (if (and clipboard-content-clean (file-exists-p clipboard-content-clean))
        (progn (message "Opening file: %s" clipboard-content-clean)
               (find-file clipboard-content-clean))
      (message "Invalid file: %s" clipboard-content-clean))))

;; Keybindings
(map! :leader
      (:prefix ("z" . "custom")
       :desc "Open file in clipboard" "o" #'open-file-in-clipboard))
