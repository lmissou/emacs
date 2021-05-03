(+use-package smooth-scrolling)
(+use-package popwin)
(+use-package nyan-mode)
(+use-package dashboard)
(+use-package all-the-icons)
(+use-package all-the-icons-ivy)
(+use-package all-the-icons-ivy-rich)
(+use-package all-the-icons-dired)
(+use-package doom-themes)
(+use-package doom-modeline)
(+use-package "ligature")

;; 中文与外文字体设置函数
(defun +set-font (english chinese english-size chinese-size)
  "分别设置英文和中文字体达到中英文等宽"
  (when (display-graphic-p)
    (set-face-attribute 'default nil :font
			(format   "%s:pixelsize=%d"  english english-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
			(font-spec :family chinese :size chinese-size)))))

(if (boundp '+font-cn-en)
    (+set-font (car +font-cn-en)(cadr +font-cn-en)(caddr +font-cn-en)(cadddr +font-cn-en)))
;; 启动时全屏(根据用户设置的变量+maximized决定是否全屏)
(if +maximized
    (setq initial-frame-alist '((fullscreen . maximized))))
;; 隐藏菜单栏工具栏滚动条
(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)
;; 开启鼠标和滚轮
(xterm-mouse-mode t)
(mouse-wheel-mode t)
;; 当前行高亮
(global-hl-line-mode t)
;; 状态栏显示列号
(column-number-mode t)
;; 关闭启动界面
(setq inhibit-splash-screen t)
;; 去掉scratch默认显示的文字
(setq initial-scratch-message "")
;; 启用文件历史记录
(recentf-mode t)
;; 开启行号
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
;; 平滑滚动
(add-hook 'after-init-hook 'smooth-scrolling-mode)
;; popwin
(popwin-mode t)
;; NyanCat mode
(nyan-mode t)
(nyan-start-animation)
(nyan-toggle-wavy-trail)
;; dashboard
(dashboard-setup-startup-hook)
(setq dashboard-set-file-icons t
      dashboard-set-heading-icons t
      dashboard-center-content t
      dashboard-items '((recents . 8)
			(projects . 8)
			(bookmarks . 5)
			(agenda . 5)
			;; (registers . 5)
			))
;; 图标显示 all-the-icons
(defvar +set-icons nil)
(when +set-icons
  (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'prepend))
;; ivy使用all-the-icons
(all-the-icons-ivy-setup)
;; ivy-rich使用all-the-icons
(add-hook 'after-init-hook '(lambda () (progn (ivy-rich-mode t)
					      (all-the-icons-ivy-rich-mode t))))
;; dired文件浏览器使用all-the-icons
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; 可在custom.el里设置+theme变量作为主题
(load-theme +theme t)
;; doom-modeline
(add-hook 'after-init-hook 'doom-modeline-mode)
(setq doom-modeline-height 5
      doom-modeline-bar-width 1
      doom-modeline-indent-info t
      ;; doom-modeline-setup-env-go回导致emacs卡死,原因未知,先禁用
      doom-modeline-env-enable-go nil
      doom-modeline-env-enable-python nil
      doom-modeline-env-enable-ruby nil
      doom-modeline-env-enable-perl nil
      doom-modeline-env-enable-elixir nil
      doom-modeline-env-enable-rust nil)
;; 连字显示ligature.el
;; 需要设置英文字体为连字字体，如：
;; (+set-font   "FiraCode Nerd Font Mono" "WenQuanYi Micro Hei" 13 16)
;; Enable the "www" ligature in every possible major mode
(global-ligature-mode t)
(ligature-set-ligatures 't '("www"))
;; Enable traditional ligature support in eww-mode, if the
;; `variable-pitch' face supports it
(ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
;; Enable all Cascadia Code ligatures in programming modes
(ligature-set-ligatures 'prog-mode '("|||>" "<|||" "<==>" "<!--" "####" "~~>" "***" "||=" "||>"
                                     ":::" "::=" "=:=" "===" "==>" "=!=" "=>>" "=<<" "=/=" "!=="
                                     "!!." ">=>" ">>=" ">>>" ">>-" ">->" "->>" "-->" "---" "-<<"
                                     "<~~" "<~>" "<*>" "<||" "<|>" "<$>" "<==" "<=>" "<=<" "<->"
                                     "<--" "<-<" "<<=" "<<-" "<<<" "<+>" "</>" "###" "#_(" "..<"
                                     "..." "+++" "/==" "///" "_|_" "www" "&&" "^=" "~~" "~@" "~="
                                     "~>" "~-" "**" "*>" "*/" "||" "|}" "|]" "|=" "|>" "|-" "{|"
                                     "[|" "]#" "::" ":=" ":>" ":<" "$>" "==" "=>" "!=" "!!" ">:"
                                     ">=" ">>" ">-" "-~" "-|" "->" "--" "-<" "<~" "<*" "<|" "<:"
                                     "<$" "<=" "<>" "<-" "<<" "<+" "</" "#{" "#[" "#:" "#=" "#!"
                                     "##" "#(" "#?" "#_" "%%" ".=" ".-" ".." ".?" "+>" "++" "?:"
                                     "?=" "?." "??" ";;" "/*" "/=" "/>" "__" "~~" "(*" "*)" "://"))

(provide 'init-ui)
