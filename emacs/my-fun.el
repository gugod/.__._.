(defun insert-time ()
  (interactive)
  (insert (format-time-string "%Y-%m-%dT%T%z")))

(defun insert-date ()
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

(defun align-repeat (start end regexp)
  "repeat alignment with respect to the given regular expression"
  (interactive "r\nsAlign regexp: ")
  (align-regexp start end (concat "\\(\\s-+\\)" regexp) 1 1 t))

(defun upcase-prev-word ()
    (interactive)
    (upcase-word -1))

(defun html-end-of-line ()
  "If there is an HTML tag at the end of the line, then go to start of tag.

 Otherwise go to the real end of the line."
  (interactive)
  (if (or (looking-at ".*>$") ; if we're on a line that ends with a tag
          (and (= (char-before) 62)
               (= (point) (save-excursion
                            (end-of-line)
                            (point))))) ; or we're at the end of a line
                                        ; with a tag
      (let ((where-now (point)))
        (narrow-to-region
         (save-excursion
           (beginning-of-line)
           (point))
         (save-excursion
           (end-of-line)
           (point)))
        (end-of-line)
        (re-search-backward "<" nil t)
        (if (= (point) where-now)
            (end-of-line))
        (widen))
    (end-of-line)))

(defun js-insert-alert-at-here ()
  (interactive)
  (insert (concat "alert(\""
                  (buffer-name)
                  ": "
                  (number-to-string (line-number-at-pos))
                  "\");")))

(defun newline-augmented ()
  (interactive)
  (newline)                             ;
  (newline)
  (forward-line -1))

(defun kill-last-paragraph ()
  (interactive)
  (backward-paragraph 2)
  (kill-paragraph 1)
  (forward-paragraph 1))

(defun insert-four-dashes ()
  (interactive)
  (insert "----")
  (newline))

(defun ssh-renew-auth-socket()
  "Renew ssh auth socket"
  (interactive)
  (setenv "SSH_AUTH_SOCK"
          (replace-regexp-in-string
           "\n" ""
           (shell-command-to-string "tmux showenv|grep ^SSH_AUTH_SOCK|cut -d = -f 2"))))

(provide 'my-fun)
