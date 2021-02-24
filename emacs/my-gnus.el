(require 'gnus)

(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil

      gnus-use-cache t
      gnus-asynchronous t
      gnus-use-article-prefetch 30
      gnus-suppress-duplicates t
      gnus-home-score-file "~/News/all.SCORE"
      gnus-home-adapt-file "~/News/all.ADAPT"
      gnus-score-interactive-default-score 1

      gnus-summary-line-format "%U%R%z %-16,16f  %B%s\n"
      gnus-summary-thread-gathering-function 'gnus-gather-threads-by-references
      gnus-thread-sort-functions '(gnus-thread-sort-by-date)
      gnus-sum-thread-tree-false-root ""
      gnus-sum-thread-tree-indent " "
      gnus-sum-thread-tree-leaf-with-other "├► "
      gnus-sum-thread-tree-root ""
      gnus-sum-thread-tree-single-leaf "╰► "
      gnus-sum-thread-tree-vertical "│"

      gnus-read-active-file 'some
      gnus-check-new-newsgroups 'ask-server

      gnus-select-method '(nnnil "")
      gnus-secondary-select-methods '(
                                      ;; (nnmaildir "" (directory "~/Maildir"))
                                      (nnimap "mail.gandi.net"
                                              (nnimap-address "mail.gandi.net")
                                              (nnimap-port "imaps")
                                              (nnimap-stream ssl))
                                      ;; (nnimap "gmail"
                                      ;;         (nnimap-address "imap.gmail.com")
                                      ;;         (nnimap-port "imaps")
                                      ;;         (nnimap-stream ssl))
                                      ;; (nnimap "booking"
                                      ;;         (nnimap-address "imap.booking.com")
                                      ;;         (nnimap-stream starttls))
                                      ;; (nntp "freenews.netfront.net")
                                      ;; (nntp "news.mozilla.org")
                                      ;; (nntp "news.newsgroup.la")
                                      ;; (nntp "news.aioe.org")
                                      ;; (nntp "news.individual.net")
                                      ;; (nntp "nntp.perl.org")
                                      ;; (nntp "news.gwene.org")
                                      ;; (nntp "reader.albasani.net"
                                      ;;       (nntp-open-connection-function nntp-open-tls-stream)
                                      ;;       (nntp-port-number 563))
                                      (nntp "news.eternal-september.org"
                                            (nntp-open-connection-function nntp-open-tls-stream)
                                            (nntp-port-number 563))
                                      ))

(provide 'my-gnus)
