(setq scroll-margin 3
      default-tab-width 8
      scroll-conservatively 10000
      visible-bell t
      inhibit-startup-message t
      mouse-yank-at-point t
      show-paren-style 'parentheses
      frame-title-format "%b"
      initial-frame-alist '((ns-appearance . "dark") (ns-transparent-titlebar . t))
      left-margin-width 2
      right-margin-width 2
      browse-url-browser-function 'browse-url-default-macosx-browser
      ;; version-control t
      ;; kept-new-versions 3
      ;; delete-old-versions t
      ;; kept-old-versions 2
      ;; dired-kept-versions 1
      )

(setq-default indent-tabs-mode nil
              font-lock-maximum-decoration t)

(show-paren-mode t)
(auto-image-file-mode)

(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)
(fset 'yes-or-no-p 'y-or-n-p)
(global-font-lock-mode nil)

(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)

(defun on-after-init ()
  (unless (display-graphic-p (selected-frame))
    (progn
      (set-face-foreground 'default "unspecified-fg" (selected-frame))
      (set-face-background 'default "unspecified-bg" (selected-frame)))))

(add-hook 'window-setup-hook 'on-after-init)

(defun upcase-prev-word ()
    (interactive)
    (upcase-word -1))

(global-set-key (kbd "M-U") 'upcase-prev-word)

(provide 'my-setup)
