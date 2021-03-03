;; 启用文件历史记录
(recentf-mode t)
;; 开启行号
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'text-mode-hook 'display-line-numbers-mode)

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
                                       "?=" "?." "??" ";;" "/*" "/=" "/>" "//" "__" "~~" "(*" "*)"
                                       "\\" "://"))
  ;; Enables ligature checks globally in all buffers. You can also do it
  ;; per mode with `ligature-mode'.
  (global-ligature-mode t))

;; 图标显示 all-the-icons
(use-package all-the-icons
  :bind (("C-' C-i" . all-the-icons-insert)))

;; ivy使用all-the-icons
(use-package all-the-icons-ivy
  :after all-the-icons ivy
  :config
  (all-the-icons-ivy-setup))

;; dired文件浏览器使用all-the-icons
(use-package all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

;; 主题doom-themes
(use-package doom-themes)
;; 可在custom.el里设置my/theme变量作为主题，如果没有设置则使用doom-dracula主题
(if (not (boundp 'my/theme))
    (setq my/theme 'doom-one))
(load-theme my/theme t)

;; doom-mode-line
(use-package doom-modeline
  :config
  (setq doom-modeline-height 5)
  (setq doom-modeline-bar-width 1)
  (doom-modeline-init))

(provide 'init-ui)
