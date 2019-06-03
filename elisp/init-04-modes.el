;;; init-04-modes --- general mode settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Mode specific settings should appear here.

;;; Code:

;; evil
;; ========================================
(use-package evil
  :demand

  :config
  (evil-mode 1)

  (evil-set-initial-state 'comint-mode   'normal)
  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-set-initial-state 'shell-mode    'insert)
  (evil-set-initial-state 'term-mode     'emacs)
  (evil-set-initial-state 'help-mode     'emacs)
  (evil-set-initial-state 'grep-mode     'emacs)

  (add-hook 'git-commit-mode-hook 'evil-insert-state)

  :custom
  (indent-tabs-mode nil)

  :config
  (use-package evil-nerd-commenter
	:bind (("M-;"   . evilnc-comment-or-uncomment-lines)
		   ("C-c l" . evilnc-quick-comment-or-uncomment-to-the-line)
		   ("C-c c" . evilnc-copy-and-comment-lines)
		   ("C-c p" . evilnc-comment-or-uncomment-paragraphs)
		   )
	))

;; dired
;; ========================================
(use-package dired
  :ensure nil
  :demand

  :custom
  (dired-use-ls-dired nil)

  :config
  (evil-set-initial-state 'dired-mode  'emacs)
  (evil-set-initial-state 'wdired-mode 'normal)

  :bind (("C-x C-j" . dired-jump)
		 :map dired-mode-map
		 ("j"      . evil-next-line)
		 ("k"      . evil-previous-line)
		 ("/"      . evil-search-forward)
		 ([s-up]   . dired-up-directory)
		 ([s-down] . dired-find-file)
		 ))

;; text modes
;; ========================================
(setq global-visual-line-mode 1)

(use-package text-mode
  :ensure nil
  :demand

  :config
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  :bind (("C-c f" . toggle-text-mode-auto-fill)
		 ("C-c v" . visual-line-mode)
		 ))

;; Control mode lines
;; ========================================
(use-package delight
  :defer t
  )

;; company
;; ========================================
(use-package company
  :defer t
  :delight

  :config
  (global-company-mode)

  :custom
  (company-dabbrev-downcase 0)
  (company-idle-delay 0)
  )

;; Ag (Silver Surfer)
;; ========================================
(use-package ag
  :defer t)

;; Magit
;; ========================================
(use-package magit
  :defer t

  :custom
  (magit-refresh-status-buffer nil)
  (smerge-command-prefix "C-c C-v")

  :config
  (evil-set-initial-state 'magit-branch-manager-mode 'emacs)
  (evil-set-initial-state 'magit-popup-mode          'emacs)
  (evil-set-initial-state 'magit-blame-mode          'emacs)
  (evil-set-initial-state 'git-commit-mode           'insert)
  (evil-set-initial-state 'git-rebase-mode           'emacs)

  :bind ("C-x C-g" . magit-status))

;; Helm
;; ========================================
(use-package helm
  :defer t
  :delight

  :config
  (helm-mode 1)

  :custom
  (helm-mode-fuzzy-match t)
  (helm-autoresize-mode t)
  (helm-ff-auto-update-initial-value t)
  (helm-completion-in-region-fuzzy-match t)
  (helm-M-x-always-save-history t)
  (helm-candidate-number-limit 100)

  :config
  (use-package helm-ag
	:defer t)

  (use-package swiper-helm
	:defer t)

  (use-package helm-rg
	:defer t)

  :bind (("M-x"     . helm-M-x)
		 ("C-x b"   . helm-mini)
		 ("C-x h"   . helm-multi-files)
		 ("C-s"     . swiper-helm)
		 ("C-h a"   . helm-apropos)
		 ("C-x C-f" . helm-find-files)
		 ("C-c r"   . helm-recentf)
		 ))

;; projectile
;; ========================================
(use-package projectile
  :defer t
  :delight

  :config
  (projectile-mode +1)

  :custom
  (projectile-global-mode t)
  (projectile-mode-line
   '(:eval
	 (if (file-remote-p default-directory)
		 " Projectile"
	   (format " Proj[%s]"
			   (projectile-project-name)))))

  :config
  (use-package helm-projectile
	:defer t
	:config (helm-projectile-on)
	:bind ("C-x p" . helm-projectile)
	))

;; elfeed
;; ========================================
(use-package elfeed
  :defer t

  :custom
  (elfeed-feeds
   '(("http://planet.emacsen.org/atom.xml" emacs emacsen)
	 ("http://batsov.com/atom.xml" emacs batsov)
	 ("https://nyoboo.com/channels/6-python-news/messages.rss" python pyweekly)
	 ("http://feeds.feedburner.com/PythonInsider" python insider)
	 ("http://planetpython.org/rss20.xml python" python planet)
	 ("http://pyfound.blogspot.com/feeds/posts/default" python pyfound)
	 ("http://pycon.blogspot.com/feeds/posts/default" python pycon)
	 ("http://www.reddit.com/r/python/.rss" python reddit)
	 ("http://www.reddit.com/r/pythontips/.rss" python reddit)
	 ))

  :config
  (evil-set-initial-state 'elfeed-search-mode 'emacs)
  (evil-set-initial-state 'elfeed-show-mode   'emacs)

  :bind ("C-x w" . elfeed))

;; flycheck
;; ========================================
(use-package flycheck
  :defer t
  :delight

  :init
  (global-flycheck-mode)

  :custom
  (flycheck-display-errors-delay .3)
  )

;; flyspell
;; ========================================
(use-package flyspell
  :defer t
  :delight

  :init
  (defun flyspell-check-next-highlighted-word ()
	"Custom function to spell check next highlighted word."
	(interactive)
	(flyspell-goto-next-error)
	(ispell-word))
  (add-hook 'text-mode-hook 'flyspell-mode)
  (add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
  (add-hook 'python-mode-hook 'flyspell-prog-mode)
  (add-hook 'js-mode-hook '-prog-mode)

  :custom
  (ispell-list-coommand "list")
  (ispell-program-name "aspell")

  :config
  (use-package helm-flyspell
	:defer t)

  :bind (("<f8>" . helm-flyspell-correct)
		 ("C-S-<f8>" . flyspell-mode)
		 ("C-M-<f8>" . flyspell-buffer)
		 ("M-<f8>" . flyspell-check-next-highlighted-word)
		 )

  :if (memq window-system '(mac ns x)))

;; vdiff
;; ========================================
(use-package vdiff
  :defer t

  :bind (:map vdiff-mode-prefix-map
			  ("C-c" . vdiff-mode-prefix-map)
			  ))

(provide 'init-04-modes)
;;; init-04-modes.el ends here
