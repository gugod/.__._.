(require 'multiple-cursors)

(global-set-key (kbd "M-\"") 'mc/mark-all-like-this)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-c C-e") 'mc/edit-ends-of-lines)
(global-set-key (kbd "C-S-c C-a") 'mc/edit-beginnings-of-lines)

(provide 'my-multiple-cursors)
