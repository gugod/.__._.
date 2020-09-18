;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(defconst IS-MAC (eq system-type 'darwin))

(if IS-MAC
    (progn
      (setq initial-frame-alist '((ns-appearance . "dark") (ns-transparent-titlebar . t))
            mac-option-modifier 'meta
            mac-command-modifier 'hyper)
      (add-to-list 'exec-path "/usr/local/bin")
      (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))))

(let ((d (concat (getenv "HOME") "/.emacs.d/extra")))
  (if (file-exists-p d)
      (progn
        (mapc 'load-file (directory-files d t ".el$" t)))))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (if (file-readable-p default-directory)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'use-package)

(setq use-package-always-ensure t)

(use-package raku-mode)
(use-package rust-mode)
(use-package ivy)
(use-package try)
(use-package vterm)
(use-package flycheck)
(use-package org-roam)
(use-package erc)

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

(use-package dumb-jump
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
  :bind (("C-x g" . magit-status)))

(use-package expand-region
  :bind ("C-c C-SPC" . er/expand-region))

(use-package find-file-in-project
  :config (setq ffip-use-rust-fd t)
  :bind ("C-c f" . ffip))

(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package elfeed
  :bind ((:map elfeed-show-mode-map
               ("E" . my/elfeed-enqueue-link-to-mpv-playlist))
         (:map elfeed-search-mode-map
               ("w" . elfeed-show-yank)
               ("E" . my/elfeed-enqueue-link-to-mpv-playlist)
               ("H-k" . my/elfeed-mark-all-as-read)))
  :custom ((elfeed-search-filter "@1-day +unread")
	   (elfeed-db-directory "~/.emacs.d/elfeed")))

(use-package elfeed-org
  :config (elfeed-org))

(use-package elfeed-score
  :config (progn
            (elfeed-score-enable)
            (define-key elfeed-search-mode-map "=" elfeed-score-map)))

(use-package emms
  :config (progn
            (require 'emms-setup)
            (emms-all)
            (emms-default-players)))

(if IS-MAC
    (use-package osx-dictionary))

(require 'uniquify)

(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(set-file-name-coding-system 'utf-8)
(show-paren-mode t)
(auto-image-file-mode)
(fset 'yes-or-no-p 'y-or-n-p)

(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      browse-url-browser-function 'browse-url-default-macosx-browser
      uniquify-buffer-name-style 'forward
      cursor-type 'box
      default-tab-width 8
      delete-by-moving-to-trash IS-MAC
      font-lock-maximum-decoration t
      frame-resize-pixelwise t
      frame-title-format "%b"
      inhibit-startup-message t
      initial-scratch-message ""
      mouse-yank-at-point t
      scroll-conservatively 10000
      scroll-margin 2
      shr-use-fonts nil
      shr-use-colors nil)

(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "H-{") 'previous-buffer)
(global-set-key (kbd "H-}") 'next-buffer)

(require 'my-init-gpg)
(require 'my-init-mail)
(require 'my-init-display)

(require 'my-cperl)
(require 'my-org)
(require 'my-fun)

;; Append website title to eww buffer.
(when (fboundp 'eww)
  (add-hook 'eww-after-render-hook
            (lambda ()
              (when (eq major-mode 'eww-mode )
                (let ((title (plist-get eww-data :title)))
                  (if title
                      (rename-buffer (concat "[eww] " title) t)
                    (rename-buffer "eww" t)))))))

;; (add-hook 'prog-mode-hook (lambda () (setq mode-line-format nil)))

;; put custom-file in
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'my-init)
