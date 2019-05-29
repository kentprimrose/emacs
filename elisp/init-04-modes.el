;;; init-04-modes --- general mode settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Mode specific settings should appear here.

;;; Code:

;; Control mode lines
;; ========================================
(use-package delight
  :ensure t)

;; Ignore case everywhere
;; ========================================
(setq completion-ignore-case t)

;; company
;; ========================================
(use-package company
  :ensure t
  :delight

  :config
  (global-company-mode)

  :custom
  (company-dabbrev-downcase 0)
  (company-idle-delay 0))

;; flycheck
;; ========================================
(use-package flycheck
  :ensure t
  :delight
  :defer 2

  :init
  (global-flycheck-mode)

  :custom
  (flycheck-display-errors-delay .3))

;; evil
;; ========================================
(use-package evil
  :ensure t

  :config
  (evil-set-initial-state 'inferior-emacs-lisp-mode 'emacs)
  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-set-initial-state 'nrepl-mode 'insert)
  (evil-set-initial-state 'pylookup-mode 'emacs)
  (evil-set-initial-state 'comint-mode 'normal)
  (evil-set-initial-state 'shell-mode 'insert)
  (evil-set-initial-state 'git-rebase-mode 'emacs)
  (evil-set-initial-state 'term-mode 'emacs)
  (evil-set-initial-state 'help-mode 'emacs)
  (evil-set-initial-state 'grep-mode 'emacs)
  (evil-set-initial-state 'bc-menu-mode 'emacs)
  (evil-set-initial-state 'magit-branch-manager-mode 'emacs)
  (evil-set-initial-state 'magit-popup-mode 'emacs)
  (evil-set-initial-state 'magit-blame-mode 'emacs)
  (evil-set-initial-state 'rdictcc-buffer-mode 'emacs)
  (evil-set-initial-state 'dired-mode 'emacs)
  (evil-set-initial-state 'wdired-mode 'normal)
  (evil-set-initial-state 'elfeed-search-mode 'emacs)
  (evil-set-initial-state 'elfeed-show-mode 'emacs)
  (evil-set-initial-state 'paradox-menu-mode 'emacs)
  (evil-set-initial-state 'git-commit-mode 'insert)
  (evil-set-initial-state 'org-journal-mode 'insert)
  (evil-set-initial-state 'org-capture-mode 'insert)

  (evil-mode 1)

  :custom
  (indent-tabs-mode nil)
  (evil-want-C-i-jump nil ) ;; Keep tab for org-mode

  :init
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  (use-package evil-nerd-commenter
	:ensure t

	:init
	(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
	(global-set-key (kbd "C-c l") 'evilnc-quick-comment-or-uncomment-to-the-line)
	(global-set-key (kbd "C-c c") 'evilnc-copy-and-comment-lines)
	(global-set-key (kbd "C-c p") 'evilnc-comment-or-uncomment-paragraphs)

	;; Vim key bindings
	(use-package evil-leader
	  :ensure t

	  :init
	  (global-evil-leader-mode)
	  (evil-leader/set-key
		"ci" 'evilnc-comment-or-uncomment-lines
		"cl" 'evilnc-quick-comment-or-uncomment-to-the-line
		"ll" 'evilnc-quick-comment-or-uncomment-to-the-line
		"cc" 'evilnc-copy-and-comment-lines
		"cp" 'evilnc-comment-or-uncomment-paragraphs
		"cr" 'comment-or-uncomment-region
		"cv" 'evilnc-toggle-invert-comment-line-by-line
		"."  'evilnc-copy-and-comment-operator
		"\\" 'evilnc-comment-operator)))) ; if you prefer backslash key

;; dired
;; ========================================
(use-package dired
  :custom
  (dired-use-ls-dired nil)

  :bind (("C-x C-j" . dired-jump)
		 :map dired-mode-map
		 ("j" . evil-next-line)
		 ("k" . evil-previous-line)
		 ("/" . evil-search-forward)
		 ([s-up] . dired-up-directory)
		 ([s-down] . dired-find-file)))

;; text modes
;; ========================================
(setq global-visual-line-mode 1)
(use-package text-mode
  :init
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  :bind (("C-c f" . toggle-text-mode-auto-fill)
		 ("C-c v" . visual-line-mode)))

;; Ag (Silver Surfer)
;; ========================================
(use-package ag
  :ensure t
  :defer t)

;; Magit
;; ========================================
(use-package magit
  :ensure t
  :defer t

  :custom
  (magit-refresh-status-buffer nil)
  (smerge-command-prefix "C-c C-v")

  :bind ("C-x C-g" . magit-status))

;; Helm
;; ========================================
(use-package helm
  :ensure t
  :defer t
  :delight

  :custom
  (helm-mode-fuzzy-match t)
  (helm-ff-auto-update-initial-value t)
  (helm-completion-in-region-fuzzy-match t)
  (helm-candidate-number-limit 100)

  :config
  (helm-mode 1)

  (use-package helm-ag
	:ensure t
	:defer t)

  (use-package swiper-helm
	:ensure t
	:defer t)

  (use-package helm-rg
	:ensure t
	:defer t)

  :bind (("M-x"     . helm-M-x)
		 ("C-s"     . swiper-helm)
		 ("C-h a"   . helm-apropos)
		 ("C-x C-f" . helm-find-files)
		 ("C-c r"   . helm-recentf)
		 ))

;; projectile
;; ========================================
(use-package projectile
  :ensure t
  :delight

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
	:ensure t
	:config (helm-projectile-on)))

;; elfeed
;; ========================================
(use-package elfeed
  :ensure t
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
	 ("http://www.reddit.com/r/pythontips/.rss" python reddit)))

  :bind ("C-x w" . elfeed))

;; flyspell
;; ========================================
(use-package flyspell
  :ensure t
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
	:ensure t
	:defer t)

  :bind (("<f8>" . helm-flyspell-correct)
		 ("C-S-<f8>" . flyspell-mode)
		 ("C-M-<f8>" . flyspell-buffer)
		 ("M-<f8>" . flyspell-check-next-highlighted-word))

  :if (memq window-system '(mac ns x)))

;; multi-term
;; ========================================
(use-package multi-term
  :ensure t
  :defer t

  :custom
  (multi-term-program "/bin/zsh"))

;; vdiff
;; ========================================
(use-package vdiff
  :ensure t
  :defer t

  :bind (:map vdiff-mode-prefix-map
			  ("C-c" . vdiff-mode-prefix-map)))

;; markdown
;; ========================================
(use-package markdown-mode
  :ensure t
  :defer t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
		 ("\\.md\\'" . markdown-mode)
		 ("\\.markdown\\'" . markdown-mode))

  :custom
  (markdown-command "multimarkdown"))

(provide 'init-04-modes)
;;; init-04-modes.el ends here
