;;; init --- Emacs startup.

;;; Commentary:

;; This is the overall Emacs initialization.
;; Sub-initializations are started from here.

;;; Code:

(server-start)

;; Do this first to avoid annoying flash.
(tool-bar-mode -1)

;; Get the annoying custom stuff out of the way.
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)

;; Who ya gonna call?
(require 'package)
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/") t)
(add-to-list 'package-archives '("org" . "https://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melp" . "https://melpa-stable.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marm" . "https://marmalade-repo.org/packages/") t)
(package-initialize)

;; On new install, do 'package-install for "use-package", and then restart emacs.
(eval-when-compile (require 'use-package))

;; benchmark (only when benchmarking)
;; ========================================
;; (use-package benchmark-init :ensure t)

(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(load-library "init-01-env")
(load-library "init-02-keys")
(load-library "init-03-style")
(load-library "init-04-modes")
(load-library "init-05-org")
(load-library "init-06-lang")

(provide 'init)
;;; init.el ends here
