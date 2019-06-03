;;; init --- Emacs startup.

;;; Commentary:

;; This is the overall Emacs initialization.
;; Sub-initializations are started from here.

;;; Code:

;; Speed up startup
(setq
 package-enable-at-startup nil
 message-log-max 16384
 gc-cons-threshold 402653184
 gc-cons-percentage 0.6
 auto-window-vscroll nil
 )
(add-hook
 'after-init-hook
 `(lambda ()
	(setq
	 gc-cons-threshold 800000
	 gc-cons-percentage 0.1
	 )
	(garbage-collect)) t)

;; Serve client processes
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

;; Bootstrap use-package
(setq-default
 ;; use-package-always-ensure t
 ;; use-package-always-defer t
 use-package-verbose nil
 use-package-expand-minimally t
 use-package-enable-imenu-support t
 )
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
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
