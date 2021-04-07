(my/use-package 'org-bullets)
(my/use-package 'org-roam)
(my/use-package 'org-roam-server)
(my/use-package 'ob-go)

;; org-bullets
(add-hook 'org-mode-hook '(lambda () (progn (org-bullets-mode t) (prettify-symbols-mode t))))
(custom-set-variables '(prettify-symbols-alist '(("[ ]" . "")
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
						 ("#+TBLFM:" . "")
						 ("#+CAPTION:" . "")
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
						 ("#+results:" . "")
						 ("#+tblfm:" . "")
						 ("#+caption:" . ""))))
;; 默认不折叠标题
(setq org-bullets-bullet-list '("☰" "☷" "☯" "☭")
      org-startup-folded nil)
;; GTD (org-capture and org-agenda) config
(defvar my/org-agenda-dir (locate-user-emacs-file "gtd") "gtd org files location")
(unless (file-exists-p my/org-agenda-dir)
  (make-directory my/org-agenda-dir))
(setq org-agenda-files '())
(add-to-list 'org-agenda-files my/org-agenda-dir)
;; my/org-agenda-dir files
(setq org-agenda-file-note (expand-file-name "notes.org" my/org-agenda-dir))
(setq org-agenda-file-insp (expand-file-name "insps.org" my/org-agenda-dir))
(setq org-agenda-file-task (expand-file-name "tasks.org" my/org-agenda-dir))
(setq org-capture-templates
      '(("t" "Task")
        ("tw" "Work Task" entry (file+headline org-agenda-file-task "Work")
         "* TODO %T - %^{Work Mainly Content} %^g\n  %?" :clock-in t :clock-keep t)
        ("ts" "Study Task" entry (file+headline org-agenda-file-task "Study")
         "* STUDY %T - %^{Study Mainly Content} %^g\n  %?" :clock-in t :clock-keep t)
        ("i" "inspiration" entry (file+headline org-agenda-file-insp "Inspiration")
         "* %^{Inspiration Mainly Content} \n  %?")
        ("n" "Note" entry (file+headline org-agenda-file-note "Note")
         "* %^{Note Mainly Content} \n  %?")))
(define-key global-map (kbd (concat my/leader-key " o c")) 'org-capture)
(define-key global-map (kbd (concat my/leader-key " o a")) 'org-agenda)
;; org-roam
(add-hook 'after-init-hook 'org-roam-mode)
(setq org-roam-directory my/roam-dir
      org-roam-capture-templates
      '(("d" "default" plain (function org-roam-capture--get-point)
         "%?"
         :file-name "${slug}"
         :head "#+title: ${title}\n#+date: %T\n")))
(define-key global-map (kbd "C-; n l") 'org-roam)
(define-key global-map (kbd "C-; n f") 'org-roam-find-file)
(define-key global-map (kbd "C-; n g") 'org-roam-graph)
(define-key global-map (kbd "C-; n i") 'org-roam-insert)
(define-key global-map (kbd "C-; n I") 'org-roam-insert-immediate)
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
(server-start)
(org-roam-server-mode t)
(require 'org-roam-protocol)
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
