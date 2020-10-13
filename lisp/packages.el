;; 需要安装的包
(defvar my/packages '(
    ;; 主题和modeline
    dashboard
    all-the-icons
    all-the-icons-dired
    all-the-icons-ivy
    doom-themes
    doom-modeline

    hungry-delete
    undo-tree
    editorconfig
    editorconfig-generate

    avy
    swiper
    counsel
    ivy-posframe;; 浮动提示
    popwin
    tabbar
    counsel-projectile
    multiple-cursors
    treemacs
    treemacs-all-the-icons
    multi-term
    which-key
    general

    dap-mode

    magit
    projectile

    ;; 代码和自动补全
    flycheck
    company
    company-box
    lsp-mode
    lsp-ivy
    lsp-ui
    yasnippet
    yasnippet-snippets
    ;; web前端
    web-mode
    emmet-mode
    ;; yaml文件支持
    yaml-mode
    ;; javascript
    json-mode
    js2-mode
    xref-js2
    rjsx-mode
    ;; typescript
    typescript-mode
    ;; vue
    ;; vue-mode
    ;; dart flutter
    dart-mode
    ;; python
    python-mode
    ;; java
    lsp-java
    ;; lua
    lua-mode
    ;; markdown
    vmd-mode))

(package-initialize)
;; set package mirrors
(setq package-archives
  '(("melpa-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ("gnu-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(setq package-selected-packages my/packages)
;; 清除无用的包
(package-autoremove)

(provide 'packages)
