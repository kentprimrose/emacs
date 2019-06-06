;;; init-05-org --- org mode settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Settings that are applicable to org-mode should be here.

;;; Code:

;; Org
;; =====================================================================
(use-package org
  :ensure t
  :defer t
  :mode ("\\.org\\'" . org-mode)

  :config
  (turn-on-auto-fill)
  (evil-set-initial-state 'org-journal-mode 'insert)
  (evil-set-initial-state 'org-capture-mode 'insert)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)

  ;; General Setup
  :custom
  (evil-want-C-i-jump nil) ;; Keep tab for org-mode
  (vc-follow-symlinks t) ;; needed for work access to personal org
  (org-startup-indented t)
  (org-startup-align-all-tables t)
  (org-hide-leading-stars t)
  (org-enforce-todo-dependencies t)
  (org-enforce-todo-checkbox-dependencies t)
  (org-use-fast-todo-selection t)
  (org-treat-S-cursor-todo-selection-as-state-change nil)
  (org-log-done 'time)
  (org-read-date-prefer-future nil)
  (org-deadline-warning-days 14)
  (org-reverse-note-order t)
  (org-log-state-notes-into-drawer t)
  (org-tags-column -80)
  (org-default-priority 0)
  (org-agenda-tags-column -80)
  (org-agenda-window-setup 'current-window)
  (org-agenda-compact-blocks t)
  (org-agenda-start-with-log-mode t)
  (org-agenda-inhibit-startup t)
  (org-agenda-ignore-drawer-properties '(effort appt category)) ;; not used
  (org-catch-invisible-edits 'show-and-error)
  (org-cycle-separator-lines 0)
  (org-list-indent-offset 0)
  (org-ellipsis "⤵")

  (org-blank-before-new-entry '((heading . auto)
								(plain-list-item . auto)))
  (org-M-RET-may-split-line '((default . nil)))

  (org-list-demote-modify-bullet
   '(("-"  . "+") ("*"  . "+") ("+"  . "-")
	 ("1." . "-") ("1)" . "-")
	 ))

  (org-agenda-files '("~/org" "~/org/archive" "~/org-shared" "~/org-shared/archive"))
  (org-default-notes-file "~/org/capture.org")
  (org-archive-location "archive/%s_archive::")

  ;; Capture Setup
  (org-capture-templates
   '(
	 ("t" "Todo" entry
	  (file+headline org-default-notes-file "Tasks")
	  "* TODO %^{Description}\n  CREATED: %U %?")
	 ("s" "Step" entry
	  (file+headline org-default-notes-file "Tasks")
	  "* STEP %^{Description}\n  CREATED: %U %?")
	 ("p" "Project" entry
	  (file+headline org-default-notes-file "Projects")
	  "* %^{Description} [//] :PROJ:\n  CREATED: %U %?")
	 ("a" "Appointment" entry
	  (file+headline org-default-notes-file "Appointments")
	  "* %^{Description} @%^{Location}\n  %^{When}T CREATED: %U %?")
	 ("n" "Note" entry
	  (file+headline org-default-notes-file "Notes")
	  "* %^{Heading}\n  CREATED: %U\n  %i %?")
	 ("i" "Idea" entry
	  (file+headline org-default-notes-file "Ideas")
	  "* %^{Heading} :IDEA:\n  CREATED: %U\n  %i %?")
	 ))

  ;; GTD Contexts
  (org-use-fast-tag-selection t)
  (org-fast-tag-selection-single-key t)
  (org-tag-alist
   '((:startgroup . nil)
	 ("@wrk"  . ?w)
	 ("@hom"  . ?h)
	 ("@out"  . ?o)
	 ("@net"  . ?n)
	 ("@cmp"  . ?c)
	 ("@pho"  . ?p)
	 ("@eml"  . ?m)
	 (:endgroup . nil)
	 ))

  ;; Refile Setup
  ;; (org-use-tag-inheritance t) ;; needed?
  (org-refile-use-outline-path 'file)
  (org-outline-path-complete-in-steps nil)
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-refile-targets '((org-agenda-files :maxlevel . 1)
						(org-agenda-files :tag . "PROJ")))

  ;; Workflow Setup
  (org-todo-keywords
   '((sequence "TODO(t)" "WAIT(w@/!)" "DELG(g@/!)" "|" "DONE(d)" "CNCL(x@/!)")
	 (sequence "STEP(s)" "NEXT(n)" "|" "DONE(d)" "CNCL(x@/!)")
	 ))

  (org-todo-keyword-faces
   '(("TODO" :foreground "Green"          :weight bold)
	 ("STEP" :foreground "LightBlue"      :weight bold)
	 ("NEXT" :foreground "Blue"           :weight bold)
	 ("WAIT" :foreground "Yellow"         :weight bold)
	 ("DELG" :foreground "LightSalmon"    :weight bold)
	 ("DONE" :foreground "ForestGreen"    :weight bold)
	 ("CNCL" :foreground "Red"            :weight bold)
	 ))

  ;; Agenda Setup.
  (org-agenda-span 7)
  (org-deadline-warning-days 14)
  (org-agenda-start-with-follow-mode nil)
  (org-agenda-follow-indirect t)
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-show-all-dates t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-done t)
  (org-agenda-skip-scheduled-if-deadline-is-shown t)
  (org-agenda-start-on-weekday nil)
  (org-agenda-use-time-grid nil)
  (org-sort-agenda-noeffort-is-high t)
  (org-agenda-include-diary t)
  (org-stuck-projects '("PROJ+LEVEL=2/-DONE" ("NEXT" "TODO")))
  (diary-file "~/org/diary")
  (org-agenda-diary-file 'diary-file)

  (org-agenda-remove-tags t)
  (org-agenda-prefix-format
   '((agenda . " %-5 T%-7c%?-8t ")
	 (todo   . " %-5 T%-7c%?-8t ")
	 (tags   . " %-5 T%-7c%?-8t ")
	 (timeline . " %s %t ")
	 (search . " %i %-12:c ")))

  (org-agenda-sorting-strategy
   '((agenda habit-down time-up priority-down category-keep tag-down)
	 (todo priority-down category-keep)
	 (tags priority-down category-keep)
	 (search category-keep)))

  (org-agenda-custom-commands
   '(("g" . "GTD contexts")
	 ("gw" "Work"           tags-todo "@wrk" ((org-agenda-overriding-header "Work:")))
	 ("gh" "Home"           tags-todo "@hom" ((org-agenda-overriding-header "Home:")))
	 ("go" "Out"            tags-todo "@out" ((org-agenda-overriding-header "Out:")))
	 ("gn" "Internet"       tags-todo "@net" ((org-agenda-overriding-header "Internet:")))
	 ("gc" "Computer"       tags-todo "@cmp" ((org-agenda-overriding-header "Computer:")))
	 ("gp" "Phone"          tags-todo "@pho" ((org-agenda-overriding-header "Phone:")))
	 ("gm" "Email"          tags-todo "@eml" ((org-agenda-overriding-header "Email:")))
	 ("gi" "Idea"           tags "IDEA+LEVEL=2" ((org-agenda-overriding-header "Idea:")))
	 ("ga" "All contexts" ((tags-todo "@wrk" ((org-agenda-overriding-header "Work:")))
						   (tags-todo "@hom" ((org-agenda-overriding-header "Home:")))
						   (tags-todo "@out" ((org-agenda-overriding-header "Out:")))
						   (tags-todo "@net" ((org-agenda-overriding-header "Internet:")))
						   (tags-todo "@cmp" ((org-agenda-overriding-header "Computer:")))
						   (tags-todo "@pho" ((org-agenda-overriding-header "Phone:")))
						   (tags-todo "@eml" ((org-agenda-overriding-header "Email:")))
						   (tags "IDEA+LEVEL=2" ((org-agenda-overriding-header "Idea:")))
						   ))

	 ("d" "Daily Agenda"
	  ((agenda "" ((org-agenda-overriding-header "Today's Schedule:")
				   (org-agenda-span 'day)
				   (org-agenda-ndays 1)
				   (org-agenda-start-on-weekday nil)
				   (org-agenda-start-day "+0d")
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-deadline-warning-days 7)
				   (org-agenda-skip-deadline-if-done t)
				   (org-agenda-use-time-grid t)
				   (org-use-tag-inheritance t)
				   ))
	   (tags-todo "PRIORITY=\"A\""
				  ((org-agenda-overriding-header "Top Priority Tasks ===============================================")
				   ))
	   (tags-todo "PRIORITY=\"B\""
				  ((org-agenda-overriding-header "Lower Priority Tasks =============================================")
				   ))
	   ))

	 ("r" . "Review")
	 ("rw" "Weekly Review"
	  ((agenda "" ((org-agenda-overriding-header "Agenda:")
				   (org-agenda-span 'week)
				   (org-agenda-start-on-weekday 0)
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-deadline-warning-days 7)
				   (org-use-tag-inheritance t)
				   ))
	   ))
	 ("rm" "Monthly Review"
	  ((agenda "" ((org-agenda-overriding-header "Agenda:")
				   (org-agenda-span 'month)
				   (org-agenda-include-diary nil)
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-deadline-warning-days 28)
				   (org-use-tag-inheritance t)
				   ))
	   ))
	 ("rr" "Require attention"
	  ((tags-todo "-@wrk-@hom-@out-@net-@cmp-@pho-@eml"
				  ((org-agenda-overriding-header "Context:")
				   (org-use-tag-inheritance t)))
	   (tags "REFILE+LEVEL>1"
			 ((org-agenda-overriding-header "Refile:")
			  (org-use-tag-inheritance t)))
	   (stuck ""
			  ((org-agenda-overriding-header "Stuck:")
			   (org-use-tag-inheritance t)))
	   (tags (concat "-PROJ+TODO={DONE\\\|CNCL}" "|"
					 "+PROJ+TODO={DONE\\\|CNCL}+LEVEL<=2")
			 ((org-agenda-overriding-header "Archive:")))))


	 ("p" "Planning"
	  ((tags-todo "-PRIORITY=\"A\"-PRIORITY=\"B\"-PRIORITY=\"C\"/!+NEXT|+TODO"
				  ((org-agenda-overriding-header "Open Tasks:=======================================================")
				   ))
	   (tags-todo "PRIORITY=\"A\""
				  ((org-agenda-overriding-header "Top Priority Tasks:===============================================")
				   ))
	   (tags-todo "PRIORITY=\"B\""
				  ((org-agenda-overriding-header "Lower Priority Tasks:=============================================")
				   ))
	   (tags-todo "PRIORITY=\"C\""
				  ((org-agenda-overriding-header "Low Priority Tasks:===============================================")
				   ))
	   (tags "+PROJ+LEVEL>1"
			 ((org-agenda-overriding-header "Active Projects:==================================================")
			  (org-use-tag-inheritance t)
			  ))
	   (tags "IDEA+LEVEL=2-TODO={DONE}-TODO={CNCL}"
			 ((org-agenda-overriding-header "Someday/Maybe:====================================================")
			  (org-use-tag-inheritance t)
			  ))
	   ))

	 ("o" . "Old Reports")
	 ("od" "Daily Review"
	  ((agenda "" ((org-agenda-overriding-header "Due:")
				   (org-agenda-entry-types '(:scheduled :deadline :timestamp :sexp))
				   (org-agenda-ndays 1)
				   (org-deadline-warning-days 7)
				   (org-agenda-skip-deadline-if-done t)
				   (org-use-tag-inheritance t)
				   ))
	   (stuck "" ((org-agenda-overriding-header "Stuck:")
				  (org-use-tag-inheritance t)
				  ))
	   (tags "IDEA+LEVEL=2-TODO={DONE}-TODO={CNCL}"
			 ((org-agenda-overriding-header "Someday/Maybe:")
			  (org-use-tag-inheritance t)
			  ))
	   ))
	 ("ow" "Weekly Review" agenda ""
	  ((org-agenda-overriding-header "Week in Review")
	   (org-agenda-span 'week)
	   (org-agenda-start-on-weekday 0)
	   (org-agenda-show-all-dates t)
	   (org-agenda-start-with-log-mode t)
	   (org-agenda-archives-mode t)
	   ))

	 ("x" . "Special Reports")
	 ("xn" "Now Due" agenda ""
	  ((org-agenda-overriding-header "Now Due:")
	   (org-agenda-ndays 1)
	   (org-deadline-warning-days 0)
	   (org-use-tag-inheritance t)
	   ))
	 ("xp" "Projects" tags "PROJ+LEVEL=2"
	  ((org-agenda-overriding-header "Projects:")
	   (org-use-tag-inheritance t)
	   (org-agenda-prefix-format "  %-4:c %s")
	   ))
	 ("xa" "All Open Actions" alltodo ""
	  ((org-agenda-overriding-header "Open Actions:")
	   (org-use-tag-inheritance t)
	   (org-agenda-skip-function
		'(org-agenda-skip-entry-if 'todo '("DONE" "CNCL")))
	   ))
	 ("xx" "Next Actions" tags "+TODO={TODO\\\|NEXT\\\|DELG\\\|WAIT}"
	  ((org-agenda-overriding-header "Next Actions:")
	   (org-use-tag-inheritance nil)
	   (org-agenda-prefix-format "  %-7:c %s")
	   ))
	 ("xw" "Waiting" tags "+TODO={DELG\\\|WAIT}"
	  ((org-agenda-overriding-header "Waiting Tasks:")
	   (org-use-tag-inheritance nil)
	   ))
	 ("x?" "Maybe" tags "IDEA+LEVEL=2-TODO={DONE}-TODO={CNCL}"
	  ((org-agenda-overriding-header "Someday/Maybe:")
	   (org-use-tag-inheritance nil)
	   (org-agenda-prefix-format "  %-7:c %s")
	   ))
	 ("xs" "Scheduled" agenda ""
	  ((org-agenda-overriding-header "Scheduled Tasks:")
	   (org-agenda-entry-types '(:scheduled))
	   (org-agenda-ndays 30)
	   (org-deadline-warning-days 0)
	   (org-agenda-skip-scheduled-if-done t)
	   (org-use-tag-inheritance t)
	   (org-agenda-include-diary nil)
	   ))
	 ("xd" "Deadlines" agenda ""
	  ((org-agenda-overriding-header "Deadlines:")
	   (org-agenda-entry-types '(:deadline))
	   (org-agenda-ndays 30)
	   (org-deadline-warning-days 0)
	   (org-agenda-skip-deadline-if-done t)
	   (org-use-tag-inheritance t)
	   (org-agenda-include-diary nil))
	  ))
   )

  :bind (("C-c a" . org-agenda)
		 ("C-c c" . org-capture)
		 ("C-c l" . org-store-link)
		 ("C-c b" . org-switchb)
		 ("C-c i" . org-time-stamp-inactive)
		 :map org-mode-map
		 ([s-return] . org-meta-return)
		 :map org-agenda-mode-map
		 ("C-c C-e" . org-export-dispatch)
		 ))

(use-package org-journal
  :ensure t
  :defer t

  :custom
  (org-journal-dir "~/org/journal/")
  (org-journal-file-format "%Y%m%d\.org")
  (org-journal-date-format "%Y/%m/%d - %A")
  (org-journal-date-prefix "#+STARTUP: overview\n#+FILETAGS: JRNL\n#+TITLE: ")
  (org-journal-time-prefix "\n** ")

  :bind (("C-c j" . org-journal-new-entry)
		 ("C-c C-j" . org-journal-new-entry)
		 ))

(use-package helm-org-rifle
  :ensure t
  :defer t

  :bind ("C-c s" . helm-org-rifle))

(use-package helm-orgcard
  :ensure t
  :defer t

  :bind ("C-h o" . helm-orgcard))

(use-package org-brain
  :ensure t
  :defer t

  :init
  (with-eval-after-load 'evil
	(evil-set-initial-state 'org-brain-visualize-mode 'emacs))

  :custom
  (org-brain-path "~/org/brain")
  (org-id-track-globally t)
  (org-id-locations-file "~/org/.org-id-locations")

  :bind ("C-c C-x b" . org-brain-visualize))

(provide 'init-05-org)
;;; init-05-org.el ends here
