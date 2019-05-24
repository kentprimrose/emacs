;;; init-02-keys --- general key settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Key settings that are applicable to all modes should appear here.

;;; Code:

;; Shortcuts
;; =====================================================================
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "M-S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "M-S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-S-C-<down>") 'shrink-window)
(global-set-key (kbd "M-S-C-<up>") 'enlarge-window)

(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "M-<right>") 'windmove-right)

(global-set-key (kbd "<s-return>") 'toggle-frame-fullscreen)
(global-set-key (kbd "<s-up>") 'scroll-down-line)
(global-set-key (kbd "<s-down>") 'scroll-up-line)
(global-set-key (kbd "<f5>") 'compile)

(defalias 'tt 'toggle-truncate-lines)
(defalias 'vl 'visual-line-mode)
(defalias 'af 'auto-fill-mode)
(auto-fill-mode -1)

(windmove-default-keybindings)

(provide 'init-02-keys)
;;; init-02-keys.el ends here
