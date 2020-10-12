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

;; 开启快捷键提示
(which-key-mode t)

;; 使用icon主题
(setq neo-theme 'icons)
;; 设置主题
(load-theme 'doom-one-light t)
;; 设置mode-line和mode-line主题
(setq sml/no-confirm-load-theme t)
(setq sml/theme 'powerline)
(sml/setup t)

(provide 'ui)
