(+use-package lsp-mode)
(+use-package lsp-java)
(+use-package lsp-ivy)
(+use-package lsp-ui)
(+use-package dap-mode)

;; lsp
(setq lsp-keymap-prefix "C-; l")
(+leader-set-key "a d" 'lsp-find-definition "跳转到定义")
(+leader-set-key "a r" 'lsp-find-references "跳转到使用")
(add-hook 'js-mode-hook 'lsp)
(add-hook 'js2-mode-hook 'lsp)
(add-hook 'json-mode-hook 'lsp)
(add-hook 'rjsx-mode-hook 'lsp)
(add-hook 'typescript-mode-hook 'lsp)
(add-hook 'css-mode-hook 'lsp)
(add-hook 'html-mode-hook 'lsp)
(add-hook 'web-mode-hook 'lsp)
(add-hook 'vue-mode-hook 'lsp)
(add-hook 'c-mode-hook 'lsp)
(add-hook 'c++-mode-hook 'lsp)
(add-hook 'csharp-mode-hook 'lsp)
(add-hook 'go-mode-hook 'lsp)
(add-hook 'lua-mode-hook 'lsp)
(add-hook 'python-mode-hook 'lsp)
(add-hook 'dart-mode-hook 'lsp)
(add-hook 'java-mode-hook 'lsp)
(add-hook 'yaml-mode-hook 'lsp)
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
