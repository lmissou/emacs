;; 常用工具
(my/use-package 'undo-tree)
(my/use-package 'hungry-delete)
(my/use-package 'ace-window)
(my/use-package 'expand-region)
(my/use-package 'multiple-cursors)
(my/use-package 'avy)
(my/use-package 'treemacs)
(my/use-package 'treemacs-all-the-icons)
(my/use-package 'treemacs-magit)
(my/use-package 'treemacs-projectile)
(my/use-package 'youdao-dictionary)

;; 全局开启undo-tree优化重做撤销
(global-undo-tree-mode t)
;; 删除选中的内容
(global-hungry-delete-mode t)

;; 窗口跳转
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
(define-key global-map (kbd "M-o") 'other-window)
(define-key global-map (kbd "C-M-o") 'ace-window)
;; 快速选择
(define-key global-map (kbd "C-=") 'er/expand-region)
;; 多光标
(multiple-cursors-mode t)
(define-key global-map (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(define-key global-map (kbd "C-M-p") 'mc/mmlte--up)
(define-key global-map (kbd "C-M-n") 'mc/mmlte--down)
;; 快速跳转
(setq avy-timeout-seconds 0.3)
;; treemacs文件目录树
(with-eval-after-load "treemacs"
  (treemacs-resize-icons 14)
  (define-key treemacs-mode-map "j" 'treemacs-next-line)
  (define-key treemacs-mode-map "k" 'treemacs-previous-line)
  ;; treemacs的all-the-icons主题
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons"))
;; 有道词典
(define-key global-map (kbd "C-c t") 'youdao-dictionary-search-async)
(setq url-automatic-caching t)

(provide 'init-tool)
