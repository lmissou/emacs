;; 全局启用editorconfig支持
(editorconfig-mode t)
;; 项目管理mode
(projectile-mode t)

;; 开启自动补全
(global-company-mode t)
(yas-global-mode t)
(setq company-minimum-prefix-length 1);; 输入多少个字开始提示 
(setq company-idle-delay 0.1);; 提示延迟时间
;; 使用company-box前端
(add-hook 'company-mode-hook 'company-box-mode)

;; markdown预览命令配置
(setq markdown-command "grip")
(setq initial-scratch-message "")
;; 启用elisp自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 启用自动匹配括号,引号等
(electric-pair-mode t)
(setq electric-pair-pairs
  '((?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')))

(provide 'lang)
