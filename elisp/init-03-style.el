;;; init-03-style --- general style settings

;;; Commentary:

;; This will be executed as part of Emacs initialization for all modes.
;; Style settings that are applicable to all modes should appear here.

;;; Code:

(setq
 sentence-end-double-space nil
 inhibit-splash-screen t
 initial-scratch-message nil
 use-dialog-box nil
 )

(setq-default
 truncate-lines t
 truncate-partial-width-windows t
 visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow)
 message-elide-ellipsis "⤵"
 org-ellipsis "⤵"
 )

(add-to-list 'default-frame-alist '(width . 84))

(fset 'yes-or-no-p 'y-or-n-p)

;; Fix annoying visible bell that "smears" middle of window
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

;; (load-theme 'tango-dark t)

;; (use-package overcast-theme
;;   :ensure t
;;   :config
;;   (load-theme 'overcast t))

(use-package color-theme-sanityinc-tomorrow
  :ensure t
  :config
  (load-theme 'sanityinc-tomorrow-bright t))

;; (use-package alect-themes
;;   :ensure t
;;   :config
;;   (alect-set-color 'dark 'bg-1 "gray10")
;;   (setq alect-overriding-faces
;;         '((font-lock-comment-face ((t :foreground "gray50" :slant italic)))
;;           (mode-line ((t :background "gray30")))))
;;   (load-theme 'alect-dark t))

;; (use-package dimmer
;;   :ensure t
;;   :config
;;   (dimmer-mode)
;;   (setq dimmer-fraction 0.40))

(use-package smart-mode-line
  :ensure t
  :custom
  (sml/no-confirm-load-theme t)
  (sml/shorten-directory t)
  (sml/shorten-modes t)
  (sml/name-width 40)
  (sml/mode-width 'full)
  (rm-blacklist '(" Undo-Tree"
                  " ElDoc"
                  " company"))
  :config
  (sml/setup))

(provide 'init-03-style)
;;; init-03-style.el ends here
