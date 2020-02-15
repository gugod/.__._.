(defconst IS-MAC     (eq system-type 'darwin))

(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'set-file-name-coding-system)
    (set-file-name-coding-system 'utf-8))

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      cursor-type 'box
      initial-scratch-message ""
      inhibit-startup-message t
      require-final-newline t
      delete-by-moving-to-trash IS-MAC)

(use-package rg
  :bind ("C-#" . rg-dwim))

(use-package ws-butler
  :config (ws-butler-global-mode t))

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package yasnippet
  :config (yas-global-mode 1))

(use-package dumb-jump
  :config (dumb-jump-mode))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-S-c C-a" .   mc/edit-beginning-of-lines)
         ("C-S-c C-e" .   mc/edit-ends-of-lines)
         ("C-S-c M-\"" .  mc/mark-all-like-this)
         ))

(use-package major-mode-icons
  :ensure t
  :config
  (major-mode-icons-mode 1))

(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

(let ((d (concat (getenv "HOME") "/.emacs.d/extra")))
  (if (file-exists-p d)
      (progn
        (mapc 'load-file (directory-files d t ".el$" t)))))

(global-set-key (kbd "M-z") 'zap-up-to-char)

(setq-default indent-tabs-mode nil
              ;;; mode-line-format nil
              scroll-margin 3
              default-tab-width 8
              scroll-conservatively 10000
              inhibit-startup-message t
              mouse-yank-at-point t
              show-paren-style 'parentheses
              frame-title-format "%b"
              initial-frame-alist '((ns-appearance . "dark") (ns-transparent-titlebar . t))
              browse-url-browser-function 'browse-url-default-macosx-browser
              mac-option-modifier 'meta
              mac-command-modifier 'hyper
              font-lock-maximum-decoration t)

(show-paren-mode t)
(setq frame-title-format "%b")
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
      (set-face-background 'default "unspecified-bg" (selected-frame))
      (if (fboundp 'window-system)
          (if (window-system)
              (progn
                (global-unset-key (kbd "C-z")))
            (progn
              (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))))
      )))
(add-hook 'window-setup-hook 'on-after-init)

(defun upcase-prev-word ()
    (interactive)
    (upcase-word -1))

(global-set-key (kbd "M-U") 'upcase-prev-word)

(let ((d (concat (getenv "HOME") "/Projects/gugod/bin")))
  (if (file-exists-p d)
      (progn
        (add-to-list 'exec-path d)
        (setenv "PATH" (concat (getenv "PATH") ":" d))
        )))

(provide 'my-setup)
