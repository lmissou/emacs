;; elpa config
(package-initialize)
;; set package mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(defvar my/package-contents-refreshed nil)
;;; My Use-package
(defun my/use-package (pkg)
  (if (stringp pkg)
      (progn
	(add-to-list 'load-path (concat (locate-user-emacs-file "site-lisp/") pkg))
	(require (intern pkg)))
      (progn
	(unless (package-installed-p pkg)
	  (unless my/package-contents-refreshed
	    (package-refresh-contents)
	    (setq my/package-contents-refreshed t))
	  (package-install pkg))
	(add-to-list 'package-selected-packages pkg))))

(provide 'init-elpa)
