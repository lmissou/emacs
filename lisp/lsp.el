
;; 开启lsp-ui
(lsp-ui-mode t)
;; 自动导入yasnippet
(require 'yasnippet)
;; 设置异步获取提示
(setq lsp--document-symbols-request-async t)
;; lsp优化设置
(setq lsp-ui-peek-enable t)
(setq lsp-ui-doc-enable nil)
(setq lsp-ui-imenu-enable t)
(setq lsp-ui-flycheck-enable t)
(setq lsp-ui-sideline-enable t)
(setq lsp-ui-sideline-ignore-duplicate t)
;; 开启lsp
(general-add-hook
 '(js2-mode-hook json-mode-hook css-mode-hook rjsx-mode-hook typescript-mode-hook html-mode-hook web-mode-hook vue-mode-hook
		 python-mode-hook
		 dart-mode-hook
		 java-mode-hook
		 yaml-mode-hook
		 ) 'lsp)

(provide 'lsp)
