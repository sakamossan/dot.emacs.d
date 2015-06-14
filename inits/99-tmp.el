
(require 'helm-config)
(global-set-key (kbd "C-c h") 'helm-mini)

;; C-t でother-window、分割されてなかったら分割
(defun other-window-or-split () ; http://d.hatena.neeli .jp/rubikitch/20100210/emacs
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))
(define-key global-map (kbd "C-t") 'other-window-or-split)

;; C-x k は current-buffer 専用にしちゃう
(defun kill-current-buffer ()
  (interactive)
  (kill-buffer))
(define-key global-map (kbd "C-x k") 'kill-current-buffer)

;; 折り返し 通常のウィンドウ用の設定
(setq-default truncate-lines t)
;;ウィンドウを左右に分割したとき用の設定
(setq-default truncate-partial-width-windows t)

; シバンをみて実行権限をつける
(add-hook 'after-save-hook
          'executable-make-buffer-file-executable-if-script-p)

; modeline fullpath
(set-default 'mode-line-buffer-identification
                  '(buffer-file-name ("%f") ("%b")))

; アクティブなバッファのモードラインの文字色の設定
(set-face-foreground 'mode-line "black")

; 複数行移動
(global-set-key "\M-n" (kbd "C-u 2 C-n"))
(global-set-key "\M-p" (kbd "C-u 2 C-p"))

; 一つ前のバッファと後のバッファ
(define-key global-map (kbd "C-c p") 'bs-cycle-next)
(define-key global-map (kbd "C-c n") 'bs-cycle-previous)

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; バックアップしない
(setq make-backup-files nil)

;; 自動セーブしない
(setq auto-save-default nil)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)
;; タブ幅は4
(setq-default tab-width 4)

;; 対応する括弧を光らせる
(show-paren-mode 1)

; jump&大文字コマンドうざいので殺す
(define-key global-map (kbd "M-c") nil)

; 文字サイズを変更するのうざいので殺す
(define-key global-map (kbd "C-x C-0") nil)

; menu-bar消す
(menu-bar-mode -1)

;;;; C-z で最小化するのうざいのでころす
(define-key global-map (kbd "C-z") nil)

; 最近開いたファイル
; キーバインド設定しておきたい
(recentf-mode 1)
(global-set-key "\C-xf" 'recentf-open-files) ;;履歴一覧を開く
(setq recentf-max-saved-items 10000) ;; 保持数
