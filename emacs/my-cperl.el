(defalias 'perl-mode 'cperl-mode)
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|t\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))

(defun my-cperl-settings ()
  (setq cperl-label-offset 0)
  (setq cperl-auto-newline nil)
  (setq cperl-break-one-line-blocks-when-indent nil)
  (setq cperl-clobber-lisp-bindings nil)
  (setq cperl-close-paren-offset -4)
  (setq cperl-continued-brace-offset 4)
  (setq cperl-continued-statement-offset 4)
  (setq cperl-electric-keywords nil)
  (setq cperl-electric-linefeed t)
  (setq cperl-electric-parens nil)
  (setq cperl-font-lock nil)
  (setq cperl-hairy nil)
  (setq cperl-highlight-variables-indiscriminately t)
  (setq cperl-indent-level 4)
  (setq cperl-indent-parens-as-block t)
  (setq cperl-indent-wrt-brace nil)
  (setq cperl-lazy-help-time 3)
  (setq cperl-merge-trailing-else t)
  (setq cperl-pod-here-scan t)
  (setq cperl-regexp-scan nil)
  (setq indent-tabs-mode nil)
  (local-set-key (kbd "M-q") 'cperl-indent-exp)
  (local-set-key (kbd "C-c C-;") 'my/insert-semicolon-at-the-end)
  (local-set-key (kbd "<RET>") 'newline-and-indent)
  (local-set-key (kbd "C-c c") 'cperl-check-syntax)
  (local-set-key (kbd "C-c p") 'cperl-perldoc))

(add-hook 'cperl-mode-hook 'my-cperl-settings)

(provide 'my-cperl)
