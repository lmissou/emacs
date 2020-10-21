;; lsp
(use-package lsp-mode
  :defer t
  :hook ((js2-mode json-mode rjsx-mode typescript-mode
		   css-mode html-mode web-mode vue-mode
		   c-mode c++-mode
		   go-mode
		   lua-mode
		   python-mode
		   dart-mode
		   java-mode
		   yaml-mode
		   ) . lsp)
  :config
  ;; 设置异步获取提示
  (setq lsp--document-symbols-request-async t)
  (use-package lsp-java)
  (use-package lsp-ivy)
  ;; 调试程序 dap-mode
  (use-package dap-mode)
  (use-package lsp-ui
    :hook (lsp-mode . lsp-ui-mode)
    :config
    (setq lsp-ui-peek-enable t)
    (setq lsp-ui-doc-enable nil)
    (setq lsp-ui-imenu-enable t)
    (setq lsp-ui-flycheck-enable t)
    (setq lsp-ui-sideline-enable t)
    (setq lsp-ui-sideline-ignore-duplicate t)))

(provide 'init-lsp)
