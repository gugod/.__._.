;;; my-markdown.el --- 

(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t)

(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

(provide 'my-markdown)

