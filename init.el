;; my emacs config init

(defvar config-dir (file-name-directory load-file-name)
  "The config dir of the Emacs.")
(defvar config-lisp-dir (expand-file-name "lisp" config-dir)
  "The lisp config dir")
;; add lisp dir to load-path
(add-to-list 'load-path config-lisp-dir)

(require 'packages)
(require 'funcs)
(require 'basic)
(require 'ui)
(require 'keys)
(require 'lang)
(require 'lsp)
