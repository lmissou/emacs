(+use-package lsp-mode)
(+use-package lsp-java)
(+use-package lsp-ivy)
(+use-package lsp-ui)
(+use-package dap-mode)

;; lsp
(setq lsp-keymap-prefix (concat +leader-key " l"))
(+leader-set-key "a d" 'lsp-find-definition "跳转到定义")
(+leader-set-key "a r" 'lsp-find-references "跳转到使用")
(dolist (hook (list
	       'js-mode-hook
	       'js2-mode-hook
	       'json-mode-hook
	       'rjsx-mode-hook
	       'typescript-mode-hook
	       'css-mode-hook
	       'html-mode-hook
	       'web-mode-hook
	       'vue-mode-hook
	       'c-mode-hook
	       'c++-mode-hook
	       'csharp-mode-hook
	       'go-mode-hook
	       'lua-mode-hook
	       'python-mode-hook
	       'dart-mode-hook
	       'java-mode-hook
	       'yaml-mode-hook
	       'clojure-mode-hook))
  (add-hook hook 'lsp))
;; 启用lsp-mode的which-key提示
(add-hook 'lsp-mdoe 'lsp-enable-which-key-integration)
;; 设置异步获取提示
(setq lsp--document-symbols-request-async t
      lsp-enable-snippet nil)
;; lsp-ui
(add-hook 'lsp-mode 'lsp-ui-mode)
(setq lsp-ui-peek-enable t
      lsp-ui-doc-enable t
      lsp-ui-imenu-enable t
      lsp-ui-flycheck-enable t
      lsp-ui-sideline-enable t
      lsp-ui-sideline-ignore-duplicate t)
;; 调试程序 dap-mode
(require 'dap-python)
(require 'dap-node)
(require 'dap-go)
(require 'dap-chrome)

(provide 'init-lsp)
