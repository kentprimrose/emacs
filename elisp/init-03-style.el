;;; init-03-style --- general style settings

;;; Commentary:

;; This will be executed as part of Emacs initialization for all modes.
;; Style settings that are applicable to all modes should appear here.

;;; Code:

(setq
 sentence-end-double-space nil
 inhibit-splash-screen t
 initial-scratch-message nil
 use-dialog-box nil)

(setq-default
 truncate-lines t
 truncate-partial-width-windows t
 visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)
 message-elide-ellipsis "⤵"
 org-ellipsis "⤵")

(add-to-list 'default-frame-alist '(width . 84))

(fset 'yes-or-no-p 'y-or-n-p)

;; Fix annoying visible bell that "smears" middle of window
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

(use-package modus-vivendi-theme
  :ensure t
  :config
  (load-theme 'modus-vivendi))

(use-package minions
  :ensure t
  :config (minions-mode))

(use-package simple-modeline
  :ensure t
  :hook (after-init . simple-modeline-mode))

(use-package which-key
  :ensure t
  :config (which-key-mode))

(provide 'init-03-style)
;;; init-03-style.el ends here
