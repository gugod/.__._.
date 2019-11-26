
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
        (mapc 'load-file (directory-files d t ".el$" t))
        )))
