(add-to-list 'load-path "~/.emacs.d/vendor/coffee-mode")
(require 'coffee-mode)
(add-to-list 'auto-mode-alist '("\\.coffee$" . coffee-mode))
(add-to-list 'auto-mode-alist '("Cakefile" . coffee-mode))

(defun my-coffee-settings ()
  "coffee-mode-hook"
  (set (make-local-variable 'tab-width) 4)
  (setq coffee-tab-width 4)
  (coffee-cos-mode))

(add-hook 'coffee-mode-hook 'my-coffee-settings)

(provide 'my-coffee)
