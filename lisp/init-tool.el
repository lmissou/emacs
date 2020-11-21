;; 常用工具

;; 全局开启undo-tree优化重做撤销
(use-package undo-tree
  :config
  (global-undo-tree-mode t))

;; 删除选中的内容
(use-package hungry-delete
  :config
  (global-hungry-delete-mode t))

;; 窗口跳转
(use-package ace-window
  :config
  (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
  :bind (("M-o" . ace-window)))

;; 快速选择
(use-package expand-region
  :bind (("C-=" . er/expand-region)))

;; 多光标
(use-package multiple-cursors
  :bind (("C-S-<mouse-1>" . mc/add-cursor-on-click)
	 ("C-M-p" . mc/mmlte--up)
	 ("C-M-n" . mc/mmlte--down)))

;; 快速跳转
(use-package avy
  :config
  (setq avy-timeout-seconds 0.3))

;; treemacs文件目录树
(use-package treemacs
  :bind (:map treemacs-mode-map
	      ("j" . treemacs-next-line)
	      ("k" . treemacs-previous-line))
  :config
  (treemacs-resize-icons 14))

;; treemacs的all-the-icons主题
(use-package treemacs-all-the-icons
  :after treemacs
  :config
  (require 'treemacs-all-the-icons)
  (treemacs-load-theme "all-the-icons"))

(use-package treemacs-magit
  :after treemacs)
(use-package treemacs-projectile
  :after treemacs)

;; 有道词典
(use-package youdao-dictionary
  :bind ("C-c t" . youdao-dictionary-search-async)
  :config
  (setq url-automatic-caching t))

(provide 'init-tool)
