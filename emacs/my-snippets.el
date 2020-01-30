
(defun my-snippet-cperl ()
  (define-abbrev-table 'cperl-mode-abbrev-table '())
  (snippet-with-abbrev-table
   'cperl-mode-abbrev-table
   ("if"      .  ">if ($${test}) {\n>$.\n>}")
   ("for"     .  ">for $$($${sequence}) {\n>$.\n>}")
   ("foreach" .  ">foreach $$($${sequence}) {\n>$.\n>}")
   ("wh"      .  ">while ($${test}) {\n>$.\n>}")
   ("while"   .  ">while ($${test}) {\n>$.\n>}")
   ("do"      .  ">do {\n>$.\n>} while($$);")
   ("map"     .  ">map {\n>$.\n>}")
   ("sub"     .  ">sub $$ {\n>$.\n>}")
   ("ssb"     .  ">sub $$ {\n>my $self = shift;\n>$.\n>}")
   ("grep"    .  ">grep {\n>$.\n>}")
   )
  )


(add-hook 'cperl-mode-hook 'my-snippet-cperl)

(defun my-snippet-css ()
  (define-abbrev-table 'css-mode-abbrev-table '())
  (snippet-with-abbrev-table
   'css-mode-abbrev-table
   ("url"     .  "url($$)")
   ))

(add-hook 'css-mode-hook 'my-snippet-css)

;; HTML -- doesn't work ?

;; (defun my-snippet-html ()
;;     (snippet-with-abbrev-table
;;      'html-mode-abbrev-table
;;      ("<div"    .  "<div id=\"$${id}\">\n>$.\n></div>")
;;     ))

;; (add-hook 'html-mode-hook 'my-snippet-html)

(defun my-snippet-javascript ()
  (define-abbrev-table 'javascript-mode-abbrev-table '())
  (snippet-with-abbrev-table
   'javascript-mode-abbrev-table
   ("if"      .  ">if ($${test}) {\n>$.\n>}")
   ("for"     .  ">for $$($${sequence}) {\n>$.\n>}")
   ("while"   .  ">while ($${test}) {\n>$.\n>}")
   ("func"    .  "function ($$) {\n>$.\n>}")
   ))

(add-hook 'javascript-mode-hook 'my-snippet-javascript)



