;; elpa config
(package-initialize)
;; set package mirrors
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
;;; My Use-package
(defun my/use-package (pkg)
  (if (stringp pkg)
      (progn
	(add-to-list 'load-path (concat (locate-user-emacs-file "site-lisp/") pkg))
	(require (intern pkg)))
      (progn
	(unless (package-installed-p pkg)
	  (package-install pkg))
	(add-to-list 'package-selected-packages pkg))))

(provide 'init-elpa)
