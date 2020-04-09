(deftheme grey-paper
  "Grayscale like eink")

(custom-theme-set-faces
 'grey-paper
 '(fringe ((t (:background "#d0d0d1" :foreground "black"))))
 '(region ((t (:background "#c0c0c0" :distant-foreground "ns_selection_fg_color"))))
 '(font-lock-comment-face ((t (:foreground "#909090"))))
 '(font-lock-function-name-face ((t (:foreground "#222a33"))))
 '(font-lock-builtin-face ((t (:foreground "#222a33"))))
 '(font-lock-string-face ((t (:foreground "#222a33"))))
 '(font-lock-type-face ((t (:foreground "#111a22"))))
 '(font-lock-variable-name-face ((t (:foreground "#222a33"))))
 '(cperl-array-face ((t (:background "#d0d0d1" :foreground "#222a33"))))
 '(cperl-hash-face ((t (:background "#d0d0d1" :foreground "#222a33"))))
 '(cperl-nonoverridable-face ((t (:background "#d0d0d1" :foreground "#222a33"))))
 '(default ((t (:background "#d0d0d1" :foreground "#222a33"))))
 '(font-lock-keyword-face ((t (:foreground "#333a33")))))

(provide-theme 'grey-paper)
