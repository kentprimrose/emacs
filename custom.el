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
 '(add-node-modules-path nil t)
 '(auto-package-update-delete-old-versions t)
 '(auto-package-update-interval 4)
 '(company-dabbrev-downcase 0 t)
 '(company-idle-delay 0 t)
 '(diary-file "~/org/diary")
 '(dired-use-ls-dired nil)
 '(elfeed-feeds
   (quote
	(("http://planet.emacsen.org/atom.xml" emacs emacsen)
	 ("http://batsov.com/atom.xml" emacs batsov)
	 ("https://nyoboo.com/channels/6-python-news/messages.rss" python pyweekly)
	 ("http://feeds.feedburner.com/PythonInsider" python insider)
	 ("http://planetpython.org/rss20.xml python" python planet)
	 ("http://pyfound.blogspot.com/feeds/posts/default" python pyfound)
	 ("http://pycon.blogspot.com/feeds/posts/default" python pycon)
	 ("http://www.reddit.com/r/python/.rss" python reddit)
	 ("http://www.reddit.com/r/pythontips/.rss" python reddit))) t)
 '(evil-shift-width 2)
 '(evil-want-C-i-jump nil)
 '(flycheck-display-errors-delay 0.3)
 '(helm-M-x-always-save-history t)
 '(helm-autoresize-mode t)
 '(helm-candidate-number-limit 100)
 '(helm-completion-in-region-fuzzy-match t t)
 '(helm-ff-auto-update-initial-value t)
 '(helm-mode-fuzzy-match t)
 '(indent-tabs-mode 1)
 '(ispell-list-coommand "--list" t)
 '(ispell-program-name "aspell")
 '(js-indent-level 2 t)
 '(js2-mode-show-parse-errors nil t)
 '(js2-mode-show-strict-warnings nil t)
 '(magit-refresh-status-buffer nil t)
 '(markdown-command "multimarkdown" t)
 '(org-M-RET-may-split-line (quote ((default))))
 '(org-agenda-compact-blocks t)
 '(org-agenda-custom-commands
   (quote
	(("g" . "GTD contexts")
	 ("gw" "Work" tags-todo "@wrk"
	  ((org-agenda-overriding-header "Work:")))
	 ("gh" "Home" tags-todo "@hom"
	  ((org-agenda-overriding-header "Home:")))
	 ("go" "Out" tags-todo "@out"
	  ((org-agenda-overriding-header "Out:")))
	 ("gn" "Internet" tags-todo "@net"
	  ((org-agenda-overriding-header "Internet:")))
	 ("gc" "Computer" tags-todo "@cmp"
	  ((org-agenda-overriding-header "Computer:")))
	 ("gp" "Phone" tags-todo "@pho"
	  ((org-agenda-overriding-header "Phone:")))
	 ("gm" "Email" tags-todo "@eml"
	  ((org-agenda-overriding-header "Email:")))
	 ("gd" "Delegated" tags-todo "@del"
	  ((org-agenda-overriding-header "Delegated:")))
	 ("gj" "Projects" tags-todo "PROJ"
	  ((org-agenda-overriding-header "Projects:")))
	 ("gi" "Idea" tags "IDEA+LEVEL=2"
	  ((org-agenda-overriding-header "Idea:")))
	 ("ga" "All contexts"
	  ((tags-todo "@wrk"
				  ((org-agenda-overriding-header "Work:")))
	   (tags-todo "@hom"
				  ((org-agenda-overriding-header "Home:")))
	   (tags-todo "@out"
				  ((org-agenda-overriding-header "Out:")))
	   (tags-todo "@net"
				  ((org-agenda-overriding-header "Internet:")))
	   (tags-todo "@cmp"
				  ((org-agenda-overriding-header "Computer:")))
	   (tags-todo "@pho"
				  ((org-agenda-overriding-header "Phone:")))
	   (tags-todo "@eml"
				  ((org-agenda-overriding-header "Email:")))
	   (tags-todo "@del"
				  ((org-agenda-overriding-header "Delegated:")))
	   (tags-todo "PROJ"
				  ((org-agenda-overriding-header "Projects:")))
	   (tags "IDEA+LEVEL=2"
			 ((org-agenda-overriding-header "Idea:")))))
	 ("d" "Daily Agenda"
	  ((agenda ""
			   ((org-agenda-span
				 (quote day))
				(org-agenda-ndays 1)
				(org-agenda-start-on-weekday nil)
				(org-agenda-start-day "+0d")
				(org-agenda-todo-ignore-deadlines nil)
				(org-deadline-warning-days 7)
				(org-agenda-skip-deadline-if-done t)
				(org-agenda-use-time-grid t)
				(org-use-tag-inheritance t)))
	   (tags-todo "-PROJ-STYLE=\"habit\"-PRIORITY=\"A\"-PRIORITY=\"B\"-PRIORITY=\"C\"/!+NEXT|+TODO|+WAIT"
				  ((org-agenda-overriding-header "Open Tasks: =======================================================")
				   (org-use-tag-inheritance t)))
	   (tags-todo "PRIORITY=\"A\""
				  ((org-agenda-overriding-header "Top Priority Tasks: ===============================================")))
	   (tags-todo "PRIORITY=\"B\""
				  ((org-agenda-overriding-header "Lower Priority Tasks: =============================================")))
	   (tags-todo "PROJ"
				  ((org-agenda-overriding-header "Projects: =========================================================")
				   (org-use-tag-inheritance t)))))
	 ("h" "Habits"
	  ((tags "STYLE=\"habit\""
			 ((org-agenda-overriding-header "Habits: ===========================================================")))))
	 ("r" . "Review")
	 ("rw" "Weekly Review"
	  ((agenda ""
			   ((org-agenda-overriding-header "Agenda:")
				(org-agenda-span
				 (quote week))
				(org-agenda-start-on-weekday 0)
				(org-agenda-todo-ignore-deadlines nil)
				(org-deadline-warning-days 7)
				(org-use-tag-inheritance t)))))
	 ("rm" "Monthly Review"
	  ((agenda ""
			   ((org-agenda-overriding-header "Agenda:")
				(org-agenda-span
				 (quote month))
				(org-agenda-include-diary nil)
				(org-agenda-todo-ignore-deadlines nil)
				(org-deadline-warning-days 28)
				(org-use-tag-inheritance t)))))
	 ("rr" "Require attention"
	  ((tags-todo "-@wrk-@hom-@out-@net-@cmp-@pho-@eml-@del"
				  ((org-agenda-overriding-header "Context:")
				   (org-use-tag-inheritance t)))
	   (tags "REFILE+LEVEL>1"
			 ((org-agenda-overriding-header "Refile:")
			  (org-use-tag-inheritance t)))
	   (stuck ""
			  ((org-agenda-overriding-header "Stuck:")
			   (org-use-tag-inheritance t)))
	   (tags
		(concat "-PROJ+TODO={DONE\\|CNCL}" "|" "+PROJ+TODO={DONE\\|CNCL}+LEVEL<=2")
		((org-agenda-overriding-header "Archive:")))))
	 ("p" "Planning"
	  ((tags-todo "-PROJ-STYLE=\"habit\"-PRIORITY=\"A\"-PRIORITY=\"B\"-PRIORITY=\"C\"/!+NEXT|+TODO|+WAIT"
				  ((org-agenda-overriding-header "Open Tasks: =======================================================")))
	   (tags "-ARCHIVE+PROJ+LEVEL=2"
			 ((org-agenda-overriding-header "Active Projects: ==================================================")
			  (org-use-tag-inheritance t)))
	   (tags-todo "PRIORITY=\"A\""
				  ((org-agenda-overriding-header "Top Priority Tasks: ===============================================")))
	   (tags-todo "PRIORITY=\"B\""
				  ((org-agenda-overriding-header "Lower Priority Tasks: =============================================")))
	   (tags-todo "PRIORITY=\"C\""
				  ((org-agenda-overriding-header "Low Priority Tasks: ===============================================")))
	   (tags "IDEA+LEVEL=2-TODO={DONE}-TODO={CNCL}"
			 ((org-agenda-overriding-header "Someday/Maybe: ====================================================")
			  (org-use-tag-inheritance t)))
	   (tags "STYLE=\"habit\""
			 ((org-agenda-overriding-header "Habits: ===========================================================")))))
	 ("o" . "Old Reports")
	 ("od" "Daily Review"
	  ((agenda ""
			   ((org-agenda-overriding-header "Due:")
				(org-agenda-entry-types
				 (quote
				  (:scheduled :deadline :timestamp :sexp)))
				(org-agenda-ndays 1)
				(org-deadline-warning-days 7)
				(org-agenda-skip-deadline-if-done t)
				(org-use-tag-inheritance t)))
	   (stuck ""
			  ((org-agenda-overriding-header "Stuck:")
			   (org-use-tag-inheritance t)))
	   (tags "IDEA+LEVEL=2-TODO={DONE}-TODO={CNCL}"
			 ((org-agenda-overriding-header "Someday/Maybe:")
			  (org-use-tag-inheritance t)))))
	 ("ow" "Weekly Review" agenda ""
	  ((org-agenda-overriding-header "Week in Review")
	   (org-agenda-span
		(quote week))
	   (org-agenda-start-on-weekday 0)
	   (org-agenda-show-all-dates t)
	   (org-agenda-start-with-log-mode t)
	   (org-agenda-archives-mode t)))
	 ("x" . "Special Reports")
	 ("xn" "Now Due" agenda ""
	  ((org-agenda-overriding-header "Now Due:")
	   (org-agenda-ndays 1)
	   (org-deadline-warning-days 0)
	   (org-use-tag-inheritance t)))
	 ("xp" "Projects" tags "PROJ+LEVEL=2"
	  ((org-agenda-overriding-header "Projects:")
	   (org-use-tag-inheritance t)
	   (org-agenda-prefix-format "  %-4:c %s")))
	 ("xa" "All Open Actions" alltodo ""
	  ((org-agenda-overriding-header "Open Actions:")
	   (org-use-tag-inheritance t)
	   (org-agenda-skip-function
		(quote
		 (org-agenda-skip-entry-if
		  (quote todo)
		  (quote
		   ("DONE" "CNCL")))))))
	 ("xx" "Next Actions" tags "+TODO={TODO\\|NEXT\\|WAIT}"
	  ((org-agenda-overriding-header "Next Actions:")
	   (org-use-tag-inheritance nil)
	   (org-agenda-prefix-format "  %-7:c %s")))
	 ("xw" "Waiting" tags "+TODO={WAIT}"
	  ((org-agenda-overriding-header "Waiting Tasks:")
	   (org-use-tag-inheritance nil)))
	 ("x?" "Maybe" tags "IDEA+LEVEL=2-TODO={DONE}-TODO={CNCL}"
	  ((org-agenda-overriding-header "Someday/Maybe:")
	   (org-use-tag-inheritance nil)
	   (org-agenda-prefix-format "  %-7:c %s")))
	 ("xs" "Scheduled" agenda ""
	  ((org-agenda-overriding-header "Scheduled Tasks:")
	   (org-agenda-entry-types
		(quote
		 (:scheduled)))
	   (org-agenda-ndays 30)
	   (org-deadline-warning-days 0)
	   (org-agenda-skip-scheduled-if-done t)
	   (org-use-tag-inheritance t)
	   (org-agenda-include-diary nil)))
	 ("xd" "Deadlines" agenda ""
	  ((org-agenda-overriding-header "Deadlines:")
	   (org-agenda-entry-types
		(quote
		 (:deadline)))
	   (org-agenda-ndays 30)
	   (org-deadline-warning-days 0)
	   (org-agenda-skip-deadline-if-done t)
	   (org-use-tag-inheritance t)
	   (org-agenda-include-diary nil))))))
 '(org-agenda-diary-file (quote diary-file))
 '(org-agenda-dim-blocked-tasks t)
 '(org-agenda-files
   (quote
	("~/org" "~/org/archive" "~/org-shared" "~/org-shared/archive")))
 '(org-agenda-follow-indirect t)
 '(org-agenda-ignore-drawer-properties (quote (effort appt category)))
 '(org-agenda-include-diary t)
 '(org-agenda-inhibit-startup t)
 '(org-agenda-prefix-format
   (quote
	((agenda . " %-5 T%-7c%?-8t ")
	 (todo . " %-5 T%-7c%?-8t ")
	 (tags . " %-5 T%-7c%?-8t ")
	 (timeline . " %s %t ")
	 (search . " %i %-12:c "))))
 '(org-agenda-remove-tags t)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-scheduled-if-deadline-is-shown t)
 '(org-agenda-sorting-strategy
   (quote
	((agenda habit-down time-up priority-down category-keep tag-down)
	 (todo priority-down category-keep)
	 (tags priority-down category-keep)
	 (search category-keep))))
 '(org-agenda-span 7)
 '(org-agenda-start-on-weekday nil)
 '(org-agenda-start-with-follow-mode nil)
 '(org-agenda-start-with-log-mode t)
 '(org-agenda-tags-column -80)
 '(org-agenda-use-time-grid nil)
 '(org-agenda-window-setup (quote current-window))
 '(org-archive-location "archive/%s_archive::")
 '(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item . auto))))
 '(org-brain-path "~/org/brain" t)
 '(org-capture-templates
   (quote
	(("t" "Todo" entry
	  (file+headline org-default-notes-file "Tasks")
	  "* TODO %^{Description}
  CREATED: %U %?")
	 ("a" "Appointment" entry
	  (file+headline org-default-notes-file "Appointments")
	  "* %^{Description} @%^{Location}
  %^{When}T CREATED: %U %?")
	 ("p" "Project" entry
	  (file+headline org-default-notes-file "Projects")
	  "* %^{Description} [/] :PROJ:
  CREATED: %U %?")
	 ("n" "Note" entry
	  (file+headline org-default-notes-file "Notes")
	  "* %^{Description}
  CREATED: %U %?")
	 ("i" "Idea" entry
	  (file+headline org-default-notes-file "Ideas")
	  "* %^{Description}
  CREATED: %U %?"))) t)
 '(org-catch-invisible-edits (quote show-and-error))
 '(org-cycle-separator-lines 0)
 '(org-deadline-warning-days 14)
 '(org-default-notes-file "~/org/capture.org")
 '(org-default-priority 0)
 '(org-ellipsis "⤵")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-enforce-todo-dependencies t)
 '(org-fast-tag-selection-single-key t)
 '(org-habit-show-habits-only-for-today nil t)
 '(org-hide-leading-stars t)
 '(org-id-locations-file "~/org/.org-id-locations" t)
 '(org-id-track-globally t t)
 '(org-journal-date-format "%Y/%m/%d - %A" t)
 '(org-journal-date-prefix "#+STARTUP: overview
#+FILETAGS: JRNL
#+TITLE: " t)
 '(org-journal-dir "~/org-shared/journal/" t)
 '(org-journal-file-format "%Y%m%d.org" t)
 '(org-journal-time-prefix "
** " t)
 '(org-list-demote-modify-bullet
   (quote
	(("-" . "+")
	 ("*" . "+")
	 ("+" . "-")
	 ("1." . "-")
	 ("1)" . "-"))))
 '(org-list-indent-offset 0)
 '(org-log-done (quote time))
 '(org-log-state-notes-into-drawer t)
 '(org-outline-path-complete-in-steps nil)
 '(org-read-date-prefer-future nil)
 '(org-refile-allow-creating-parent-nodes (quote confirm))
 '(org-refile-targets
   (quote
	((org-agenda-files :maxlevel . 1)
	 (org-agenda-files :tag . "PROJ")
	 (org-agenda-files :tag . "DELG"))))
 '(org-refile-use-outline-path (quote file))
 '(org-reverse-note-order t)
 '(org-sort-agenda-noeffort-is-high t)
 '(org-startup-align-all-tables t)
 '(org-startup-indented t)
 '(org-stuck-projects (quote ("PROJ+LEVEL=2/-DONE" ("NEXT" "TODO"))))
 '(org-tag-alist
   (quote
	((:startgroup)
	 ("@wrk" . 119)
	 ("@hom" . 104)
	 ("@out" . 111)
	 ("@net" . 110)
	 ("@cmp" . 99)
	 ("@pho" . 112)
	 ("@eml" . 109)
	 ("@del" . 100)
	 ("PROJ" . 106)
	 (:endgroup))))
 '(org-tags-column -80)
 '(org-todo-keyword-faces
   (quote
	(("TODO" :foreground "Green" :weight bold)
	 ("STEP" :foreground "LightBlue" :weight bold)
	 ("NEXT" :foreground "Blue" :weight bold)
	 ("WAIT" :foreground "Yellow" :weight bold)
	 ("DONE" :foreground "ForestGreen" :weight bold)
	 ("CNCL" :foreground "Red" :weight bold))))
 '(org-todo-keywords
   (quote
	((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d)" "CNCL(x@/!)")
	 (sequence "STEP(s)" "NEXT(n)" "|" "DONE(d)" "CNCL(x@/!)"))))
 '(org-treat-S-cursor-todo-selection-as-state-change nil)
 '(org-use-fast-tag-selection t)
 '(org-use-fast-todo-selection t)
 '(package-selected-packages
   (quote
	(restclient add-node-modules-path php-mode evil-magit text-mode dired org-brain helm-config helm-rg ivy ivy-omni-org counsel flx helm-orgcard helm-flyspell helm-flyspell-correct org color-theme-sanityinc-tomorrow blacken py-yapf evil-leader delight markdown-mode virtualenvwrapper elpy magit-gitflow projectile helm benchmark-init yaml-mode web-mode vdiff use-package terraform-mode swiper-helm smex smart-mode-line overcast-theme org-journal multi-term magit json-mode js2-mode ido-completing-read+ helm-pt helm-projectile helm-org-rifle helm-ag go-mode flycheck eyebrowse exec-path-from-shell evil-nerd-commenter evil elfeed dockerfile-mode company auto-compile ag)))
 '(projectile-global-mode t t)
 '(projectile-mode-line
   (quote
	(:eval
	 (if
		 (file-remote-p default-directory)
		 " Projectile"
	   (format " Proj[%s]"
			   (projectile-project-name))))) t)
 '(rm-blacklist (quote (" Undo-Tree" " ElDoc" " company")))
 '(safe-local-variable-values (quote ((buffer-read-only . true))))
 '(smerge-command-prefix "C-c C-v" t)
 '(sml/mode-width (quote full))
 '(sml/name-width 40)
 '(sml/no-confirm-load-theme t)
 '(sml/shorten-directory t)
 '(sml/shorten-modes t)
 '(tab-width 4)
 '(truncate-lines t)
 '(vc-follow-symlinks t)
 '(web-mode-code-indent-offset 2 t)
 '(web-mode-css-indent-offset 2 t)
 '(web-mode-markup-indent-offset 2 t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#000000" :foreground "#eaeaea" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 140 :width normal :foundry "nil" :family "Liberation Mono for Powerline")))))
;;; custom.el ends here
