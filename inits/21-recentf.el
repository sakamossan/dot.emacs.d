;; 自動保存
(when (require 'recentf-ext nil t)
  (recentf-mode 1)
  (global-set-key "\C-xf" 'recentf-open-files) ;;履歴一覧を開く
  (setq recentf-max-saved-items 10000) ;; 保持数
