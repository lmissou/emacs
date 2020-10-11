
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
(add-hook 'prog-mode-hook 'lsp)

(provide 'lsp)
