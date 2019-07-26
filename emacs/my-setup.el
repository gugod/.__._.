(setq-default indent-tabs-mode nil)
(setq default-tab-width 8)
(setq mouse-yank-at-point t)
(setq inhibit-startup-message t)
(setq visible-bell t)
(setq scroll-margin 3
      scroll-conservatively 10000)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq frame-title-format "%b")
(auto-image-file-mode)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'LaTeX-hide-environment 'disabled nil)

(fset 'yes-or-no-p 'y-or-n-p)

(global-font-lock-mode nil)
(setq-default font-lock-maximum-decoration t)

(global-set-key (kbd "s-{") 'previous-buffer)
(global-set-key (kbd "s-}") 'next-buffer)
