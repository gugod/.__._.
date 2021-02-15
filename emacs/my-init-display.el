(set-frame-parameter nil 'internal-border-width 24)
(set-frame-parameter nil 'fullscreen 'maximized)

(when (and (eq system-type 'darwin) (display-graphic-p))
  (set-fontset-font t 'kana (font-spec :name "MotoyaLMaru"))
  (set-fontset-font t 'han (font-spec :family "jf-openhuninn-1.1"))
  (set-fontset-font t 'han (font-spec :family "GenSenRounded TW") nil 'append)
  (set-fontset-font t 'han (font-spec :family "Yuanti TC") nil 'append)
  (set-fontset-font t 'han (font-spec :family "Yuanti SC") nil 'append)
  (set-fontset-font t 'bopomofo (font-spec :family "jf-openhuninn-1.1"))
  (set-fontset-font t 'cjk-misc (font-spec :family "jf-openhuninn-1.1"))
  (set-fontset-font t 'symbol (font-spec :name "Symbola") nil 'append)
  (set-face-font 'default "Roboto Mono Light 24")
  ;; (set-face-attribute 'default nil :height 240 :family "Input Mono")
  )

(setq face-font-rescale-alist
      '(("jf-openhuninn-1.1" . 1.1)
        ("Yuanti TC" . 1.1)
        ("Yuanti SC" . 1.1)))
        ;; ("-cdac$" . 1.3)))

;; Disable Theme BG color in terminal
;; https://stackoverflow.com/questions/19054228/emacs-disable-theme-background-color-in-terminal
(defun my/set-background-for-terminal (&optional frame)
  (or frame (setq frame (selected-frame)))
  "unsets the background color in terminal mode"
  (unless (display-graphic-p frame)
    (set-face-background 'default "unspecified-bg" frame)))
(add-hook 'after-make-frame-functions 'my/set-background-for-terminal)
(add-hook 'window-setup-hook 'my/set-background-for-terminal)

;; Remove mode-line, but keep a border line at bottom of each window.
(setq window-divider-default-bottom-width 3
      window-divider-default-places t)
(window-divider-mode)

(setq-default mode-line-format nil)
(setq-default header-line-format nil)
(setq-default frame-title-format
     '((:eval
       (format-mode-line (list
         " %b "
         (if (and buffer-file-name (buffer-modified-p))
             (propertize "(modified)" 'face `(:inherit face-faded))))))))

(provide 'my-init-display)
