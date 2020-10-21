(use-package ns-auto-titlebar
  :config (ns-auto-titlebar-mode))

(setq delete-by-moving-to-trash t
      mac-option-modifier 'meta
      mac-command-modifier 'hyper)

(add-to-list 'auth-sources 'macos-keychain-internet t)
(add-to-list 'auth-sources 'macos-keychain-generic t)

(if (display-graphic-p)
    (progn
      (server-start)
      (global-unset-key (kbd "C-z"))
      (global-unset-key (kbd "C-x C-z"))))

(use-package osx-dictionary)

(menu-bar-mode 1)

(provide 'my-init-mac)
