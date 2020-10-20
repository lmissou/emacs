;; leader键
(defvar my/leader-key ",")
(global-unset-key (kbd my/leader-key))
(global-set-key (kbd (concat my/leader-key my/leader-key)) '(lambda () (interactive) (insert ",")))

;; which-key快捷键提示
(use-package which-key
  :config
  (which-key-mode t)
  (use-package general
    :config
    (general-create-definer my/leader-key-def
      :prefix my/leader-key
      :wk "leader")
    (general-define-key "C-s" 'swiper);; 搜索
    (general-define-key "M-x" 'counsel-M-x);; 执行命令
    (general-define-key "C-h C-f" '(counsel-describe-function :wk "查看函数"))
    (general-define-key "C-h C-v" '(counsel-describe-variable :wk "查看变量"))
    (general-define-key "C-x C-n" '(display-line-numbers-mode :wk "开启/关闭行号"))
    (general-define-key "C-x C-f" '(counsel-find-file :wk "打开文件"))
    (general-define-key "C-x b" '(counsel-switch-buffer :wk "切换buffer"))
    (general-define-key "C-x C-r" '(counsel-recentf :wk "文件历史记录"))
    ;; 使用ace切换窗口
    (setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))
    (general-define-key "M-o" '(ace-window :wk "切换窗口"))
    ;; 多光标支持
    (general-define-key "C-S-<mouse-1>" '(mc/add-cursor-on-click :wk "添加多光标"))

    ;;------------------------
    ;; 代码相关快捷键
    (my/leader-key-def "'" '(hs-toggle-hiding :wk "折叠/展示代码"))
    (my/leader-key-def "/" '(comment-or-uncomment-region :wk "注释代码"))
    (my/leader-key-def "s" '(company-yasnippet :wk "代码片段"))
    ;;------------------------

    ;; -----------------------
    ;; 光标跳转快捷键
    (my/leader-key-def "g" '(:wk "跳转")
      "gw" '(avy-goto-word-0 :wk "快速跳转单词")
      "gc" '(avy-goto-char-timer :wk "快速跳转到字符（搜索）")
      "gg" '(avy-goto-line :wk "快速跳转行")
      "gd" '(lsp-find-definition :wk "跳转到定义")
      "gr" '(lsp-find-references :wk "跳转到使用"))
    ;; -----------------------

    ;;------------------------
    ;; 项目相关快捷键
    (my/leader-key-def "p" '(:wk "项目")
      "pp" '(projectile-command-map :wk "更多命令")
      "ps" '(counsel-projectile-switch-project :wk "切换项目")
      "pf" '(counsel-projectile-find-file :wk "打开项目文件")
      "pb" '(counsel-projectile-switch-to-buffer :wk "切换项目buffer")
      "ps" '(counsel-projectile-grep :wk "在项目中搜索")
      "p'" '(my/multi-term-dedicated-toggle-select :wk "打开终端"))
    ;;------------------------

    ;;------------------------
    ;; 文件相关快捷键
    (my/leader-key-def "f" '(:wk "文件")
      "ff" '(counsel-find-file :wk "打开文件")
      "fr" '(counsel-recentf :wk "文件历史记录")
      "fs" '(save-buffer :wk "保存文件")
      "ft" '(treemacs :wk "开启/关闭文件目录"))
    ;;------------------------

    ;;------------------------
    ;; 窗口相关快捷键
    (my/leader-key-def "w" '(:wk "窗口")
      "wh" '(split-window-horizontally :wk "横向分割窗口")
      "wv" '(split-window-vertically :wk "纵向分割窗口")
      "wo" '(delete-other-windows :wk "关闭其他窗口")
      "wd" '(delete-window :wk "关闭窗口")
      "ww" '(ace-window :wk "切换窗口"))
    ;;------------------------

    ;;------------------------
    ;; buffer相关快捷键
    (my/leader-key-def "b" '(:wk "缓冲区")
      "bk" '(kill-buffer :wk "关闭缓冲区")
      "bb" '(counsel-switch-buffer :wk "切换缓冲区"))
    ;;------------------------
    ))

(provide 'init-keys)
