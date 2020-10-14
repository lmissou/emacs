;; org-mode配置
(setq org-bullets-bullet-list '("☰" "☷" "✿" "☭"))
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-image-actual-width (/ (display-pixel-width) 3))

(provide 'orgmode)
