;;; unihan.el --- Utilities for Unihan Database      -*- lexical-binding: t; -*-

;; Copyright (C) 2018  Xu Chunyang

;; Author: Xu Chunyang <mail@xuchunyang.me>
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

;; unihan.el provides utilities for the Unicode Hàn (漢) Database (Unihan).
;;
;; [Unihan]: http://www.unicode.org/charts/unihan.html

;;; Code:

(defvar unihan-directory
  (expand-file-name
   "Unihan"
   (file-name-directory
    (or load-file-name buffer-file-name)))
  "The location of Unihan database.")

(defun unihan-readings (char)
  (with-temp-buffer
    (insert-file-contents
     (expand-file-name "Unihan_Readings.txt" unihan-directory))
    (goto-char (point-min))
    (let (results)
      (while (re-search-forward
              (format "^U\\+%x\t\\([a-zA-Z]+\\)\t\\(.+\\)$" char) nil t)
        (push (cons (intern (match-string 1)) (match-string 2)) results))
      (nreverse results))))

(provide 'unihan)
;;; unihan.el ends here
