(require 'cl)
;; ;; 判断包是否已经安装
;; (defun my/packages-installed-p ()
;;   (loop for pkg in my/packages
;; 	when (not (package-installed-p pkg)) do (return nil)
;; 	finally (return t)))
;; ;; 自动安装未安装的包
;; (defun my/packages-init ()
;;   (interactive)
;;   (unless (my/packages-installed-p)
;;     (message "%s" "Refreshing package database...")
;;     (package-refresh-contents)
;;     (dolist (pkg my/packages)
;;       (when (not (package-installed-p pkg))
;; 	(package-install pkg)))))
;; 开关内置终端
(defun my/multi-term-dedicated-toggle-select () (interactive) (progn (multi-term-dedicated-toggle)
  (when (multi-term-dedicated-exist-p)
  (multi-term-dedicated-select))))

(provide 'init-funcs)
