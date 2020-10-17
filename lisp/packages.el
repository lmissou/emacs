;; 需要安装的包
(defvar my/packages '(
    ;; 主题和modeline
    dashboard
    all-the-icons
    all-the-icons-dired
    all-the-icons-ivy
    doom-themes
    doom-modeline
    ;; Nyancat mode
    nyan-mode

    hungry-delete
    undo-tree
    editorconfig
    editorconfig-generate

    avy
    swiper
    counsel
    ivy-posframe;; 浮动提示
    popwin
    counsel-projectile
    multiple-cursors
    treemacs
    treemacs-all-the-icons
    treemacs-projectile
    treemacs-magit
    multi-term
    which-key
    general

    dap-mode

    magit
    projectile
    git-gutter

    ;; 彩虹括号
    rainbow-delimiters
    ;; 显示缩进
    indent-guide

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
    vue-mode
    emmet-mode
    ;; org-mode
    org-bullets
    ;; yaml文件支持
    yaml-mode
    ;; javascript
    json-mode
    js2-mode
    xref-js2
    rjsx-mode
    ;; typescript
    typescript-mode
    ;; dart flutter
    dart-mode
    ;; python
    python-mode
    ;; java
    lsp-java
    ;; lua
    lua-mode
    ;; golang
    go-mode
    ;; markdown
    markdown-mode
    ))

(package-initialize)
;; set package mirrors
(setq package-archives
  '(("melpa-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
  ("gnu-tsinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")))
(setq package-selected-packages my/packages)
;; 清除无用的包
(package-autoremove)

(provide 'packages)
