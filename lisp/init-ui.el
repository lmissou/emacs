(my/use-package 'smooth-scrolling)
(my/use-package 'popwin)
(my/use-package 'nyan-mode)
(my/use-package 'dashboard)
(my/use-package 'all-the-icons)
(my/use-package 'all-the-icons-ivy)
(my/use-package 'all-the-icons-ivy-rich)
(my/use-package 'all-the-icons-dired)
(my/use-package 'doom-themes)
(my/use-package 'doom-modeline)
(my/use-package "ligature")

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
			;; (agenda . 5)
			;; (registers . 5)
			))
;; 图标显示 all-the-icons
(set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'prepend)
(set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'prepend)
(set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'prepend)
(set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'prepend)
(set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'prepend)
(set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'prepend)
;; ivy使用all-the-icons
(all-the-icons-ivy-setup)
;; ivy-rich使用all-the-icons
(add-hook 'after-init-hook '(lambda () (progn (ivy-rich-mode t)
					      (all-the-icons-ivy-rich-mode t))))
;; dired文件浏览器使用all-the-icons
(add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
;; 可在custom.el里设置my/theme变量作为主题
(load-theme my/theme t)
;; doom-modeline
(add-hook 'after-init-hook 'doom-modeline-mode)
(setq doom-modeline-height 5
      doom-modeline-bar-width 1
      doom-modeline-indent-info t
      ;; doom-modeline-setup-env-go回导致emacs卡死,原因未知,先禁用
      doom-modeline-env-enable-go nil)
;; 连字显示ligature.el
;; 需要设置英文字体为连字字体，如：
;; (my/set-font   "FiraCode Nerd Font Mono" "WenQuanYi Micro Hei" 13 16)
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
