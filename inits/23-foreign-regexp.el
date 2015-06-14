(require 'foreign-regexp)
(custom-set-variables
  '(foreign-regexp/regexp-type 'perl) 
  ;; Choose your taste of foreign regexp from 'perl, 'ruby or 'js'
  '(reb-re-syntax 'foreign-regexp))
  ;; Tell re-builder to use foreign regex.
(global-set-key (kbd "C-s") 'foreign-regexp/isearch-forward)
(global-set-key (kbd "C-r") 'foreign-regexp/isearch-backward)
