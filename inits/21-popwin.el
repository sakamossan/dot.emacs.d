(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

;; cf: https://github.com/emacs-jp/issues/issues/2
(setq popwin:close-popup-window-timer-interval 0.5)

(push '("*Occur*") popwin:special-display-config)
