;; 彩虹括号 rainbow-delimiters
(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

;; 显示缩进 indent-guide
(use-package indent-guide
  :hook (after-init . indent-guide-global-mode))

;; editorconfig
(use-package editorconfig
  :hook (after-init . editorconfig-mode)
  :config
  (use-package editorconfig-generate))

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
(use-package multi-term)

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
  ;; 使用company-box前端
  (use-package company-box
    :hook (company-mode . company-box-mode)))

;; 代码片段 yasnippet
(use-package yasnippet
  :hook (after-init . yas-global-mode)
  :config
  ;; 自动导入yasnippet
  ;;(require 'yasnippet)
  (use-package yasnippet-snippets))

;; 代码检查 flycheck
(use-package flycheck)

;; yaml
(use-package yaml-mode)

;; markdown
(use-package markdown-mode)

;; golang
(use-package go-mode)

;; python
(use-package python-mode)

;; lua
(use-package lua-mode)

;; dart
(use-package dart-mode)

;; web前端
(use-package web-mode)
(use-package emmet-mode)

;; javascript/typescript/json
(use-package js2-mode)
(use-package typescript-mode)
(use-package json-mode)
(use-package rjsx-mode)

;; vue
(use-package vue-mode
  ;; 优化vue-mode自动缩进，使用TAB和RET不自动缩进
  :bind (:map mmm-mode-map
	      ("<tab>" . 'tab-to-tab-stop)
	      ("M-i" . 'indent-for-tab-command)
	      ("<return>" . 'electric-newline-and-maybe-indent)
	      ("C-<return>" . 'newline))
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
