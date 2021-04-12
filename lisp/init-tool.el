;; 常用工具
(+use-package undo-tree)
(+use-package hungry-delete)
(+use-package ace-window)
(+use-package expand-region)
(+use-package multiple-cursors)
(+use-package avy)
(+use-package treemacs)
(+use-package treemacs-all-the-icons)
(+use-package treemacs-magit)
(+use-package treemacs-projectile)
(+use-package youdao-dictionary)

;; 全局开启undo-tree优化重做撤销
(global-undo-tree-mode t)
;; 删除选中的内容
(global-hungry-delete-mode t)
;; 设置avy跳转等待时间
(setq avy-timeout-seconds 0.5)
;; 窗口跳转
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(+global-set-key "M-o" 'other-window "other-window")
(+global-set-key "C-M-o" 'ace-window "ace-window")
(+leader-set-key "w h" 'split-window-horizontally "横向分割窗口")
(+leader-set-key "w v" 'split-window-vertically "纵向分割窗口")
(+leader-set-key "w o" 'delete-other-windows "关闭其他窗口")
(+leader-set-key "w q" 'delete-window "关闭窗口")
(+leader-set-key "w w" 'ace-window "切换窗口")
;; 快速选择
(+global-set-key "C-=" 'er/expand-region)
(+normal-set-key "<return>" 'er/expand-region "expand-region")
;; 多光标
(multiple-cursors-mode t)
(+global-set-key "C-S-<mouse-1>" 'mc/add-cursor-on-click)
(+global-set-key "C-M-p" 'mc/mmlte--up)
(+global-set-key "C-M-n" 'mc/mmlte--down)
;; 快速跳转
(setq avy-timeout-seconds 0.3)
(+leader-set-key "a w" 'avy-goto-word-0 "快速跳转单词")
(+leader-set-key "a s" 'avy-goto-char-timer "快速跳转到字符（搜索）")
(+leader-set-key "a g" 'avy-goto-line "快速跳转行")
;; treemacs文件目录树
(with-eval-after-load "treemacs"
  (treemacs-resize-icons 14)
  (define-key treemacs-mode-map "j" 'treemacs-next-line)
  (define-key treemacs-mode-map "k" 'treemacs-previous-line)
  ;; treemacs的all-the-icons主题
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons"))
;; 有道词典
(+leader-set-key "t t" 'youdao-dictionary-search-at-point-posframe "有道词典")
(+leader-set-key "t w" 'youdao-dictionary-search-async "有道词典")
(+leader-set-key "t p" 'youdao-dictionary-play-voice-at-point "有道词典")
(setq url-automatic-caching t)

(provide 'init-tool)
