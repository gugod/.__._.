;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(require 'use-package)

(defconst IS-MAC (eq system-type 'darwin))

(if IS-MAC
    (setq initial-frame-alist '((ns-appearance . "dark") (ns-transparent-titlebar . t))
          mac-option-modifier 'meta
          mac-command-modifier 'hyper))

(let ((d (concat (getenv "HOME") "/.emacs.d/extra")))
  (if (file-exists-p d)
      (progn
        (mapc 'load-file (directory-files d t ".el$" t)))))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (if (file-readable-p default-directory)
      (normal-top-level-add-subdirs-to-load-path)))

(use-package rg
  :bind ("C-#" . rg-dwim))

(use-package ws-butler
  :config (ws-butler-global-mode t))

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package yasnippet
  :diminish yas-minor-mode
  :hook (after-init . yas-global-mode)
  :config (use-package yasnippet-snippets))

(use-package ivy)

(use-package dumb-jump
  :after (ivy)
  :config (dumb-jump-mode)
  :bind (("C-M-g" . dumb-jump-go))
  :custom (dumb-jump-selector 'ivy))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-S-c C-a" .   mc/edit-beginning-of-lines)
         ("C-S-c C-e" .   mc/edit-ends-of-lines)
         ("C-S-c M-\"" .  mc/mark-all-like-this)))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package multiple-cursors
  :bind (("M-\"" . mc/mark-all-like-this)
         ("C-S-c C-S-c" . mc/edit-lines)
         ("C-S-c C-e" . mc/edit-ends-of-lines)
         ("C-S-c C-a" . mc/edit-beginnings-of-lines)))

(use-package magit
  :bind (("C-c C-g" . magit-status)))

(use-package doom-modeline
      :ensure t
      :hook (after-init . doom-modeline-mode))

(use-package markdown-mode)
(use-package ack)

(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'set-file-name-coding-system)
    (set-file-name-coding-system 'utf-8))

(setq
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      browse-url-browser-function 'browse-url-default-macosx-browser
      cursor-type 'box
      default-tab-width 8
      delete-by-moving-to-trash IS-MAC
      font-lock-maximum-decoration t
      frame-title-format "%b"
      indent-tabs-mode nil
      inhibit-startup-message t
      initial-scratch-message ""
      mouse-yank-at-point t
      require-final-newline t
      scroll-conservatively 10000
      scroll-margin 3
      show-paren-style 'parentheses
      shr-use-colors nil
      )

(global-set-key (kbd "M-z") 'zap-up-to-char)

(show-paren-mode t)
(setq frame-title-format "%b")
(auto-image-file-mode)

;; (put 'set-goal-column 'disabled nil)
;; (put 'narrow-to-region 'disabled nil)
;; (put 'upcase-region 'disabled nil)
;; (put 'downcase-region 'disabled nil)
;; (put 'LaTeX-hide-environment 'disabled nil)
;; (fset 'yes-or-no-p 'y-or-n-p)

;; (global-font-lock-mode nil)

;; (global-set-key (kbd "s-{") 'previous-buffer)
;; (global-set-key (kbd "s-}") 'next-buffer)

;; (defun on-after-init ()
;;   (unless (display-graphic-p (selected-frame))
;;     (progn
;;       (set-face-foreground 'default "unspecified-fg" (selected-frame))
;;       (set-face-background 'default "unspecified-bg" (selected-frame))
;;       (if (fboundp 'window-system)
;;           (if (window-system)
;;               (progn
;;                 (global-unset-key (kbd "C-z")))
;;             (progn
;;               (if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))))
;;       )))
;; (add-hook 'window-setup-hook 'on-after-init)

(setq auth-sources '("~/.authinfo.gpg"))
(if IS-MAC
    (progn
      (add-to-list 'auth-sources 'macos-keychain-internet t)
      (add-to-list 'auth-sources 'macos-keychain-generic t)))

(require 'epa-file)
(epa-file-enable)

(require 'my-cperl)
(require 'my-org)
(require 'my-mu4e)

(provide 'my-init)
