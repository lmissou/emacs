;; 启用popwin
(popwin-mode t)
;; 开启浮动提示并设置浮动提示在中心显示
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
(setq ivy-posframe-parameters
      '((left-fringe . 8)
        (right-fringe . 8)))
(ivy-posframe-mode t)
;; 启用文件历史记录
(recentf-mode t)
;; 设置dashboard
(dashboard-setup-startup-hook)
(setq dashboard-items '(
    (recents . 8)
    (projects . 8)
    (bookmarks . 5)
    ;; (agenda . 5)
    ;; (registers . 5)
    ))

;; ivy使用all-the-icons
(all-the-icons-ivy-setup)
;; 开启快捷键提示
(which-key-mode t)
;; 设置treemacs
(treemacs-resize-icons 14)
;; treemacs使用all-the-icons主题
(require 'treemacs-all-the-icons)
(treemacs-load-theme "all-the-icons")
;; dired文件浏览器使用icon
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; 设置主题
(load-theme 'doom-one-light t)
;; 设置mode-line
(doom-modeline-init)
(setq doom-modeline-height 5)
(setq doom-modeline-bar-width 1)

(provide 'ui)
