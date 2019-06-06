;;; custom --- Emacs Customizations.

;;; Commentary:

;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.

;;; Code:

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-package-update-delete-old-versions t)
 '(auto-package-update-interval 1)
 '(package-selected-packages
   (quote
	(evil-magit text-mode dired org-brain helm-config helm-rg ivy ivy-omni-org counsel flx helm-orgcard helm-flyspell helm-flyspell-correct org color-theme-sanityinc-tomorrow blacken py-yapf evil-leader delight markdown-mode virtualenvwrapper elpy magit-gitflow projectile helm benchmark-init yaml-mode web-mode vdiff use-package terraform-mode swiper-helm smex smart-mode-line overcast-theme org-journal multi-term magit json-mode js2-mode ido-completing-read+ helm-pt helm-projectile helm-org-rifle helm-ag go-mode flycheck eyebrowse exec-path-from-shell evil-nerd-commenter evil elfeed dockerfile-mode company auto-compile ag)))
 '(rm-blacklist (quote (" Undo-Tree" " ElDoc" " company")))
 '(safe-local-variable-values (quote ((buffer-read-only . true))))
 '(sml/mode-width (quote full))
 '(sml/name-width 40)
 '(sml/no-confirm-load-theme t)
 '(sml/shorten-directory t)
 '(sml/shorten-modes t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
;;; custom.el ends here
