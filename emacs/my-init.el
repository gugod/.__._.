;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(if (file-directory-p "/usr/local/bin")
    (progn
      (if (not (member "/usr/local/bin" exec-path))
          (add-to-list 'exec-path "/usr/local/bin"))
      (if (not (string-match "/usr/local/bin" (getenv "PATH")))
          (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH"))))))


(use-package twittering-mode)
(use-package kotlin-mode)
(use-package elm-mode)

(use-package raku-mode
  :bind ("C-c C-;" . my/insert-semicolon-at-the-end))

(use-package rust-mode)

(use-package flycheck
  :hook (prog-mode . flycheck-mode))
;; (use-package flycheck-raku)

(use-package ivy)
(use-package try)

(use-package vterm)
(use-package vterm-toggle
  :bind
  ("H-'" . 'vterm-toggle)
  ("H-0" . 'vterm-toggle)
  :custom (vterm-toogle-fullscreen-p t))

(use-package erc)
(use-package markdown-mode
  :config (add-hook 'markdown-mode-hook 'my/markdown-hook))

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
  :config (add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
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
  :bind ("C-=" . er/expand-region))

(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package elfeed
  :config
  (elfeed-set-max-connections 16)
  (elfeed-set-timeout 15)
  :bind ((:map elfeed-show-mode-map
               ("E" . my/elfeed-enqueue-link-to-mpv-playlist))
         (:map elfeed-search-mode-map
               ("w" . elfeed-show-yank)
               ("E" . my/elfeed-enqueue-link-to-mpv-playlist)
               ("H-k" . my/elfeed-mark-all-as-read)))
  :custom ((elfeed-search-filter "+unread @3-days")
	   (elfeed-db-directory "~/.emacs.d/elfeed")))

(use-package elfeed-score
  :config
  (elfeed-score-enable)
  (define-key elfeed-search-mode-map "=" elfeed-score-map))

(use-package fzf
  :bind ("C-c f" . my/fzf-current-project))

;;; Setup packages that are not loadable via use-package
(let ((d (concat (getenv "HOME") "/.emacs.d/extra")))
  (if (file-exists-p d)
      (progn
        (mapc 'load-file (directory-files d t ".el$" t)))))

(let ((default-directory "/usr/local/share/emacs/site-lisp/"))
  (if (file-readable-p default-directory)
      (normal-top-level-add-subdirs-to-load-path)))

(require 'uniquify)

(setenv "XAPIAN_CJK_NGRAM" "1")
(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)
(fset 'yes-or-no-p 'y-or-n-p)
(tool-bar-mode 0)
(tooltip-mode  0)
(blink-cursor-mode 0)
(if (fboundp 'scroll-bar-mode)
    (scroll-bar-mode 0))
(show-paren-mode t)
(auto-image-file-mode)

(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      pop-up-window nil
      uniquify-buffer-name-style 'forward
      cursor-type 'box
      default-tab-width 8
      font-lock-maximum-decoration t
      frame-resize-pixelwise t
      inhibit-startup-message t
      initial-scratch-message ""
      mouse-yank-at-point t
      scroll-conservatively 10000
      scroll-margin 2
      completion-ignore-case t
      read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      shr-use-fonts nil
      shr-use-colors nil)

(setq-default indent-tabs-mode nil)

(require 'my-init-gpg)
(require 'my-init-mail)
(require 'my-init-display)

(require 'my-cperl)
(require 'my-org)
(require 'my-fun)

;; Append website title to eww buffer.
(when (fboundp 'eww)
  (add-hook 'eww-mode-hook
            (lambda () (visual-line-mode)))
  (add-hook 'eww-after-render-hook
            (lambda ()
              (when (eq major-mode 'eww-mode )
                (let ((title (plist-get eww-data :title)))
                  (if title
                      (rename-buffer (concat "[eww] " title) t)
                    (rename-buffer "eww" t)))))))

(if (eq system-type 'darwin)
    (require 'my-init-mac))

(electric-pair-mode)

;; Global keybindings
(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-set-key (kbd "H-{") 'previous-buffer)
(global-set-key (kbd "H-}") 'next-buffer)
(global-set-key (kbd "C-c \"") 'my/quote-current-word)

(if (fboundp 'mu4e)
    (global-set-key (kbd "C-x m") 'mu4e)
  (global-set-key (kbd "C-x m") 'gnus))

(global-set-key (kbd "C-M-H-5") 'my/switch-to-other-buffer)
(global-set-key (kbd "C-M-H-1") 'delete-other-windows)
(global-set-key (kbd "C-M-H-2") 'other-window)

;; put custom-file in
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(provide 'my-init)
