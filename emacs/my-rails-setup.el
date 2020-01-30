;;; Rails
(require 'rails)

;(mmm-add-classes
; '((erb-code
;    :submode ruby-mode
;    :match-face (("<%#" . mmm-comment-submode-face)
;                 ("<%=" . mmm-output-submode-face)
;                 ("<%"  . mmm-code-submode-face))
;    :front "<%[#=]?"
;    :back "-?%>"
;    :insert ((?% erb-code       nil @ "<%"  @ " " _ " " @ "%>" @)
;             (?# erb-comment    nil @ "<%#" @ " " _ " " @ "%>" @)
;             (?= erb-expression nil @ "<%=" @ " " _ " " @ "%>" @))
;    )))
;
;(defun my-html-mode-hook ()
;  ;; (local-set-key (kbd "TAB") 'yas/expand)
;  (setq mmm-classes '(erb-code html-js embedded-css))
;  (mmm-mode-on)
;)
;
;(add-hook 'html-mode-hook 'my-html-mode-hook)
;
