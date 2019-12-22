;;; init-01-env --- general environment settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Environment settings that are applicable to all modes should appear here.
;; Settings should be wrapped by "window-system" conditionals to match the
;; targeted environment.

;;; Code:

(use-package auto-compile
  :ensure t
  :config
  (auto-compile-on-load-mode 1)
  (auto-compile-on-save-mode 1))

;; Nice, but makes update SLOW
;; (use-package auto-package-update
;;   :ensure t
;;   :custom
;;   (auto-package-update-interval 1)
;;   (auto-package-update-delete-old-versions t)
;;   :config
;;   (auto-package-update-maybe))

(set-keyboard-coding-system nil)

(setq
 ;; confirm-kill-emacs 'y-or-n-p
 make-backup-files nil)

(global-linum-mode t)
(column-number-mode t)
(show-paren-mode t)

;; Mac only settings
;; ========================================
(when (memq window-system '(mac ns x))
  (use-package exec-path-from-shell
	:ensure t
	:config
	(exec-path-from-shell-initialize))

  (set-face-attribute 'default nil :family "Monaco" :height 120)
  )

;; Linux (X) only settings
;; ========================================
(when (memq window-system '(x))
  )

(provide 'init-01-env)
;;; init-01-env.el ends here
