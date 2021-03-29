;; 指定Customize文件位置（防止写入init.el）
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file)
;; 启动时全屏(根据用户设置的变量my/maximized决定是否全屏)
(if (and (boundp 'my/maximized) my/maximized)
    (setq initial-frame-alist '((fullscreen . maximized))))
;; 隐藏菜单栏工具栏滚动条
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; 开启鼠标和滚轮
(xterm-mouse-mode t)
(mouse-wheel-mode t)
;; 设置光标样式
;; (setq-default cursor-type 'bar)
;; 当前行高亮
(global-hl-line-mode t)
;; 状态栏显示列号
(column-number-mode t)
;; 关闭启动界面
(setq inhibit-splash-screen t)
;; 去掉scratch默认显示的文字
(setq initial-scratch-message "")
;; 禁止备份文件
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq recentf-max-menu-items 40)
;; 开启图表缓存
(setq inhibit-compacting-font-caches t)
;; 输入覆盖选中的块
(delete-selection-mode t)
;; 解决tab缩进问题
(setq default-tab-width 4)
(setq indent-tabs-mode nil)
;; 设置avy跳转等待时间
(setq avy-timeout-seconds 0.5)
;; 使用y/n代替yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; 优化转换大小写
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(provide 'init-basic)
