(defun browse-url-vlc (url &rest args)
  "Open the given url with vlc (assume vlc knows how to handles it)"
  (apply #'start-process (concat "vlc " url) nil "vlc" (list url)))

(defun browse-url-mpv (url &rest args)
  "Open the given url with mpv (assume mpv knows how to handles it)"
  (apply #'start-process
         (concat "mpv " url)
         (get-buffer-create "*mpv*")
         "mpv"
         (list "--ytdl-format=best[height<=720]" "--force-window" url)))

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

(defun eww-new-buffer-with-url (url)
  (switch-to-buffer (generate-new-buffer "eww"))
  (eww-mode)
  (eww url))

(defun reset-all-faces ()
  (interactive)
  (progn
    (dolist (f (list 'default))
      (set-face-attribute f nil :foreground "#222222" :background "#d0d1d0" :bold nil :underline nil))

    ;;; Reverse
    (dolist (f (list 'highlight 'region 'isearch 'show-paren-match-expression))
      (set-face-attribute f nil :foreground  "#d0d1d0" :background"#222222"))

    (set-face-attribute 'show-paren-mismatch f nil :weight "bold" :strike-through t)
    (set-face-attribute 'show-paren-match    f nil :weight "bold")
  ))

(provide 'my-fun)
