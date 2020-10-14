;; 全局启用editorconfig支持
(editorconfig-mode t)
;; 项目管理mode
(projectile-mode t)

;; vue
(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)));; 去掉mmm-mode背景色

;; 开启自动补全
(global-company-mode t)
(yas-global-mode t)
(setq company-minimum-prefix-length 1);; 输入多少个字开始提示 
(setq company-idle-delay 0.1);; 提示延迟时间
;; 使用company-box前端
(add-hook 'company-mode-hook 'company-box-mode)

;; markdown预览命令配置
(setq markdown-command "grip")
;; 启用彩虹括号
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; 显示缩进
(indent-guide-global-mode t)
;; 启用elisp自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 启用自动匹配括号,引号等
(electric-pair-mode t)
(setq electric-pair-pairs
  '((?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')))

(provide 'lang)
