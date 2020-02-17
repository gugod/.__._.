;;; lsp-perl.el ---                                  -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Kang-min Liu

;; Author: Kang-min Liu <gugod@lijk>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; 

;;; Code:

(require 'lsp-mode)
(require 'lsp-common)

(lsp-define-stdio-client lsp-perl
                         "perl"
                          #'(lambda () default-directory)
                         '("/Users/gugod/bin/perl-language-server"))

(provide 'lsp-perl)
;;; lsp-perl.el ends here
