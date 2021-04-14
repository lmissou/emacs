(+use-package rainbow-delimiters)
(+use-package indent-guide)
(+use-package editorconfig)
(+use-package editorconfig-generate)
(+use-package ivy)
(+use-package ivy-rich)
(+use-package counsel)
(+use-package counsel-projectile)
(+use-package swiper)
(+use-package ivy-posframe)
(+use-package projectile)
(+use-package multi-term)
(+use-package git-gutter)
(+use-package magit)
(+use-package company)
(+use-package company-box)
(+use-package yasnippet)
(+use-package yasnippet-snippets)
(+use-package flycheck)
(+use-package yaml-mode)
(+use-package markdown-mode)
(+use-package csharp-mode)
(+use-package go-mode)
(+use-package python-mode)
(+use-package lua-mode)
(+use-package dart-mode)
(+use-package lsp-dart)
(+use-package web-mode)
(+use-package emmet-mode)
(+use-package typescript-mode)
(+use-package json-mode)
;; css-in-js支持
(+use-package css-mode)
(+use-package rx)
(+use-package ov)
(+use-package "fence-edit")
(+use-package "styled")
;; vue-mode及其依赖
(+use-package ssass-mode)
(+use-package vue-html-mode)
(+use-package edit-indirect)
(+use-package mmm-mode)
(+use-package "vue-mode")
;; clojure
(+use-package clojure-mode)

;; 开关内置终端命令
(defun +multi-term-dedicated-toggle-select ()
  "开关内置终端"
  (interactive)
  (multi-term-dedicated-toggle)
  (when (multi-term-dedicated-exist-p)
    (multi-term-dedicated-select)))

;; 折叠代码
(+global-set-key "C-'" 'hs-toggle-hiding)
;; 注释代码
(+global-set-key "M-/" 'comment-or-uncomment-region)
;; 彩虹括号 rainbow-delimiters
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; 显示缩进 indent-guide
(add-hook 'after-init-hook 'indent-guide-global-mode)
;; editorconfig
(add-hook 'after-init-hook 'editorconfig-mode)
(+global-set-key "M-y" 'counsel-yank-pop)
;; buffer
(+leader-set-key "b b" 'counsel-switch-buffer "切换缓冲区")
(+leader-set-key "b d" 'kill-buffer "关闭缓冲区")
(+leader-set-key "b n" 'switch-to-next-buffer "下一个缓冲区")
(+leader-set-key "b p" 'switch-to-prev-buffer "上一个缓冲区")
;; file
(+leader-set-key "f f" 'counsel-find-file "打开文件")
(+leader-set-key "f r" 'counsel-recentf "文件历史记录")
(+leader-set-key "f s" 'save-buffer "保存文件")
(+leader-set-key "f t" 'treemacs "开启/关闭文件目录")
;; projectile
(+leader-set-key "p p" 'projectile-command-map "更多命令")
(+leader-set-key "p f" 'counsel-projectile-find-file "打开项目文件")
(+leader-set-key "p b" 'counsel-projectile-switch-to-buffer "切换项目buffer")
(+leader-set-key "p s" 'counsel-projectile-rg "在项目中搜索")
;; swiper
(+global-set-key "C-s" 'swiper)
;; counsel-M-x
(+global-set-key "M-x" 'counsel-M-x)
(+global-set-key "C-h C-f" 'counsel-describe-function "查看函数")
(+global-set-key "C-h C-v" 'counsel-describe-variable "查看变量")
(+global-set-key "C-x C-n" 'display-line-numbers-mode "开启/关闭行号")
(+global-set-key "C-x C-f" 'counsel-find-file "打开文件")
(+global-set-key "C-x b" 'counsel-switch-buffer "切换buffer")
(+global-set-key "C-x C-r" 'counsel-recentf "文件历史记录")
;; ivy-posframe浮动提示
(add-hook 'after-init-hook 'ivy-posframe-mode)
;; 项目管理 projcecilt
(add-hook 'after-init-hook 'projectile-mode)
;; projectile查找文件使用ivy
(setq projectile-completion-system 'ivy)
;; emacs内置终端 multi-term
(+global-set-key "C-~" '+multi-term-dedicated-toggle-select)
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
(+leader-set-key "s" 'company-yasnippet "代码片段")

(with-eval-after-load "csharp-mode"
  (unbind-key (kbd ",") csharp-mode-map))
;; dart flutter sdk dir设置
(defvar +flutter-sdk-dir nil)
(if (not +flutter-sdk-dir)
    (setq +flutter-sdk-dir (getenv "FLUTTER_HOME")))
(custom-set-variables
 '(lsp-dart-flutter-sdk-dir +flutter-sdk-dir))
;; web-mode
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
(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'vue-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'js-mode-hook 'emmet-mode)
;; 启用jsx
(add-hook 'js-mode-hook 'js-jsx-enable)
(setq emmet-self-closing-tag-style " /")
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . typescript-mode))
;; css-in-js支持
(setq styled-component-end (rx-to-string '(: "`")))
(setq fence-edit-blocks `((,styled-component-start ,styled-component-end)))
(add-hook 'js-mode-hook '(lambda () (+set-key js-mode-map "C-c '" 'fence-edit-code-at-point "编辑styled css")))
(add-hook 'typescript-mode-hook '(lambda () (+set-key typescript-mode-map "C-c '" 'fence-edit-code-at-point "编辑styled css")))
;; 优化mmm-mode支持editorconfig
;; 优化html/vue中的js和css的缩进
(add-hook 'mmm-js-mode-submode-hook 'editorconfig-apply)
(add-hook 'mmm-css-mode-submode-hook 'editorconfig-apply)
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
(setq emacs-lisp-mode-prettify-symbols-alist
      '(("lambda" . ?λ)
	("defun" . ?∫)))

(defun +auto-prettify-symbols ()
  "prettify-symbols-mode美化符号, 定义xx-mode-prettify-symbols-alist即可"
  (let ((prettify-alist (intern (concat (symbol-name major-mode) "-prettify-symbols-alist"))))
    (if (boundp prettify-alist)
	(progn (setq prettify-symbols-alist (symbol-value prettify-alist))
	       (prettify-symbols-mode t)))))
(add-hook 'prog-mode-hook '+auto-prettify-symbols)
(add-hook 'org-mode-hook '+auto-prettify-symbols)

(provide 'init-prog)
