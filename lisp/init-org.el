;; org-bullets
(use-package org-bullets
  :hook
  (org-mode . org-bullets-mode)
  :config
  (setq org-bullets-bullet-list '("☰" "☷" "✿" "☭")))

;; org-mode图片固定大小设置
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

(provide 'init-org)
