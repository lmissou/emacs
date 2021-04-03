(my/use-package 'rainbow-delimiters)
(my/use-package 'indent-guide)
(my/use-package 'editorconfig)
(my/use-package 'editorconfig-generate)
(my/use-package 'ivy)
(my/use-package 'ivy-rich)
(my/use-package 'counsel)
(my/use-package 'counsel-projectile)
(my/use-package 'swiper)
(my/use-package 'ivy-posframe)
(my/use-package 'projectile)
(my/use-package 'multi-term)
(my/use-package 'git-gutter)
(my/use-package 'magit)
(my/use-package 'company)
(my/use-package 'company-box)
(my/use-package 'yasnippet)
(my/use-package 'yasnippet-snippets)
(my/use-package 'flycheck)
(my/use-package 'yaml-mode)
(my/use-package 'markdown-mode)
(my/use-package 'csharp-mode)
(my/use-package 'go-mode)
(my/use-package 'python-mode)
(my/use-package 'lua-mode)
(my/use-package 'dart-mode)
(my/use-package 'web-mode)
(my/use-package 'emmet-mode)
(my/use-package 'typescript-mode)
(my/use-package 'json-mode)
(my/use-package 'rjsx-mode)
(my/use-package 'mmm-mode)
(my/use-package 'vue-mode)

;; 彩虹括号 rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; 显示缩进 indent-guide
(add-hook 'after-init-hook 'indent-guide-global-mode)
;; editorconfig
(add-hook 'after-init-hook 'editorconfig-mode)
(define-key global-map (kbd "M-y") 'counsel-yank-pop)
;; ivy-posframe浮动提示
(add-hook 'after-init-hook 'ivy-posframe-mode)
;; 设置浮动提示在中心显示
(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center))
      ivy-posframe-parameters
      '((left-fringe . 8)
	(right-fringe . 8)))
;; 项目管理 projcecilt
(add-hook 'after-init-hook 'projectile-mode)
;; projectile查找文件使用ivy
(setq projectile-completion-system 'ivy)
;; emacs内置终端 multi-term
(define-key global-map (kbd "C-~") 'my/multi-term-dedicated-toggle-select)
;; 显示git文件变化（git-gutter）
(add-hook 'after-init-hook 'global-git-gutter-mode)
;; 自动补全 company
;; company选项选择优化
(with-eval-after-load "company"
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous))
(add-hook 'after-init-hook 'global-company-mode)
(setq company-minimum-prefix-length 1;; 输入多少个字开始提示 
      company-idle-delay 0.1);; 提示延迟时间
;; 使用company-box前端
(add-hook 'company-mode-hook 'company-box-mode)
;; 代码片段 yasnippet
(add-hook 'after-init-hook 'yas-global-mode)
(with-eval-after-load "csharp-mode"
  (unbind-key (kbd ",") csharp-mode-map))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq-default web-mode-markup-indent-offset 2
	      web-mode-script-padding 2
	      web-mode-style-padding 2
	      web-mode-css-indent-offset 2
	      web-mode-code-indent-offset 2
	      web-mode-enable-auto-closing t
	      web-mode-enable-auto-pairing t
	      web-mode-enable-css-colorization t)
;; emmet-mode
(defun my/emmet-enable ()
  (emmet-mode t))
(add-hook 'web-mode 'my/emmet-enable)
(add-hook 'vue-mode 'my/emmet-enable)
(add-hook 'css-mode 'my/emmet-enable)
(add-hook 'js-mode 'my/emmet-enable)
(add-hook 'js2-mode 'my/emmet-enable)
(add-hook 'rjsx-mode-hook 'my/emmet-enable)
(setq emmet-self-closing-tag-style " /")
;; javascript/typescript/json
(add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.jsx\\'" . rjsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . rjsx-mode))
(setq-default js2-mode-show-strict-warnings nil)
;; 优化mmm-mode支持editorconfig
;; 优化html/vue中的js和css的缩进
(add-hook 'mmm-js-mode-submode-hook 'editorconfig-apply)
(add-hook 'mmm-css-mode-submode 'editorconfig-apply)
;; vue
(setq-default mmm-submode-decoration-level 0 ;; 去掉mmm-mode背景色
	      vue-html-extra-indent 2 ;; vue单文件组件template里的内容首行缩进
	      )
;; 自动启动hs-minor-mode实现代码折叠
(add-hook 'prog-mode-hook 'hs-minor-mode)
;; 启用elisp自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 启用自动匹配括号,引号等
(electric-pair-mode t)
(setq electric-pair-pairs
      '((?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')))

(provide 'init-prog)
