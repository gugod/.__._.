;;;; mu4e
(require 'mu4e)
(require 'mu4e-contrib)

;; (defvar my-mu4e-headers-speedread-timer)
;; (make-variable-buffer-local 'my-mu4e-headers-speedread-timer)
;; (defun my-mu4e-headers-speedread-this-mail ()
;;   (mu4e-view-scroll-up-or-next))
;; (setq my-mu4e-headers-speedread-timer (run-at-time t 2 'mu4e-view-scroll-up-or-next))
;; (cancel-timer my-mu4e-headers-speedread-timer)
;; (run-at-time "1 second" nil 'mu4e-view-scroll-up-or-next)
;; (defun my-mu4e-headers-speedread ()
;;   (interactive)
;;   (beginning-of-buffer)
;;   (mu4e~view-in-headers-context
;;    (mu4e-view-headers-next)))

  ;; (mu4e-mark-set 'read)
  ;; (mu4e-mark-execute-all t)

(defun my-mu4e-headers-mark-as-junk ()
  (interactive)
  (mu4e-mark-set 'move "/Junk")
  (mu4e-headers-next))

(defun my-mu4e-headers-mark-as-news ()
  (interactive)
  (mu4e-mark-set 'move "/News")
  (mu4e-headers-next))

(defun my-mu4e-headers-mark-as-promotion ()
  (interactive)
  (mu4e-mark-set 'move "/Promotion")
  (mu4e-headers-next))

(defun my-mu4e-view-mark-as-junk ()
  (interactive)
  (mu4e~view-in-headers-context
   (mu4e-mark-set 'move "/Junk"))
  (mu4e-view-headers-next))

(defun my-mu4e-view-mark-as-news ()
  (interactive)
  (mu4e~view-in-headers-context
   (mu4e-mark-set 'move "/News"))
  (mu4e-view-headers-next))

(defun my-mu4e-view-mark-as-promotion ()
  (interactive)
  (mu4e~view-in-headers-context
   (mu4e-mark-set 'move "/Promotion"))
  (mu4e-view-headers-next))

(defun my-mu4e-headers-narrow-unread ()
  (interactive)
  (mu4e-headers-search
    (format "(%s) AND %s" mu4e~headers-last-query "flag:unread")))

(if (functionp 'mu4e-shr2text)
    (setq mu4e-html2text-command 'mu4e-shr2text)
  (setq mu4e-html2text-command "html2markdown | grep -v '&nbsp_place_holder;'"))

(defun mu4e-msgv-action-view-in-browser (msg)
  "View the body of the message in a web browser."
  (interactive)
  (let ((html (mu4e-msg-field (mu4e-message-at-point t) :body-html))
        (tmpfile (format "%s/%d.html" temporary-file-directory (random))))
    (unless html (error "No html part for this message"))
    (with-temp-file tmpfile
      (insert
       "<html>"
       "<head><meta http-equiv=\"content-type\""
       "content=\"text/html;charset=UTF-8\">"
       html))
    (browse-url (concat "file://" tmpfile))))
(add-to-list 'mu4e-view-actions '("browser open." . mu4e-msgv-action-view-in-browser) t)


(setq mu4e-date-format-long "%Y-%m-%dT%T%z")
(setq mu4e-headers-auto-update nil)
(setq mu4e-headers-date-format "%Y-%m-%d")
(setq mu4e-headers-results-limit 500)
(setq mu4e-headers-time-format "%H:%M")
(setq mu4e-update-interval 600)
(setq mu4e-use-fancy-chars t)
(setq mu4e-view-show-images t)

(setq mu4e-bookmarks
      (quote
       (("flag:unread AND NOT flag:trashed AND NOT maildir:/Junk" "Unread messages" 117)
        ("date:today..now AND NOT maildir:/Junk" "Today's messages" 116)
        ("date:7d..now AND NOT maildir:/Junk" "Last 7 days" 119)
        ("mime:image/* AND NOT maildir:/Junk" "Messages with images" 112))))

(setq mu4e-compose-signature "Cheers,\nKang-min Liu")

(setq mu4e-headers-date-format "%m-%d")
(setq mu4e-headers-fields
      (quote
       ((:maildir . 13)
        (:human-date . 5)
        (:from-or-to . 20)
        (:subject . 80))))

(setq mu4e-sent-folder "/Sent"
      mu4e-drafts-folder "/Drafts"
      mu4e-trash-folder "/Trash"
      mu4e-refile-folder "/Archive")


(define-key mu4e-headers-mode-map (kbd "d") 'mu4e-headers-mark-for-delete)
(define-key mu4e-view-mode-map (kbd "d") 'mu4e-view-mark-for-delete)
(define-key mu4e-headers-mode-map (kbd "J") 'my-mu4e-headers-mark-as-junk)
(define-key mu4e-headers-mode-map (kbd "C-c n") 'my-mu4e-headers-mark-as-news)
(define-key mu4e-headers-mode-map (kbd "C-c p") 'my-mu4e-headers-mark-as-promotion)
(define-key mu4e-view-mode-map (kbd "J") 'my-mu4e-view-mark-as-junk)
(define-key mu4e-view-mode-map (kbd "C-c n") 'my-mu4e-view-mark-as-news)
(define-key mu4e-view-mode-map (kbd "C-c p") 'my-mu4e-view-mark-as-promotion)
(define-key mu4e-headers-mode-map (kbd "C-c !") 'mu4e-headers-mark-all-unread-read)
(define-key mu4e-headers-mode-map (kbd "C-c ?") 'my-mu4e-headers-narrow-unread)

(let ((f (expand-file-name "~/etc/my-mail-settings.el")))
  (if (file-readable-p f)
      (load-file f)
    (message (concat "Mail settings file is missing: " f))))

(provide 'my-mu4e)
