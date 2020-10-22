(require 'cl)

;; 开关内置终端
(defun my/multi-term-dedicated-toggle-select ()
  "开关内置终端"
  (interactive)
  (multi-term-dedicated-toggle)
  (when (multi-term-dedicated-exist-p)
    (multi-term-dedicated-select)))

;; 中文与外文字体设置
(defun my/set-font (english chinese english-size chinese-size)
  "分别设置英文和中文字体达到中英文等宽"
  (when (display-graphic-p)
    (set-face-attribute 'default nil :font
			(format   "%s:pixelsize=%d"  english english-size))
    (dolist (charset '(kana han symbol cjk-misc bopomofo))
      (set-fontset-font (frame-parameter nil 'font) charset
			(font-spec :family chinese :size chinese-size)))))

(provide 'init-funcs)
