(defvar config-eaf-dir (expand-file-name "site-lisp/emacs-application-framework" config-dir)
  "The eaf config dir")
;; add eaf dir to load-path
(add-to-list 'load-path config-eaf-dir)
(require 'eaf)

(provide 'eaf-config)
