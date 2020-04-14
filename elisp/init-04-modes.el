;;; init-04-modes --- general mode settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Mode specific settings should appear here.

;;; Code:

;; evil
;; ========================================
(use-package evil
  :ensure t

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
    :ensure t

    :bind
	(("M-;"   . evilnc-comment-or-uncomment-lines)
	 ("C-M-;" . evilnc-comment-or-uncomment-paragraphs))))

;; dired
;; ========================================
(use-package dired
  :ensure nil

  :custom
  (dired-use-ls-dired nil)

  :config
  (evil-set-initial-state 'dired-mode  'emacs)
  (evil-set-initial-state 'wdired-mode 'normal)

  :bind
  (("C-x C-j" . dired-jump)
   :map dired-mode-map
   ("j"      . evil-next-line)
   ("k"      . evil-previous-line)
   ("/"      . evil-search-forward)
   ([s-up]   . dired-up-directory)
   ([s-down] . dired-find-file)))

;; text modes
;; ========================================
(setq global-visual-line-mode 1)

(use-package text-mode
  :ensure nil

  :config
  (add-hook 'text-mode-hook 'turn-on-auto-fill)

  :bind
  (("C-c f" . toggle-text-mode-auto-fill)
   ("C-c v" . visual-line-mode)))

;; Control mode lines
;; ========================================
(use-package delight
  :ensure t)

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

;; Magit
;; ========================================
(use-package magit
  :ensure t

  :custom
  (magit-refresh-status-buffer nil)
  (smerge-command-prefix "C-c C-v")

  :config
  (use-package evil-magit
    :ensure t)

  :bind ("C-x C-g" . magit-status))

;; ivy
;; ========================================
(use-package ivy
  :ensure t
  :delight
  
  :config
  (ivy-mode 1)

  :custom
  (ivy-use-virtual-buffers t)
  (ivy-count-format "(%d/%d)")

  :bind
  (("C-x b"   . ivy-switch-buffer)
   :map ivy-minibuffer-map
   ("S-SPC"   . " ")
   ("M-S-SPC" . ivy-restrict-to-matches)))

(use-package swiper
  :ensure t

  :bind (("C-s" . swiper-isearch)))

(use-package counsel
  :ensure t

  :bind
  (("M-x"     . counsel-M-x)
   ("s-x"     . counsel-M-x)
   ("C-x C-f" . counsel-find-file)
   ("M-y"     . counsel-yank-pop)

   ("C-c C-c g" . counsel-git)
   ("C-c C-c j" . counsel-git-grep)
   ("C-c C-c r" . counsel-rg)
   ("C-c C-c m" . counsel-linux-app)
   ("C-c C-c l" . counsel-locate)
   ("C-c C-c b" . counsel-bookmark)
   ("C-c C-c d" . counsel-descbinds)
   ("C-c C-c g" . counsel-git)
   ("C-c C-c o" . counsel-outline)
   ("C-c C-c t" . counsel-load-theme)
   ("C-c C-c F" . counsel-org-file)

   ("C-h a" . counsel-apropos)))

(use-package ivy-rich
  :ensure t

  :config
  (ivy-rich-mode 1))

(use-package smex  ;; for M-x memory
  :ensure t)

;; projectile
;; ========================================
(use-package projectile
  :ensure t
  :delight '(:eval (concat " " (projectile-project-name)))

  :custom
  (projectile-globally-ignored-file-suffixes
        '("#" "~" ".swp" ".o" ".so" ".exe" ".dll" ".elc" ".pyc" ".jar" "*.class"))
  (projectile-globally-ignored-directories
        '(".git" "node_modules" "__pycache__" ".vs"))
  (projectile-globally-ignored-files '("TAGS" "tags" ".DS_Store"))
  (projectile-completion-system 'ivy)

  :config
  (projectile-mode +1)

  :bind
  (:map projectile-mode-map
		("C-x p" . 'projectile-command-map)))

(use-package counsel-projectile
  :ensure t

  :config
  (counsel-projectile-mode +1))

;; elfeed
;; ========================================
(use-package elfeed
  :ensure t

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

  :config
  (evil-set-initial-state 'elfeed-search-mode 'emacs)
  (evil-set-initial-state 'elfeed-show-mode   'emacs)

  :bind ("C-x w" . elfeed))

;; flycheck
;; ========================================
(use-package flycheck
  :ensure t
  :delight

  :init
  (global-flycheck-mode)

  :custom
  (flycheck-display-errors-delay .3))

;; flyspell
;; ========================================
(use-package flyspell
  :ensure t
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
  (ispell-list-coommand "--list")
  (ispell-program-name "aspell")

  :bind
  (("<f8>" . ispell-word)
   ("C-S-<f8>" . flyspell-mode)
   ("C-M-<f8>" . flyspell-buffer)
   ("M-<f8>" . flyspell-check-next-highlighted-word))

  :if (memq window-system '(mac ns x)))

;; vdiff
;; ========================================
(use-package vdiff
  :ensure t

  :bind
  (:map vdiff-mode-prefix-map
		("C-c" . vdiff-mode-prefix-map)))

;; restclient
;; ========================================
(use-package restclient
  :ensure t
  :mode "\\.rest\\'")

(provide 'init-04-modes)
;;; init-04-modes.el ends here
