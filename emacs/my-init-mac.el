(use-package ns-auto-titlebar
  :config (ns-auto-titlebar-mode))

(setq delete-by-moving-to-trash t
      mac-option-modifier 'meta
      mac-command-modifier 'hyper)

(add-to-list 'auth-sources 'macos-keychain-internet t)
(add-to-list 'auth-sources 'macos-keychain-generic t)

(use-package osx-dictionary)

(provide 'my-init-mac)