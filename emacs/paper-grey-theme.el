(deftheme paper-grey
  "Grey-scale theme emulating the look-en-feel of eink")

(custom-theme-set-faces
 'paper-grey
 '(fringe ((t (:background "#d0d0d1" :foreground "black"))))
 '(region ((t (:background "#e0e0e0" :distant-foreground "ns_selection_fg_color"))))
 '(default ((t (:background "#d0d0d1" :foreground "#222a33"))))
 '(font-lock-comment-face ((t (:foreground "#909090")))))

(provide-theme 'paper-grey)
