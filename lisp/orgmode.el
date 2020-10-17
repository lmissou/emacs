;; org-mode配置
(setq org-bullets-bullet-list '("☰" "☷" "✿" "☭"))
(add-hook 'org-mode-hook 'org-bullets-mode)
(setq org-image-actual-width (/ (display-pixel-width) 3))
;; org-babel配置
(org-babel-do-load-languages
      'org-babel-load-languages
      '((emacs-lisp . t)
	(shell . t)
        (python . t)
        (js . t)
	(latex . t)
        ))

(provide 'orgmode)
