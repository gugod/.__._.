;; gpg
;; Note: set epg-gpg-program
(setq auth-sources '("~/.authinfo.gpg"))

(require 'epa-file)
(epa-file-enable)
;; Only in Emacs 27 or newer
(if (version< "27" emacs-version)
    (defalias 'epa--decode-coding-string 'decode-coding-string))

(provide 'my-init-gpg)
