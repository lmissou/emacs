;; init emacs-application-framework
(+use-package ctable)
(+use-package deferred)
(+use-package epc)
(+use-package s)
(+use-package "eaf")

(setq eaf-config-location (+locate-tmp-file "eaf"))
(eaf-setq eaf-browser-enable-adblocker "true")
(eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
(eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
(eaf-bind-key take_photo "p" eaf-camera-keybinding)
(eaf-bind-key nil "M-q" eaf-browser-keybinding)

(provide 'init-eaf)
