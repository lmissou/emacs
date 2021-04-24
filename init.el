;; my emacs config init
(defvar +config-lisp-dir (locate-user-emacs-file "lisp")
  "The lisp config dir")
;; add lisp dir to load-path
(add-to-list 'load-path +config-lisp-dir)

(require 'init-pkg)
(require 'init-basic)
(require 'init-ui)
(require 'init-keys)
(require 'init-meow)
(require 'init-org)
(require 'init-tool)
(require 'init-prog)
(require 'init-lsp)
(require 'init-input)
;; (require 'init-eaf)
