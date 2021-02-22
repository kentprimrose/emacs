;;; init-06-lang --- language mode settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Mode specific settings should appear here.

;;; Code:

;; golang
;; ========================================
(use-package go-mode
  :ensure t
  :defer t
  :mode "\\.go\\'"
  :interpreter "go"

  :custom
  (truncate-lines t)
  (evil-shift-width 4)
  (tab-width 4)
  (indent-tabs-mode 1)

  :config
  (add-hook 'before-save-hook 'gofmt-before-save)

  :bind (:map go-mode-map
          ("C-c C-r" . go-remove-unused-imports)
          ("C-c C-e" . go-errcheck)))

;; dockerfile-mode
;; ========================================
(use-package dockerfile-mode
  :ensure t
  :defer t
  :mode "Dockerfile")

;; terraform-mode
;; ========================================
(use-package terraform-mode
  :ensure t
  :defer t
  :mode "\\.tf\\'")

;; yaml-mode
;; ========================================
(use-package yaml-mode
  :ensure t
  :defer t
  :mode "\\.yml\\'"

  :custom
  (truncate-lines t)
  (evil-shift-width 2)
  )

;; web-mode
;; ========================================
(use-package web-mode
  :ensure t
  :defer t
  :mode "\\.html\\'"
  :mode "\\.htm\\'"
  :mode "\\.jsx\\'"

  :custom
  (web-mode-markup-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-code-indent-offset 2)

  :config
  (progn
    (defadvice web-mode-highlight-part (around tweak-jsx activate)
      "Web mode highlighting."
      (if (equal web-mode-content-type "jsx")
          (let ((web-mode-enable-part-face nil))
            ad-do-it)
        ad-do-it))))

;; python
;; ========================================
(use-package elpy
  :ensure t
  :defer t
  :init
  (elpy-enable)
  (setq elpy-rpc-virtualenv-path 'current))

(use-package pyenv-mode
  :ensure t
  :defer t
  :init
  (pyenv-mode)
  (defun ssbb-pyenv-hook ()
	"Automatically activates pyenv version if .python-version file exists."
	(f-traverse-upwards
	 (lambda (path)
	   (let ((pyenv-version-path (f-expand ".python-version" path)))
		 (if (f-exists? pyenv-version-path)
			 (pyenv-mode-set (s-trim (f-read-text pyenv-version-path 'utf-8))))))))

  (add-hook 'find-file-hook 'ssbb-pyenv-hook))

(use-package company-jedi
  :ensure t
  :defer t)

(use-package blacken
  :ensure t
  :defer t
  :config (blacken-mode 1))

;; javascript
;; ========================================
(use-package js2-mode
  :ensure t
  :defer t
  :mode "\\.js\\'"
  :interpreter "node"

  :config
  (use-package add-node-modules-path
	:ensure t
	:defer t)

  :custom
  (js2-mode-show-parse-errors nil)
  (js2-mode-show-strict-warnings nil)
  (js-indent-level 2)
  (evil-shift-width 2)
  (truncate-lines t)
  (add-node-modules-path))

;; json
;; ========================================
(use-package json-mode
  :ensure t
  :defer t
  :mode "\\.json\\'"

  :custom
  (js-indent-level 2)
  (evil-shift-width 2)
  (truncate-lines t))

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

;; php-mode
;; ========================================
(use-package php-mode
  :ensure t
  :defer t
  :mode "\\.php\\'")

(provide 'init-06-lang)
;;; init-06-lang.el ends here
