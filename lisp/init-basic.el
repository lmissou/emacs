;; 指定Customize文件位置（防止写入init.el）
(setq custom-file (locate-user-emacs-file ".cache/custom.el"))
;; 加载自定义配置文件
(setq +custom-file (locate-user-emacs-file "custom.el"))
(load +custom-file)

;; 自定义变量初始值
(defvar +roam-dir "~/Documents/orgNotes/")
(defvar +theme 'doom-one)
(defvar +maximized nil)
(defvar +leader-key "C-;")

;; 基础的配置
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
;; 使用y/n代替yes/no
(fset 'yes-or-no-p 'y-or-n-p)
;; 优化转换大小写
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
;; dired只保留一个buffer
(put 'dired-find-alternate-file 'disabled nil)

(provide 'init-basic)
