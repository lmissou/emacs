
(+use-package rime)

(defvar +rime-user-data-dir "~/.config/rime")
(setq default-input-method "rime"
      rime-cursor " "
      rime-show-candidate 'posframe
      rime-user-data-dir +rime-user-data-dir
      rime-disable-predicates '(rime-predicate-ace-window-p
				rime-predicate-hydra-p
				meow-normal-mode-p
				meow-motion-mode-p
				meow-keypad-mode-p))

(provide 'init-input)
