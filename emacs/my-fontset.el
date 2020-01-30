;;; Fontset shits

(require 'carbon-font)

(let (cr crit)
  (defun cr (fontname)
    (carbon-font-create-fontset
     fontname
     '(14 18 24)
     `((ascii . ,fontname)
       (japanese-jisx0208 . "ヒラギノ明朝*")
       (katakana-jisx0201 . "ヒラギノ明朝*")
       (chinese-gb2312 . ,(if (x-list-fonts "*-hei-*") "hei" "华文宋体"))
       ; (chinese-big5-1 . "stheiti")
       ; (chinese-big5-2 . "stheiti")
       (chinese-big5-1 . "儷黑*")
       (korean-ksc5601 . ,(if (x-list-fonts "*applemyungjo*")
                              "applemyungjo*" "applegothic*")))))
  (defun crit (fontnames)
    (if (car fontnames)
        (progn
          (cr (car fontnames))
          (crit (cdr fontnames)))
      nil))

  (crit '(
          "liberation mono"
          "dpcustommono2"
          "cmu typewriter text regular"
          "consolas"
          "dejavu sans mono"
          "aerial mono"
          "andale mono"
          "Bitstream Vera Sans Mono"))

  (let ((fixed-width-xlfd-template
         "-apple-%s-medium-r-normal--%d-*-*-*-m-*-*-*")
        cr)
    (defun cr (fontname)
      (carbon-font-create-fontset
       fontname
       '(14 18 24)
       `((ascii . ,fontname)
         (japanese-jisx0208 . "ヒラギノ明朝*")
         (katakana-jisx0201 . "ヒラギノ明朝*")
         (chinese-gb2312 . "STFangsong")
         (chinese-big5-1 . "儷宋 pro")
         (chinese-big5-2 . "儷宋 pro")
         (korean-ksc5601 . ,(if (x-list-fonts "*applemyungjo*")
                                "applemyungjo*" "applegothic*")))))
    (crit '("centschbook mono bt"))))

(carbon-font-create-fontset
 "inconsolata"
 '(14 18 24)
 carbon-font-encode-family-list-hiraginokaku)

(carbon-font-create-fontset
 "onuava"
 '(12 14 18 24)
 carbon-font-encode-family-list-hiraginokaku)

(set-default-font "-*-*-medium-r-normal--14-*-*-*-*-*-fontset-onuava")

;;       (japanese-jisx0208 . "osaka*")
;;       (katakana-jisx0201 . "osaka*")
;;       (chinese-gb2312 . ,(if (x-list-fonts "*华文细黑*") "华文细黑*" "华文黑体*"))

;; (defvar carbon-font-encode-family-list-aerialmono
;;   `((ascii . "aerial mono")
;;     (japanese-jisx0208 . "ヒラギノ明朝*")
;;     (katakana-jisx0201 . "ヒラギノ明朝*")
;;     (chinese-gb2312 . ,(if (x-list-fonts "*华文宋体*") "华文宋体*" "华文黑体*"))
;;     (chinese-big5-1 . ,(if (x-list-fonts "*儷宋*") "儷宋*" "儷黑*"))
;;     (korean-ksc5601 . ,(if (x-list-fonts "*applemyungjo*")
;;                            "applemyungjo*" "applegothic*"))))


;; 華人华人细黑字测式
;; 刘康民测试
;; 一条龙
;; あの
