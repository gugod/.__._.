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
         ))

(use-package    feebleline
  :ensure       t
  :config       (setq feebleline-msg-functions
                      '((feebleline-line-number         :post "" :fmt "%5s")
                        (feebleline-column-number       :pre ":" :fmt "%-2s")
                        (feebleline-project-name        :align right)))
                (feebleline-mode 1))

(let ((d (concat (getenv "HOME") "/.emacs.d/extra")))
  (if (file-exists-p d)
      (progn
        (mapc 'load-file (directory-files d t ".el$" t)))))

(global-set-key (kbd "M-z") 'zap-up-to-char)
(global-unset-key (kbd "C-z"))
