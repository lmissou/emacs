(+use-package meow)
(+use-package key-chord)

;; meow快捷键配置
(require 'meow)
(defun meow-setup ()
  (setq meow-cheatsheet-layout meow-cheatsheet-layout-qwerty)
  (meow-motion-overwrite-define-key
   '("j" . meow-next)
   '("k" . meow-prev))
  (meow-leader-define-key
   ;; SPC j/k will run the original command in MOTION state.
   '("j" . meow-motion-origin-command)
   '("k" . meow-motion-origin-command)
   ;; Use SPC (0-9) for digit arguments.
   '("1" . meow-digit-argument)
   '("2" . meow-digit-argument)
   '("3" . meow-digit-argument)
   '("4" . meow-digit-argument)
   '("5" . meow-digit-argument)
   '("6" . meow-digit-argument)
   '("7" . meow-digit-argument)
   '("8" . meow-digit-argument)
   '("9" . meow-digit-argument)
   '("0" . meow-digit-argument)
   '("a" . meow-keypad-start))
  (meow-normal-define-key
   '("0" . meow-expand-0)
   '("9" . meow-expand-9)
   '("8" . meow-expand-8)
   '("7" . meow-expand-7)
   '("6" . meow-expand-6)
   '("5" . meow-expand-5)
   '("4" . meow-expand-4)
   '("3" . meow-expand-3)
   '("2" . meow-expand-2)
   '("1" . meow-expand-1)
   '("-" . negative-argument)
   '(";" . meow-reverse)
   '("," . meow-inner-of-thing)
   '("." . meow-bounds-of-thing)
   '("[" . meow-beginning-of-thing)
   '("]" . meow-end-of-thing)
   '("a" . meow-append)
   '("A" . meow-append-at-end)
   '("b" . meow-back-word)
   '("B" . meow-back-symbol)
   '("c" . meow-change)
   '("C" . meow-change-save)
   '("d" . meow-delete)
   '("x" . meow-delete)
   '("v" . meow-right-expand)
   '("V" . meow-line)
   '("f" . meow-find)
   '("F" . meow-find-expand)
   '("g g" . meow-begin-of-buffer)
   '("G" . meow-end-of-buffer)
   '("g d" . lsp-find-definition)
   '("g r" . lsp-find-implementation)
   '("h" . meow-left)
   '("H" . meow-left-expand)
   '("i" . meow-insert)
   '("I" . meow-insert-at-begin)
   '("t" . meow-till)
   '("T" . meow-till-expand)
   '("w" . meow-mark-word)
   '("W" . meow-mark-symbol)
   '("j" . meow-next)
   '("J" . meow-next-expand)
   '("o" . meow-open-below)
   '("O" . meow-open-above)
   '("k" . meow-prev)
   '("K" . meow-prev-expand)
   '("q" . meow-quit)
   '("r" . meow-replace)
   '("R" . meow-replace-save)
   '("n" . meow-search)
   '("N" . meow-pop-search)
   '("l" . meow-right)
   '("L" . meow-right-expand)
   '("u" . undo-tree-undo)
   '("C-r" . undo-tree-redo)
   '("e" . meow-next-word)
   '("E" . meow-next-symbol)
   '("y" . kill-ring-save);; meow-save)
   '("p" . yank);; meow-yank)
   '("z" . meow-pop-selection)
   '("Z" . meow-pop-all-selection)
   '("&" . meow-query-replace)
   '("%" . meow-query-replace-regexp)
   '("/" . meow-visit)
   '(":" . meow-goto-line)
   '("<escape>" . meow-last-buffer))
  (define-key meow-normal-state-keymap (kbd "SPC g") nil))
(meow-global-mode 1)
(setq meow--keypad-both-prefix ?a
      meow-cursor-type-default '(hbar . 3)
      meow-cursor-type-normal '(hbar . 3)
      meow-cursor-type-motion '(hbar . 4)
      meow-cursor-type-insert '(bar . 2)
      meow-cursor-type-keypad 'hollow
      meow-replace-state-name-list
      '((normal . "")
	(insert . "")
	(keypad . "")
	(motion . "")))
;; meow-setup 用于自定义按键绑定，可以直接使用下文中的示例
(meow-setup)
;; 移除meow-thing默认的window-thing
(setq meow-char-thing-table (remove '(?w . window) meow-char-thing-table))
;; 自定义meow-thing
(defun +meow--bound-of-word ()
  (bounds-of-thing-at-point 'word))
(defun +meow--bound-of-doublequote ()
  (meow--bounds-of-regexp "\""))
(defun +meow--inner-of-doublequote ()
  (-when-let ((beg . end) (+meow--bound-of-doublequote))
    (cons (1+ beg) (1- end))))
(defun +meow--bound-of-singlequote ()
  (meow--bounds-of-regexp "\'"))
(defun +meow--inner-of-singlequote ()
  (-when-let ((beg . end) (+meow--bound-of-singlequote))
    (cons (1+ beg) (1- end))))
(defun +meow--bound-of-backquote ()
  (meow--bounds-of-regexp "\`"))
(defun +meow--inner-of-backquote ()
  (-when-let ((beg . end) (+meow--bound-of-backquote))
    (cons (1+ beg) (1- end))))

(meow--thing-register 'word #'+meow--bound-of-word #'+meow--bound-of-word)
(add-to-list 'meow-char-thing-table '(?w . word))
(meow--thing-register 'doublequote #'+meow--inner-of-doublequote #'+meow--bound-of-doublequote)
(add-to-list 'meow-char-thing-table '(?\" . doublequote))
(meow--thing-register 'singlequote #'+meow--inner-of-singlequote #'+meow--bound-of-singlequote)
(add-to-list 'meow-char-thing-table '(?\' . singlequote))
(meow--thing-register 'backquote #'+meow--inner-of-backquote #'+meow--bound-of-backquote)
(add-to-list 'meow-char-thing-table '(?\` . backquote))
(meow--thing-register 'backquote #'+meow--inner-of-backquote #'+meow--bound-of-backquote)
(add-to-list 'meow-char-thing-table '(?\` . backquote))

(add-to-list 'meow-char-thing-table '(?\( . round))
(add-to-list 'meow-char-thing-table '(?\[ . square))
(add-to-list 'meow-char-thing-table '(?\{ . curly))

;; 如果你需要在 NORMAL 下使用相对行号（基于 display-line-numbers-mode）
(meow-setup-line-number)
;; 如果你需要自动的 mode-line 设置（如果需要自定义见下文对 `meow-indicator' 说明）
(meow-setup-indicator)
;; 使用jk退出插入模式
(add-hook 'after-init-hook 'key-chord-mode)
(defun +key-chord-define-sequenced (keymap keys command)
  "Define Sequenced keys with key-chord"
  (if (/= 2 (length keys))
      (error "Key-chord keys must have two elements"))
  ;; Exotic chars in a string are >255 but define-key wants 128..255
  ;; for those.
  (let ((key1 (logand 255 (aref keys 0)))
        (key2 (logand 255 (aref keys 1))))
    (define-key keymap (vector 'key-chord key1 key2) command)))

(setq key-chord-two-keys-delay 0.3)
(+key-chord-define-sequenced meow-insert-state-keymap "jk" 'meow-insert-exit)

(provide 'init-meow)
