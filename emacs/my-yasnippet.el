; yasnippet
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/yasnippet"))

(require 'yasnippet)
(yas-global-mode 1)

;(setq yas/next-field-key "C-=")
;(setq yas/next-trigger-key "C-=")

;; (setq yas-snippet-dirs (quote ("~/.emacs.d/my-lisp/snippets")))

; (set-variable 'yas/prompt-functions (quote (yas/dropdown-prompt yas/ido-prompt yas/dropdown-prompt yas/x-prompt yas/completing-prompt yas/no-prompt)))

(provide 'my-yasnippet)
