(add-to-list 'load-path "~/.emacs.d/vendor/rhtml")

(autoload 'ruby-mode "ruby-mode" "Ruby Mode" t)
(setq interpreter-mode-alist (append '(("ruby" . ruby-mode)) interpreter-mode-alist))

; (autoload 'run-ruby "inf-ruby" "Run an inferior Ruby process")
; (autoload 'inf-ruby-keys "inf-ruby" "Set local key defs for inf-ruby in ruby-mode")
; (add-hook 'ruby-mode-hook '(lambda () (inf-ruby-keys)))

(add-to-list 'auto-mode-alist '("\\.(rb|rake)\\'" . ruby-mode))

(require 'rhtml-mode)

(provide 'my-ruby)
