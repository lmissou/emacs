;; org-bullets
(use-package org-bullets
  :hook
  (org-mode . (lambda () (progn (org-bullets-mode t) (prettify-symbols-mode t))))
  :custom
  (prettify-symbols-alist '(("[ ]" . "")
			    ("[X]" . "")
			    ("[-]" . "")
			    ("#+ARCHIVE:" . "")
			    ("#+AUTHOR:" . "")
			    ("#+CREATOR:" . "")
			    ("#+DATE:" . "")
			    ("#+DESCRIPTION:" . "")
			    ("#+EMAIL:" . "")
			    ("#+OPTIONS:" . "")
			    ("#+SETUPFILE:" . "")
			    ("#+TAGS:" . "")
			    ("#+TITLE:" . "")
			    ("#+BEGIN_SRC" . "")
                            ("#+END_SRC" . "")
			    ("#+BEGIN_QUOTE" . "")
			    ("#+END_QUOTE" . "")
			    ("#+HEADERS" . "")
			    ("#+RESULTS:" . "")
			    ("#+archive:" . "")
			    ("#+author:" . "")
			    ("#+creator:" . "")
			    ("#+date:" . "")
			    ("#+description:" . "")
			    ("#+email:" . "")
			    ("#+options:" . "")
			    ("#+setupfile:" . "")
			    ("#+tags:" . "")
			    ("#+title:" . "")
			    ("#+begin_src" . "")
                            ("#+end_src" . "")
			    ("#+begin_quote" . "")
			    ("#+end_quote" . "")
			    ("#+headers" . "")
			    ("#+results:" . "")))
  :config
  (setq org-bullets-bullet-list '("☰" "☷" "☯" "☭")))



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
