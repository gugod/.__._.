(use-package osx-dictionary)

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

(provide 'my-init-mac)
