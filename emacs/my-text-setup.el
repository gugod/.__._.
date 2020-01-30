;; This is a way to hook tempo into cc-mode

;; (yas/define 'text-mode "mc" "<C>${code}</C>$0")
;; (yas/define 'text-mode "mq" "<C>\"${code}\"</C>$0")
;; (yas/define 'text-mode "mr" "食譜")
;; (yas/define 'text-mode "mprogperl" "《Perl 程式設計》第 ${n} 章$0")
;; (yas/define 'text-mode "msm" "標準模組<C>${name}</C>$0")
;; (yas/define 'text-mode "mcm" "CPAN模組<C>${name}</C>$0")
;; (yas/define 'text-mode "msd" "標準模組<C>${name}</C>的文件$0")
;; (yas/define 'text-mode "mcd" "CPAN模組<C>${name}</C>的文件$0")

;; (defvar text-tempo-tags nil
;;   "Tempo tags for text-mode")

;; (require 'tempo)

;; (defun text-insert-code-block-begin () (interactive) (insert "<C>"))
;; (defun text-insert-code-block-end () (interactive) (insert "</C>"))

;; (defun my-text-hook ()
;;    (tempo-use-tag-list 'text-tempo-tags)
;;    (local-set-key (kbd "C-=") 'tempo-complete-tag)
;;    (local-set-key (kbd "C-;") 'text-insert-code-block-begin)
;;    (local-set-key (kbd "C-'") 'text-insert-code-block-end)
;;    )

;; (add-hook 'text-mode-hook 'my-text-hook)

;;; ;;; Preprocessor Templates (appended to c-tempo-tags)

;; (tempo-define-template "text-progperl"
;; 		       '("《Perl 程式設計》第 " p " 章")
;; 		       "progperl"
;; 		       "Insert a progperl"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-code-markup"
;; 		       '("<C>" p "</C>" p)
;; 		       "mc"
;; 		       "Insert a code markup"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-code-markup-with-quote"
;; 		       '("<C>\"" p "\"</C>" p)
;; 		       "mq"
;; 		       "Insert a code + quote markup"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-code-recipie"
;; 		       '("食譜" p)
;; 		       "recipe"
;; 		       "Insert a recipe"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-stdmodule"
;; 		       '("標準模組<C>" p "</C>" p)
;; 		       "sm"
;; 		       "Insert a std module"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-cpanmodule"
;; 		       '("CPAN模組<C>" p "</C>" p)
;; 		       "cm"
;; 		       "Insert a cpan module"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-stdmoduledoc"
;; 		       '("標準模組<C>" p "</C>的文件" p)
;; 		       "sd"
;; 		       "Insert a std module doc"
;; 		       'text-tempo-tags)

;; (tempo-define-template "text-cpanmoduledoc"
;; 		       '("CPAN模組<C>" p "</C>的文件" p)
;; 		       "cd"
;; 		       "Insert a cpan module doc"
;; 		       'text-tempo-tags)
