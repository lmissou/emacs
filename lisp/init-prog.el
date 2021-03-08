;; 彩虹括号 rainbow-delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; 显示缩进 indent-guide
(use-package indent-guide
  :hook (after-init . indent-guide-global-mode))

;; editorconfig
(use-package editorconfig
  :hook (after-init . editorconfig-mode))

(use-package editorconfig-generate
  :after editorconfig)

;; ivy
(use-package ivy)

(use-package counsel)

(use-package counsel-projectile)

;; 优化搜索
(use-package swiper)

;; ivy-posframe浮动提示
(use-package ivy-posframe
  :after ivy
  :hook (after-init . ivy-posframe-mode)
  :config
  ;; 设置浮动提示在中心显示
  (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
  (setq ivy-posframe-parameters
	'((left-fringe . 8)
	  (right-fringe . 8))))

;; 项目管理 projcecilt
(use-package projectile
  :hook (after-init . projectile-mode)
  :config
  ;; projectile查找文件使用ivy
  (setq projectile-completion-system 'ivy))

;; emacs内置终端 multi-term
(use-package multi-term
  :bind ("C-~" . my/multi-term-dedicated-toggle-select))

;; 显示git文件变化（git-gutter）
(use-package git-gutter
  :hook (after-init . global-git-gutter-mode))

;; magit
(use-package magit)

;; 自动补全 company
(use-package company
  :defer t
  ;; company选项选择优化
  :bind (:map company-active-map
	      ("M-p" . nil)
	      ("M-n" . nil)
	      ("C-n" . 'company-select-next)
	      ("C-p" . 'company-select-previous))
  :hook (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1);; 输入多少个字开始提示 
  (setq company-idle-delay 0.1);; 提示延迟时间
  )
;; 使用company-box前端
(use-package company-box
  :after company
  :hook (company-mode . company-box-mode))

;; 代码片段 yasnippet
(use-package yasnippet
  :hook (after-init . yas-global-mode))
(use-package yasnippet-snippets
  :after yasnippet)

;; 代码检查 flycheck
(use-package flycheck)

;; yaml
(use-package yaml-mode)

;; markdown
(use-package markdown-mode)

;; c# unity3d
(use-package csharp-mode
  :config
  (unbind-key (kbd ",") csharp-mode-map))

;; golang
(use-package go-mode)

;; python
(use-package python-mode)

;; lua
(use-package lua-mode)

;; dart
(use-package dart-mode)

;; web前端
(use-package web-mode
  :mode "\\.html?\\'"
  :config
  (setq-default web-mode-markup-indent-offset 2
		web-mode-script-padding 2
		web-mode-style-padding 2
		web-mode-css-indent-offset 2
		web-mode-code-indent-offset 2
		web-mode-enable-auto-closing t
		web-mode-enable-auto-pairing t
		web-mode-enable-css-colorization t))
(use-package emmet-mode
  :after web-mode
  :hook ((web-mode vue-mode css-mode js-mode js2-mode rjsx-mode) . (lambda () (emmet-mode t)))
  :config
  (setq emmet-self-closing-tag-style " /"))

;; javascript/typescript/json
(use-package typescript-mode)
(use-package json-mode)
(use-package rjsx-mode
  :mode ("\\.js\\'" "\\.jsx\\'" "\\.tsx\\'")
  :config (setq-default js2-mode-show-strict-warnings nil))

;; 优化mmm-mode支持editorconfig
(use-package mmm-mode
  ;; 优化html/vue中的js和css的缩进
  :hook ((mmm-js-mode-submode . editorconfig-apply)
	 (mmm-css-mode-submode . editorconfig-apply)))

;; vue
(use-package vue-mode
  :config
  ;; 去掉mmm-mode背景色
  (setq mmm-submode-decoration-level 0))

;; 启用elisp自动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;; 启用自动匹配括号,引号等
(electric-pair-mode t)
(setq electric-pair-pairs
  '((?\" . ?\")
	(?\{ . ?\})
	(?\' . ?\')))

(provide 'init-prog)
