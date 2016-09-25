
;;; BEGIN: notmuch keybindings
(define-key notmuch-search-mode-map "S"
      (lambda (&optional beg end)
        "mark thread as spam"
        (interactive (notmuch-search-interactive-region))
        (notmuch-search-tag (list "+spam" "-inbox") beg (+ 1 end))))
(define-key notmuch-search-mode-map "d"
      (lambda (&optional beg end)
        "mark thread as deleted"
        (interactive (notmuch-search-interactive-region))
        (notmuch-search-tag (list "+deleted") beg (+ 1 end))))
;;; END notmuch keybindings

(provide 'my-notmuch)
