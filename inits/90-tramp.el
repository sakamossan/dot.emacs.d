; SYNOPSYS
; C-x C-f /ssh:gw4:/home/nn/tramp.txt
; C-x C-f /dlv1:gw4:/tmp/tmp.pl

; sshでremoteのファイルを触る
(require 'tramp)
(setq tramp-default-method "scp")

(add-to-list 'tramp-default-proxies-alist
             '("dlv11" nil "/ssh:gw4:"))

(add-to-list 'tramp-default-proxies-alist
             '("review11" nil "/ssh:gw4:"))
