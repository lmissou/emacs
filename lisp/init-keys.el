(+use-package which-key)

(defvar +already-init nil)

(setq +key-bind-list '())

(defun +set-key (map key cmd &optional wk)
  (if +already-init
      (define-key map (kbd key) cmd)
    (if wk
	(which-key-add-keymap-based-replacements map key wk))
    (add-to-list '+key-bind-list (list map key cmd wk))))

(defun +global-set-key (key cmd &optional wk)
  (+set-key global-map key cmd wk))

(defun +normal-set-key (key cmd &optional wk)
  (+set-key meow-normal-state-keymap key cmd wk))

(defun +leader-set-key (key cmd &optional wk)
  (+set-key global-map (concat +leader-key " " key) cmd wk)
  (+set-key meow-leader-keymap key cmd wk))

(defun +define-key ()
  (setq +already-init t)
  (dolist (key-bind +key-bind-list)
    (progn
      (let ((map (car key-bind))
	    (key (cadr key-bind))
	    (cmd (caddr key-bind))
	    (wk (cadddr key-bind)))
	;;(message global-map)
	(define-key map (kbd key) cmd)
	(if wk
	    (which-key-add-keymap-based-replacements map key wk))))))
(add-hook 'after-init-hook '+define-key)
;; which-key快捷键提示
(which-key-mode t)
(which-key-setup-minibuffer)
;; 上下滚动一行
(+global-set-key "M-n" 'scroll-up-line)
(+global-set-key "M-p" 'scroll-down-line)

(provide 'init-keys)
