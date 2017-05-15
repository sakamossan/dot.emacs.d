; http://yasuwagon.blogspot.jp/2011/04/emacs-warning-reference-to-free.html
(defvar foreign-regexp/regexp-type "")
(defvar foreign-regexp/re-builder/targ-buf-state/.orig-pt "")

(require 'foreign-regexp)

(custom-set-variables
  '(foreign-regexp/regexp-type 'perl) 
  ;; Choose your taste of foreign regexp from 'perl, 'ruby or 'js'
  '(reb-re-syntax 'foreign-regexp))
  ;; Tell re-builder to use foreign regex.
(global-set-key (kbd "C-s") 'foreign-regexp/isearch-forward)
(global-set-key (kbd "C-r") 'foreign-regexp/isearch-backward)
