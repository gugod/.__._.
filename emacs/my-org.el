(define-prefix-command 'my-org-keymap)

(define-key my-org-keymap (kbd "f") (lambda () (interactive) (find-file org-default-notes-file)))
(define-key my-org-keymap (kbd "a") 'org-agenda)
(define-key my-org-keymap (kbd "c") 'org-capture)

(global-set-key (kbd "C-c o") 'my-org-keymap)

(require 'org-timer)
(add-to-list 'org-modules 'org-timer)
(setq org-timer-default-timer 25)
(add-hook 'org-clock-in-hook '(lambda () 
                                (if (not org-timer-current-timer) 
                                    (org-timer-set-timer '(16)))))

(add-hook
 'org-timer-done-hook
 '(lambda ()
    (shell-command "/usr/bin/afplay ~/Music/Hamon.aif")
    (org-clock-out)))

(add-hook 'org-present-mode-hook
          (lambda ()
            (hidden-mode-line-mode)
            (org-display-inline-images)))

(add-hook 'org-present-mode-quit-hook
          (lambda ()
            (org-present-small)
            (org-remove-inline-images)))

(provide 'my-org)
