(require 'auto-complete)
(require 'auto-complete-config)
    ;; グローバルでauto-completeを利用
    (global-auto-complete-mode t)
    (setq ac-dwim t)  ; 空気読んでほしい
    ;; 情報源として
    ;; * ac-source-filename
    ;; * ac-source-words-in-same-mode-buffers
    ;; を利用
    (setq-default ac-sources
                  '(ac-source-filename
                    ac-source-words-in-same-mode-buffers))
    ;; また、Emacs Lispモードではac-source-symbolsを追加で利用
    (add-hook 'emacs-lisp-mode-hook (lambda ()
                                      (add-to-list
                                       'ac-sources
                                       'ac-source-symbols t)))
    ;; 以下、自動で補完する人用
    (setq ac-auto-start 1)

;; 辞書追加
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")

(setq ac-auto-start 2)  ;; n文字以上の単語の時に補完を開始
(setq ac-delay 0.05)  ;; n秒後に補完開始
(setq ac-use-fuzzy t)  ;; 曖昧マッチ有効
(setq ac-use-comphist t)  ;; 補完推測機能有効
(setq ac-auto-show-menu 0.05)  ;; n秒後に補完メニューを表示
