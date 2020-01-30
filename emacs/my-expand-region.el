(add-to-list 'load-path (expand-file-name "~/.emacs.d/vendor/expand-region.el"))

(require 'expand-region)
(if (and (fboundp 'window-system) (window-system))
    (global-set-key (kbd "C-@") 'er/expand-region)
  (global-set-key (kbd "C-c r") 'er/expand-region))

(provide 'my-expand-region)
