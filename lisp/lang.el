;; 全局启用editorconfig支持
(editorconfig-mode t)
;; 项目管理mode
(projectile-mode t)
;; 显示文件变化（git）
(global-git-gutter-mode t)

;; vue
(setq mmm-submode-decoration-level 0);; 去掉mmm-mode背景色

;; 开启自动补全
(global-company-mode t)
(yas-global-mode t)
(setq company-minimum-prefix-length 1);; 输入多少个字开始提示 
(setq company-idle-delay 0.1);; 提示延迟时间
;; 使用company-box前端
(add-hook 'company-mode-hook 'company-box-mode)

;; 启用彩虹括号
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; 显示缩进
(indent-guide-global-mode t)
;; 优化自动缩进，使用TAB和RET不自动缩进
(add-hook 'vue-mode-hook '(lambda ()
			    (progn (define-key mmm-mode-map (kbd "<tab>") 'tab-to-tab-stop)
				   (define-key mmm-mode-map (kbd "M-i") 'indent-for-tab-command)
				   (define-key mmm-mode-map (kbd "<return>") 'electric-newline-and-maybe-indent)
				   (define-key mmm-mode-map (kbd "C-<return>") 'newline)
				   )))
;; 启用elisp自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 启用自动匹配括号,引号等
(electric-pair-mode t)
(setq electric-pair-pairs
  '((?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')))

(provide 'lang)
