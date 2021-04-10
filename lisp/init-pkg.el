;; elpa config
(package-initialize)
;; set package mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(defvar +package-contents-refreshed nil)
;;; My Use-package
(defun +install-package (pkg)
  (if (stringp pkg)
      (progn
	(add-to-list 'load-path (concat (locate-user-emacs-file "site-lisp/") pkg))
	(require (intern pkg)))
      (progn
	(unless (package-installed-p pkg)
	  (unless +package-contents-refreshed
	    (package-refresh-contents)
	    (setq +package-contents-refreshed t))
	  (package-install pkg))
	(add-to-list 'package-selected-packages pkg))))
(defmacro +use-package (pkg)
  (list '+install-package (list 'quote pkg)))

(provide 'init-pkg)
