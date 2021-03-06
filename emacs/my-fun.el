(defun insert-pair-inner-spaces ()
  "Insert a pair of spaces at the beginning and the end of current paren."
  (interactive)
  (save-mark-and-excursion
    (progn
      (forward-sexp)
      (backward-char)
      (insert-char #x20)
      (forward-char)
      (backward-sexp)
      (forward-char)
      (insert-char #x20))))

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

(defun my/switch-to-other-buffer ()
  "Quickly switch to the other buffer"
  (interactive)
  (switch-to-buffer (other-buffer)))

(defun my/elfeed-mark-all-as-read ()
  (interactive)
  (mark-whole-buffer)
  (elfeed-search-untag-all-unread))

(defun my/elfeed-enqueue-link-to-mpv-playlist (entry)
  "Enqueue the current entry link URL to mpv playlist"
  (interactive (list (or elfeed-show-entry
                         (elfeed-search-selected :ignore-region))))
  (let ((link (elfeed-entry-link entry)))
    (my/enqueue-mpv-playlist link)))

(defun my/markdown-update-front-matter ()
  ;;; Ignore the buffer without front matter
  (save-excursion
    (beginning-of-buffer)
    (if (string= "---\n" (thing-at-point 'line))
        (progn
          (let '(end-of-front-matter (search-forward "\n---\n"))
            (beginning-of-buffer)
            (if (not (search-forward "published_at: " end-of-front-matter t))
              (progn
                (goto-char 5)
                (open-line 1)
                (insert "published_at: " (format-time-string "%Y-%m-%dT%T%z"))))
            (beginning-of-buffer)
            (if (search-forward "updated_at: " end-of-front-matter t)
                (progn
                  (kill-line)
                  (insert (format-time-string "%Y-%m-%dT%T%z")))
              (progn
                (goto-char 5)
                (open-line 1)
                (insert "updated_at: " (format-time-string "%Y-%m-%dT%T%z")))
              ))))))

(defun my/markdown-hook ()
  (set (make-local-variable 'before-save-hook)
       (lambda ()
         (my/markdown-update-front-matter))))

(defun my/enqueue-mpv-playlist (url)
  (write-region (concat url "\n") nil "~/var/mpv-playlist" t nil "~/var/mpv-playlist.lock"))

(defun my/insert-semicolon-at-the-end ()
  (interactive)
  (end-of-line)
  (insert ";"))

(defun my/threaded-gnus ()
  (interactive)
  (make-thread #'gnus))

(defun my/fzf-current-project ()
  "fzf from current project root."
  (interactive)
  (let ((dir (if (version< emacs-version "28.0")
                 (cdr (project-current))
               (project-root (project-current)))))
    (setq default-directory dir)
    (fzf)))

(defun my/quote-current-word ()
  "Quote current word."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (goto-char (cdr bounds))
    (insert-char #x22)
    (goto-char (car bounds))
    (insert-char #x22)))

(provide 'my-fun)
