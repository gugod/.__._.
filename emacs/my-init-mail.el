;; mail
(setq message-send-mail-function 'message-send-mail-with-sendmail)
(if (file-executable-p "/usr/local/bin/msmtp")
    (setq sendmail-program "/usr/local/bin/msmtp")
  (if (file-executable-p "/usr/bin/msmtp")
      (setq sendmail-program "/usr/bin/msmtp")))

(if (file-exists-p "/usr/local/share/emacs/site-lisp/mu/mu4e/")
    (require 'my-mu4e))

(provide 'my-init-mail)
