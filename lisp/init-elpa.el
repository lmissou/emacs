;; elpa config
(package-initialize)
;; set package mirrors
(setq package-archives
  '(("melpa-163" . "http://mirrors.163.com/elpa/melpa/")
    ("gnu-163" . "http://mirrors.163.com/elpa/gnu/")))
;;; Init Use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package-ensure)
(setq use-package-always-ensure t)
;(setq use-package-always-defer t)

(provide 'init-elpa)
