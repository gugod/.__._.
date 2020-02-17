(require 'gnus)

(setq gnus-save-newsrc-file nil
      gnus-read-newsrc-file nil
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
