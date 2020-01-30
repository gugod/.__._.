(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))


(defun my-js2-mode-hook()
  ; (smart-tabs-mode-enable)
  ; (smart-tabs-advice js2-indent-line js2-basic-offset)
  ; (set-variable 'indent-tabs-mode t t)
  ; (set-variable 'tab-width 4 t)
  )

(add-hook 'js2-mode-hook 'my-js2-mode-hook)

(provide 'my-js)

