;; create backup file in ~/.emacs.d/backup
(setq make-backup-files t)
(setq backup-directory-alist
  (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/backup"))
    backup-directory-alist))

;; create auto-save file in ~/.emacs.d/backup
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "~/.emacs.d/backup/") t)))

;; 改行コードを表示
(setq eol-mnemonic-dos "(CRLF)")
(setq eol-mnemonic-mac "(CR)")
(setq eol-mnemonic-unix "(LF)")

;; インデントをスペースに
(defun my-c-mode-hook ()
  (c-set-style "linux")
  (setq c-basic-offset tab-width))
(add-hook 'c-mode-hook 'my-c-mode-hook)
(setq-default tab-width 4 indent-tabs-mode nil)

;; save-buffer 時，buffer 末尾に空行が常にあるように
(setq require-final-newline t)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;; シンボリックリンクを開くときの質問省略
(setq vc-follow-symlinks t)

;; linum-mode をいじって Emacs を高速化
(setq linum-delay t)
(defadvice linum-schedule (around my-linum-schedule () activate)
  (run-with-idle-timer 0.2 nil #'linum-update-current))

;; スクロール時の移動量を1に
(setq scroll-step 1)

;; カーソルの位置が何文字目かを表示する
(column-number-mode t)

;; カーソルの位置が何行目かを表示する
(line-number-mode t)


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

; auto-revert  git-checkoutしたときなどにauto-revirtする
(global-auto-revert-mode 1)
(setq global-auto-revert-mode-text "")

; (yes/no) を (y/n)に
(fset 'yes-or-no-p 'y-or-n-p)

; キーバインドの通知
(setq suggest-key-bindings t)

; アクティブなバッファのモードラインの背景色の設定
(set-face-background 'mode-line "MediumPurple1")  


; 複数行移動
(global-set-key "\M-n" (kbd "C-u 2 C-n"))
(global-set-key "\M-p" (kbd "C-u 2 C-p"))

; ページ移動
(global-set-key "\C-\M-p" (kbd "M-v"))
(global-set-key "\C-\M-n" (kbd "C-v"))

; 一つ前のバッファと後のバッファ
(define-key global-map (kbd "C-c p") 'bs-cycle-next)
(define-key global-map (kbd "C-c n") 'bs-cycle-previous)

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; バックアップしない
(setq make-backup-files nil)

;; 自動セーブしない
(setq auto-save-default nil)

;; C-hでバックスペース
(global-set-key "\C-h" 'delete-backward-char)

;; リージョンをC-hで削除
(delete-selection-mode 1)

; マークセット(macosの日本語切り替えと競合するため)
(global-set-key "\M- " 'set-mark-command)

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
