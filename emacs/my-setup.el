(set-language-environment 'UTF-8)
(prefer-coding-system 'utf-8)
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'set-file-name-coding-system)
    (set-file-name-coding-system 'utf-8))

(if (fboundp 'window-system)
    (if (window-system)
	(progn
          (global-unset-key (kbd "C-z")))
      (progn
	(if (fboundp 'menu-bar-mode) (menu-bar-mode -1)))))

(setq backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      cursor-type 'box
      initial-scratch-message ""
      inhibit-startup-message t
      require-final-newline t)

(use-package rg
  :bind ("C-#" . rg-dwim))

(use-package ws-butler
  :init (ws-butler-global-mode t))

(use-package ace-jump-mode
  :bind ("C-c SPC" . ace-jump-mode))

(use-package yasnippet
  :init (yas-global-mode 1))

(use-package dumb-jump
  :init (dumb-jump-mode))

(use-package multiple-cursors
  :bind (("C-S-c C-S-c" . mc/edit-lines)
         ("C-S-c C-a" .   mc/edit-beginning-of-lines)
         ("C-S-c C-e" .   mc/edit-ends-of-lines)
         ("C-S-c M-\"" .  mc/mark-all-like-this)
         ))

(use-package    feebleline
  :ensure       t
  :config       (setq feebleline-msg-functions
                      '((feebleline-line-number         :post "" :fmt "%5s")
                        (feebleline-column-number       :pre ":" :fmt "%-2s")
                        (feebleline-file-directory      :face feebleline-dir-face :post "")
                        (feebleline-file-or-buffer-name :face font-lock-keyword-face :post "")
                        (feebleline-file-modified-star  :face font-lock-warning-face :post "")
                        (feebleline-git-branch          :face feebleline-git-face :pre " : ")
                        (feebleline-project-name        :align right)))
                (feebleline-mode 1))

(let ((d (concat (getenv "HOME") "/.emacs.d/extra")))
  (if (file-exists-p d)
      (progn
        (mapc 'load-file (directory-files d t ".el$" t)))))

(global-set-key (kbd "M-z") 'zap-up-to-char)

(setq-default mode-line-format nil)
(setq-default indent-tabs-mode nil)

(setq default-tab-width 8)
(setq mouse-yank-at-point t)
(setq inhibit-startup-message t)
(setq visible-bell t)

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
      mac-option-modifier 'meta
      mac-command-modifier 'hyper
      )

(setq-default indent-tabs-mode nil
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
      (set-face-background 'default "unspecified-bg" (selected-frame)))))

(add-hook 'window-setup-hook 'on-after-init)

(setq default-frame-alist
      '((ns-appearance . "dark")
        (ns-transparent-titlebar . t)
        (left-margin-width . 2)
        (right-margin-width . 2)))

(defun upcase-prev-word ()
    (interactive)
    (upcase-word -1))

(global-set-key (kbd "M-U") 'upcase-prev-word)

(provide 'my-setup)
