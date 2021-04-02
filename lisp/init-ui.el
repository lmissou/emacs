;; 启用文件历史记录
(recentf-mode t)
;; 开启行号
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)
;; 平滑滚动
(use-package smooth-scrolling
  :hook (after-init . smooth-scrolling-mode))
;; popwin
(use-package popwin
  :config
  (popwin-mode t))

;; NyanCat mode
(use-package nyan-mode
  :config
  (nyan-mode t)
  (nyan-start-animation)
  (nyan-toggle-wavy-trail))

;; dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-set-file-icons t
	dashboard-set-heading-icons t
	dashboard-center-content t
	dashboard-items '(
			  (recents . 8)
			  (projects . 8)
			  (bookmarks . 5)
			  ;; (agenda . 5)
			  ;; (registers . 5)
			  )))

;; 连字显示ligature.el
;; 需要设置英文字体为连字字体，如：
;; (my/set-font   "FiraCode Nerd Font Mono" "WenQuanYi Micro Hei" 13 16)
(use-package ligature
  :load-path "site-lisp/ligature"
  :config
  ;; Enable the "www" ligature in every possible major mode
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
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; 图标显示 all-the-icons
(use-package all-the-icons
  :config
  (set-fontset-font t 'unicode (font-spec :family "file-icons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "github-octicons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "Weather Icons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "all-the-icons") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "FontAwesome") nil 'prepend)
  (set-fontset-font t 'unicode (font-spec :family "Material Icons") nil 'prepend))

;; ivy使用all-the-icons
(use-package all-the-icons-ivy
  :after all-the-icons ivy
  :config
  (all-the-icons-ivy-setup))

;; ivy-rich使用all-the-icons
(use-package all-the-icons-ivy-rich
  :after all-the-icons ivy-rich
  :hook (after-init . (lambda () (progn (ivy-rich-mode t)
					(all-the-icons-ivy-rich-mode t)))))

;; dired文件浏览器使用all-the-icons
(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

;; 主题doom-themes
(use-package doom-themes)
;; 可在custom.el里设置my/theme变量作为主题，如果没有设置则使用doom-dracula主题
(load-theme my/theme t)

;; doom-modeline
(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :config
  (setq doom-modeline-height 5
	doom-modeline-bar-width 1
	doom-modeline-indent-info t))

(provide 'init-ui)
