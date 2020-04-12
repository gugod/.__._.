(deftheme grey-paper
  "Grayscale like eink")

(custom-theme-set-faces
 'grey-paper
 '(link ((t (:foreground "#224022" :underline t))))
 '(cperl-array-face ((t (:background "#d0d1d0" :foreground "#222a33" :bold t))))
 '(cperl-hash-face ((t (:background "#d0d1d0" :foreground "#222a33" :bold t))))
 '(cperl-nonoverridable-face ((t (:background "#d0d1d0" :foreground "#222a33" :bold t))))
 '(default ((t (:background "#d0d1d0" :foreground "#222a33"))))
 '(font-lock-builtin-face ((t (:foreground "#222a33"))))
 '(font-lock-comment-face ((t (:foreground "#909090"))))
 '(font-lock-constant-face ((t (:foreground "#111111"))))
 '(font-lock-function-name-face ((t (:foreground "#222a33" :bold t))))
 '(font-lock-keyword-face ((t (:foreground "#333a33"))))
 '(font-lock-string-face ((t (:foreground "#222a33"))))
 '(font-lock-type-face ((t (:foreground "#111a22"))))
 '(font-lock-variable-name-face ((t (:foreground "#222a33"))))
 '(fringe ((t (:background "#d0d1d0" :foreground "black"))))
 '(region ((t (:background "#c0c0c0" :distant-foreground "ns_selection_fg_color"))))
 )

(provide-theme 'grey-paper)
