(+use-package valign)
(+use-package org-superstar)
(+use-package org-roam)
(+use-package org-roam-server)
(+use-package ob-go)

(setq org--prettify-symbols-alist '(("[ ]" . ?)
				    ("[X]" . ?)
				    ("[-]" . ?)
				    ("#+ARCHIVE:" . ?)
				    ("#+AUTHOR:" . ?)
				    ("#+CREATOR:" . ?)
				    ("#+DATE:" . ?)
				    ("#+DESCRIPTION:" . ?)
				    ("#+EMAIL:" . ?)
				    ("#+OPTIONS:" . ?)
				    ("#+SETUPFILE:" . ?)
				    ("#+TAGS:" . ?)
				    ("#+TITLE:" . ?)
				    ("#+BEGIN_SRC" . ?)
				    ("#+END_SRC" . ?)
				    ("#+BEGIN_QUOTE" . ?)
				    ("#+END_QUOTE" . ?)
				    ("#+HEADERS" . ?)
				    ("#+RESULTS:" . ?)
				    ("#+TBLFM:" . ?)
				    ("#+CAPTION:" . ?)
				    ("#+archive:" . ?)
				    ("#+author:" . ?)
				    ("#+creator:" . ?)
				    ("#+date:" . ?)
				    ("#+description:" . ?)
				    ("#+email:" . ?)
				    ("#+options:" . ?)
				    ("#+setupfile:" . ?)
				    ("#+tags:" . ?)
				    ("#+title:" . ?)
				    ("#+begin_src" . ?)
				    ("#+end_src" . ?)
				    ("#+begin_quote" . ?)
				    ("#+end_quote" . ?)
				    ("#+headers" . ?)
				    ("#+results:" . ?)
				    ("#+tblfm:" . ?)
				    ("#+caption:" . ?)))
;; valign 对齐表格
(add-hook 'org-mode-hook 'valign-mode)
;; org-superstar
(add-hook 'org-mode-hook 'org-superstar-mode)
(setq org-superstar-headline-bullets-list '("☰" "☷" "☯" "☭")
      ;; 默认不折叠标题
      org-startup-folded nil)
;; GTD (org-capture and org-agenda) config
(defvar +org-agenda-dir (locate-user-emacs-file "gtd") "gtd org files location")
(unless (file-exists-p +org-agenda-dir)
  (make-directory +org-agenda-dir))
(setq org-agenda-files '())
(add-to-list 'org-agenda-files +org-agenda-dir)
;; +org-agenda-dir files
(setq org-agenda-file-note (expand-file-name "notes.org" +org-agenda-dir))
(setq org-agenda-file-insp (expand-file-name "insps.org" +org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "tasks.org" +org-agenda-dir))
(setq org-capture-templates
      '(("t" "Task")
        ("tw" "Work Task" entry (file+headline org-agenda-file-task "Work")
         "* TODO %T - %^{Work Mainly Content} %^g\n  %?")
        ("ts" "Study Task" entry (file+headline org-agenda-file-task "Study")
         "* STUDY %T - %^{Study Mainly Content} %^g\n  %?")
        ("i" "inspiration" entry (file+headline org-agenda-file-insp "Inspiration")
         "* %^{Inspiration Mainly Content} \n  %?")
        ("n" "Note" entry (file+headline org-agenda-file-note "Note")
         "* %^{Note Mainly Content} \n  %?")))
(+leader-set-key " o c" 'org-capture)
(+leader-set-key " o a" 'org-agenda)
;; org-roam
(add-hook 'org-roam-mode-hook '(lambda ()
				 (org-roam-server-mode t)
				 (server-start)
				 (require 'org-roam-protocol)))
(setq org-roam-directory +roam-dir
      org-roam-capture-templates
      '(("d" "default" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "${slug}"
         :head "#+title: ${title}\n#+date: %T\n")))
(defun +org-roam-start ()
  (interactive)
  (org-roam-mode t)
  (org-roam))
(+leader-set-key "n l" '+org-roam-start)
(+leader-set-key "n f" 'org-roam-find-file)
(+leader-set-key "n g" 'org-roam-graph)
(+leader-set-key "n i" 'org-roam-insert)
(+leader-set-key "n I" 'org-roam-insert-immediate)
;; org-roam-server
(setq org-roam-server-host "127.0.0.1"
      org-roam-server-port 8088
      org-roam-server-authenticate nil
      org-roam-server-export-inline-images t
      org-roam-server-serve-files nil
      org-roam-server-served-file-extensions '("pdf" "mp4" "ogv")
      org-roam-server-network-poll t
      org-roam-server-network-arrows nil
      org-roam-server-network-label-truncate t
      org-roam-server-network-label-truncate-length 60
      org-roam-server-network-label-wrap-length 20)
;; org-mode图片固定大小设置
(setq org-image-actual-width (/ (display-pixel-width) 3))
;; org-babel配置
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)
   (go . t)
   (js . t)
   (css . t)
   (latex . t)
   ))
;; 解决org-babel执行js代码错误的问题
(setq org-babel-js-function-wrapper
      "console.log(function(){\n%s\n}());")

(provide 'init-org)
