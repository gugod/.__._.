
;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq use-package-always-ensure t)
(setq use-package-always-defer t)
(require 'use-package)

(defconst IS-MAC (eq system-type 'darwin))

(if IS-MAC
    (progn
      (setq initial-frame-alist '((ns-appearance . "dark") (ns-transparent-titlebar . t))
            mac-option-modifier 'meta
            mac-command-modifier 'hyper)
      (add-to-list 'exec-path "/usr/local/bin")
      (setenv "PATH" (concat "/usr/local/bin" ":" (getenv "PATH")))
      ))

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

(use-package mood-line
      :ensure t
      :hook (after-init . mood-line-mode))

(use-package expand-region
  :bind ("C-c C-SPC" . er/expand-region))

(use-package ack)

(use-package find-file-in-project
  :config (setq ffip-use-rust-fd t)
  :bind ("C-c f" . ffip))

(use-package try)

(use-package nov
  :config
  (add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode)))

(use-package elfeed
  :custom ((elfeed-search-filter "@1-day +unread")
	   (elfeed-db-directory "~/.emacs.d/elfeed")))

(use-package elfeed-org)

(use-package elfeed-score
  :config (progn
            (elfeed-score-enable)
            (define-key elfeed-search-mode-map "=" elfeed-score-map)))

(elfeed-org)

(use-package emms)

(use-package feebleline)

(use-package markdown-mode
  :defer t)

(use-package raku-mode
  :defer t)

(use-package rust-mode
  :defer t)

(use-package emms
  :config (progn
            (require 'emms-setup)
            (emms-all)
            (emms-default-players)
            ))

(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'set-file-name-coding-system)
    (set-file-name-coding-system 'utf-8))

(setq auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      backup-directory-alist `((".*" . ,temporary-file-directory))
      browse-url-browser-function 'browse-url-default-macosx-browser
      cursor-type 'box
      default-tab-width 8
      delete-by-moving-to-trash IS-MAC
      font-lock-maximum-decoration t
      frame-title-format "%b"
      inhibit-startup-message t
      initial-scratch-message ""
      mouse-yank-at-point t
      scroll-conservatively 10000
      scroll-margin 3
      shr-use-fonts nil
      shr-use-colors nil)

(setq-default indent-tabs-mode nil)

(global-set-key (kbd "M-z") 'zap-up-to-char)

(show-paren-mode t)
(auto-image-file-mode)
(fset 'yes-or-no-p 'y-or-n-p)

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

;; mail
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(if (file-executable-p "/usr/local/bin/msmtp")
    (setq sendmail-program "/usr/local/bin/msmtp")
  (if (file-executable-p "/usr/bin/msmtp")
      (setq sendmail-program "/usr/bin/msmtp")))

;; gpg
;; Note: set epg-gpg-program
(setq auth-sources '("~/.authinfo.gpg"))
(if IS-MAC
    (progn
      (add-to-list 'auth-sources 'macos-keychain-internet t)
      (add-to-list 'auth-sources 'macos-keychain-generic t)))

(require 'epa-file)
(epa-file-enable)

(require 'my-cperl)
(require 'my-org)
(require 'my-fun)

(if (file-exists-p "/usr/local/share/emacs/site-lisp/mu/mu4e/")
    (require 'my-mu4e))

;; put custom-file in
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

(when (and (eq system-type 'darwin) (display-graphic-p))
  (set-fontset-font t 'kana (font-spec :name "MotoyaLMaru"))
  (set-fontset-font t 'han (font-spec :family "jf-openhuninn-1.1"))
  (set-fontset-font t 'bopomofo (font-spec :family "jf-openhuninn-1.1"))
  (set-fontset-font t 'cjk-misc (font-spec :family "jf-openhuninn-1.1"))
  (set-fontset-font t 'symbol (font-spec :name "Symbola") nil 'append)
  (set-face-attribute 'default nil :height 240 :family "DM Mono"))

(when (fboundp 'eww)
  (add-hook 'eww-after-render-hook
            (lambda ()
              (when (eq major-mode 'eww-mode )
                (let ((title (plist-get eww-data :title)))
                  (if title
                      (rename-buffer (concat "[eww] " title) t)
                    (rename-buffer "eww" t)))))))

(setq face-font-rescale-alist
      '(("jf-openhuninn-1.1" . 1.2)
        ("-cdac$" . 1.3)))

;; Disable Theme BG color in terminal
;; https://stackoverflow.com/questions/19054228/emacs-disable-theme-background-color-in-terminal
(defun my/set-background-for-terminal (&optional frame)
  (or frame (setq frame (selected-frame)))
  "unsets the background color in terminal mode"
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))
(add-hook 'after-make-frame-functions 'my/set-background-for-terminal)
(add-hook 'window-setup-hook 'my/set-background-for-terminal)

(add-hook 'prog-mode-hook (lambda () (setq mode-line-format nil)))

(provide 'my-init)
