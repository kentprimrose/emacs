;;; init-05-org --- org mode settings

;;; Commentary:

;; This will be executed as part of Emacs initialization.
;; Settings that are applicable to org-mode should be here.

;;; Code:

;; Templates
;; ============================================================
(defun kap/create-brain-file ()
  "Create a new brain file, prompting for TITLE and TAGS."
  (interactive)
  (let ((TITLE (read-string "Title: "))
		(TAGS  (read-string "Tags: ")))
	(find-file (format "~/org-shared/brain/%s_%s.org"
					   (format-time-string "%Y%m%d-%H%M%S")
					   (replace-regexp-in-string " " "_" (downcase TITLE))))
	(insert "#+TITLE: " (capitalize TITLE) "\n\n\n\n"
			"* Links\n" "- Parents\n" "- Children\n" "- References\n" "- Other")
	(goto-char (point-min)) (forward-line 2)
	(insert "* " (capitalize TITLE))
	(insert " :" (replace-regexp-in-string "\s-*" ":" (downcase TAGS)) ":\n")))

;; Org
;; =====================================================================
(use-package org
  :ensure t
  :mode ("\\.org\\'" . org-mode)

  :config
  (turn-on-auto-fill)
  (evil-set-initial-state 'org-journal-mode 'insert)
  (evil-set-initial-state 'org-capture-mode 'insert)
  (add-hook 'org-capture-mode-hook 'evil-insert-state)
  (add-hook 'org-log-buffer-setup-hook 'evil-insert-state)
  (with-eval-after-load 'org
	(add-to-list 'org-modules 'org-habit t))

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
  (org-catch-invisible-edits 'show-and-error)
  (org-cycle-separator-lines 0)
  (org-list-indent-offset 0)
  (org-ellipsis "⤵")

  (org-blank-before-new-entry `((heading . auto)
								(plain-list-item . auto)))
  (org-M-RET-may-split-line `((default . nil)))

  (org-list-demote-modify-bullet
   `(("-"  . "+") ("*"  . "+") ("+"  . "-")
	 ("1." . "-") ("1)" . "-")))

  (org-agenda-files `("~/org-local" "~/org-local/archive"
					  "~/org-shared" "~/org-shared/archive"))
  (org-default-notes-file "~/org-local/capture.org")
  (org-archive-location "archive/%s_archive::")

  (org-journal-dir "~/org-shared/journal/")
  (org-journal-file-format "%Y%m%d\.org")
  (org-journal-date-format "%Y/%m/%d - %A")
  (org-journal-date-prefix "#+STARTUP: overview\n#+FILETAGS: JRNL\n#+TITLE: ")
  (org-journal-time-prefix "\n** ")

  ;; Capture Setup
  (org-capture-templates
   '(("t" "Todo" entry
	  (file+headline org-default-notes-file "Tasks")
	  "* TODO %^{Description}\nCREATED: %U %?")
	 ("a" "Appointment" entry
	  (file+headline org-default-notes-file "Appointments")
	  "* %^{Description} @%^{Location} %^{When}T\nCREATED: %U %?")
	 ("h" "Habit" entry
	  (file+headline org-default-notes-file "Habits")
	  "* %^{Description} @%^{Location} %^{When}T\nCREATED: %U %?")
	 ))

  ;; GTD Contexts
  (org-use-fast-tag-selection t)
  (org-fast-tag-selection-single-key t)
  (org-tag-alist
   `((:startgroup . nil)
	 ("@wrk" . ?w) ("@hom" . ?h) ("@out" . ?o)
	 ("@net" . ?n) ("@cmp" . ?c) ("@pho" . ?p)
	 ("@eml" . ?m) ("@del" . ?d) ("PROJ" . ?j)
	 (:endgroup . nil)))

  ;; Refile Setup
  (org-use-tag-inheritance t)
  (org-refile-use-outline-path 'file)
  (org-outline-path-complete-in-steps nil)
  (org-refile-allow-creating-parent-nodes 'confirm)
  (org-refile-targets `((org-agenda-files :maxlevel . 1)))

  ;; Workflow Setup
  (org-todo-keywords
   `((sequence "TODO(t)" "WAIT(w@/!)" "|" "DONE(d)" "CNCL(x@/!)")
	 (sequence "STEP(s)" "NEXT(n)" "|" "DONE(d)" "CNCL(x@/!)")))

  (org-todo-keyword-faces
   `(("TODO" :foreground "Green"          :weight bold)
	 ("STEP" :foreground "LightBlue"      :weight bold)
	 ("NEXT" :foreground "Blue"           :weight bold)
	 ("WAIT" :foreground "Yellow"         :weight bold)
	 ("DONE" :foreground "ForestGreen"    :weight bold)
	 ("CNCL" :foreground "Red"            :weight bold)))

  ;; Agenda Setup.
  (org-agenda-span 7)
  (org-agenda-start-with-follow-mode nil)
  (org-agenda-follow-indirect t)
  (org-agenda-dim-blocked-tasks t)
  (org-agenda-show-all-dates t)
  (org-agenda-skip-deadline-if-done t)
  (org-agenda-skip-scheduled-if-deadline-is-shown t)
  (org-agenda-start-on-weekday nil)
  (org-agenda-use-time-grid nil)
  (org-agenda-include-diary t)
  (org-agenda-tags-column -80)
  (org-agenda-tags-todo-honor-ignore-options t)
  (org-agenda-window-setup 'current-window)
  (org-agenda-inhibit-startup t)
  (org-agenda-ignore-drawer-properties `(effort appt category)) ;; not used
  (org-agenda-block-separator nil)
  (org-agenda-compact-blocks t)
  (org-agenda-start-with-log-mode t)
  (org-agenda-start-day nil)
  (org-agenda-start-on-weekday nil)
  (org-agenda-diary-file 'diary-file)
  (org-agenda-remove-tags t)

  (org-deadline-warning-days 14)
  (org-habit-show-habits-only-for-today nil)
  (org-sort-agenda-noeffort-is-high t)

  (org-stuck-projects `("PROJ+LEVEL=2/-DONE" ("NEXT" "TODO")))
  (diary-file "~/org-shared/diary")

  (org-agenda-prefix-format
   `((agenda   . " %-5 T%-7c%?-8t ")
	 (todo     . " %-5 T%-7c%?-8t ")
	 (tags     . " %-5 T%-7c%?-8t ")
	 (timeline . " %s %t ")
	 (search   . " %i %-12:c ")))

  (org-agenda-sorting-strategy
   `((agenda habit-down time-up priority-down alpha-up category-keep tag-down)
	 (todo priority-down alpha-up category-keep)
	 (tags priority-down alpha-up category-keep)
	 (search category-keep)))

  (org-agenda-custom-commands
   `(("g" . "GTD contexts")
	 ("gw" "Work"           tags-todo "@wrk" ((org-agenda-overriding-header "Work:")))
	 ("gh" "Home"           tags-todo "@hom" ((org-agenda-overriding-header "Home:")))
	 ("go" "Out"            tags-todo "@out" ((org-agenda-overriding-header "Out:")))
	 ("gn" "Internet"       tags-todo "@net" ((org-agenda-overriding-header "Internet:")))
	 ("gc" "Computer"       tags-todo "@cmp" ((org-agenda-overriding-header "Computer:")))
	 ("gp" "Phone"          tags-todo "@pho" ((org-agenda-overriding-header "Phone:")))
	 ("gm" "Email"          tags-todo "@eml" ((org-agenda-overriding-header "Email:")))
	 ("gd" "Delegated"      tags-todo "@del" ((org-agenda-overriding-header "Delegated:")))
	 ("gj" "Projects"       tags-todo "PROJ" ((org-agenda-overriding-header "Projects:")))
	 ("ga" "All contexts" ((tags-todo "@wrk" ((org-agenda-overriding-header "Work:")))
						   (tags-todo "@hom" ((org-agenda-overriding-header "Home:")))
						   (tags-todo "@out" ((org-agenda-overriding-header "Out:")))
						   (tags-todo "@net" ((org-agenda-overriding-header "Internet:")))
						   (tags-todo "@cmp" ((org-agenda-overriding-header "Computer:")))
						   (tags-todo "@pho" ((org-agenda-overriding-header "Phone:")))
						   (tags-todo "@eml" ((org-agenda-overriding-header "Email:")))
						   (tags-todo "@del" ((org-agenda-overriding-header "Delegated:")))
						   (tags-todo "PROJ" ((org-agenda-overriding-header "Projects:")))))

	 ("d" "Daily Agenda"
	  ((agenda "" ((org-agenda-span 'day)
				   (org-agenda-ndays 1)
				   (org-agenda-start-on-weekday nil)
				   (org-agenda-start-day "+0d")
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-deadline-warning-days 3)
				   (org-agenda-skip-deadline-if-done t)
				   (org-agenda-use-time-grid t)
				   (org-use-tag-inheritance t)
				   ))
	   (tags-todo "-PROJ-STYLE=\"habit\"-PRIORITY=\"A\"-PRIORITY=\"B\"-PRIORITY=\"C\"/!+NEXT|+TODO|+WAIT"
				  ((org-agenda-overriding-header "Open Tasks: ========================================================")
				   (org-agenda-todo-ignore-scheduled 'future)
				   (org-use-tag-inheritance t)))
	   (tags-todo "PRIORITY=\"A\""
				  ((org-agenda-overriding-header "Top Priority Tasks: ================================================")
				   (org-agenda-todo-ignore-scheduled 'future)))
	   (tags-todo "PRIORITY=\"B\""
				  ((org-agenda-overriding-header "Lower Priority Tasks: ==============================================")
				   (org-agenda-todo-ignore-scheduled 'future)))
	   (tags-todo "PRIORITY=\"C\""
				  ((org-agenda-overriding-header "Somefuture Tasks: =====================================================")
				   (org-agenda-todo-ignore-scheduled 'future)))
	   (tags-todo "PROJ"
				  ((org-agenda-overriding-header "Projects: ==========================================================")
				   (org-agenda-todo-ignore-scheduled 'future)
				   (org-use-tag-inheritance t)))
	   ))

	 ("p" "Planning"
	  ((tags-todo "-PROJ-STYLE=\"habit\"-PRIORITY=\"A\"-PRIORITY=\"B\"-PRIORITY=\"C\"/!+NEXT|+TODO|+WAIT"
				  ((org-agenda-overriding-header "Open Tasks: ========================================================")))
	   (tags-todo "PRIORITY=\"A\""
				  ((org-agenda-overriding-header "Top Priority Tasks: ================================================")))
	   (tags-todo "PRIORITY=\"B\""
				  ((org-agenda-overriding-header "Lower Priority Tasks: ==============================================")))
	   (tags-todo "PRIORITY=\"C\""
				  ((org-agenda-overriding-header "Low Priority Tasks: ================================================")))
	   (tags "-ARCHIVE+PROJ+LEVEL=2"
			 ((org-agenda-overriding-header "Active Projects: ===================================================")
			  (org-use-tag-inheritance t)))
	   (tags "STYLE=\"habit\""
			 ((org-agenda-overriding-header "Habits: ============================================================")))
	   ))

	 ("h" "Habits"
	  ((tags "STYLE=\"habit\""
			 ((org-agenda-overriding-header "Habits: ============================================================")))
	   ))

	 ("r" . "Review")
	 ("rw" "Weekly Review"
	  ((agenda "" ((org-agenda-overriding-header "Weekly Review:")
				   (org-agenda-span 'week)
				   (org-agenda-start-on-weekday 0)
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-use-tag-inheritance t)))))
	 ("rm" "Monthly Review"
	  ((agenda "" ((org-agenda-overriding-header "Monthly Review:")
				   (org-agenda-span 'month)
				   (org-agenda-include-diary nil)
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-use-tag-inheritance t)))))
	 ("ry" "Yearly Review"
	  ((agenda "" ((org-agenda-overriding-header "Yearly Review:")
				   (org-agenda-span 'year)
				   (org-agenda-include-diary nil)
				   (org-agenda-todo-ignore-deadlines nil)
				   (org-use-tag-inheritance t)))))
	 ("rh" "Habits Review"
	  ((agenda "" ((org-agenda-overriding-header "Habits Review:")
				   (org-agenda-span 'week)
				   (org-agenda-include-diary nil)
				   (org-agenda-log-mode-items '(state))
				   (org-use-tag-inheritance t)))))
	 ("rr" "Require attention"
	  ((tags-todo "-@wrk-@hom-@out-@net-@cmp-@pho-@eml-@del"
				  ((org-agenda-overriding-header "Context:")
				   (org-use-tag-inheritance t)))
	   (tags "MOVE+LEVEL>1"
			 ((org-agenda-overriding-header "Refile:")
			  (org-use-tag-inheritance t)))
	   (stuck ""
			  ((org-agenda-overriding-header "Stuck:")
			   (org-use-tag-inheritance t)))
	   (tags (concat "-PROJ+TODO={DONE\\\|CNCL}" "|"
					 "+PROJ+TODO={DONE\\\|CNCL}+LEVEL<=2")
			 ((org-agenda-overriding-header "Archive:")))))

	 ("o" . "Old Reports")
	 ("od" "Daily Review"
	  ((agenda "" ((org-agenda-overriding-header "Due:")
				   (org-agenda-entry-types `(:scheduled :deadline :timestamp :sexp))
				   (org-agenda-ndays 1)
				   (org-deadline-warning-days 7)
				   (org-agenda-skip-deadline-if-done t)
				   (org-use-tag-inheritance t)))
	   (stuck "" ((org-agenda-overriding-header "Stuck:")
				  (org-use-tag-inheritance t)))))
	 ("ow" "Weekly Review" agenda ""
	  ((org-agenda-overriding-header "Week in Review")
	   (org-agenda-span 'week)
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
		`(org-agenda-skip-entry-if 'todo `("DONE" "CNCL")))))
	 ("xx" "Next Actions" tags "+TODO={TODO\\\|NEXT\\\|WAIT}"
	  ((org-agenda-overriding-header "Next Actions:")
	   (org-use-tag-inheritance nil)
	   (org-agenda-prefix-format "  %-7:c %s")))
	 ("xw" "Waiting" tags "+TODO={WAIT}"
	  ((org-agenda-overriding-header "Waiting Tasks:")
	   (org-use-tag-inheritance nil)))
	 ("xs" "Scheduled" agenda ""
	  ((org-agenda-overriding-header "Scheduled Tasks:")
	   (org-agenda-entry-types `(:scheduled))
	   (org-agenda-ndays 30)
	   (org-deadline-warning-days 0)
	   (org-agenda-skip-scheduled-if-done t)
	   (org-use-tag-inheritance t)
	   (org-agenda-include-diary nil)))
	 ("xd" "Deadlines" agenda ""
	  ((org-agenda-overriding-header "Deadlines:")
	   (org-agenda-entry-types `(:deadline))
	   (org-agenda-ndays 30)
	   (org-deadline-warning-days 0)
	   (org-agenda-skip-deadline-if-done t)
	   (org-use-tag-inheritance t)
	   (org-agenda-include-diary nil)))))

  :init
  (require 'org-agenda)
  (use-package org-journal
	:ensure t)

  :bind (("C-c a" . org-agenda)
		 ("C-c c" . org-capture)
		 ("C-c i" . org-time-stamp-inactive)
		 ("C-c p" . org-cliplink)

		 ("C-c C-l s" . org-store-link)
		 ("C-c C-l i" . org-insert-link)

		 ("C-c b b" . kap/create-brain-file)
		 ("C-c b j" . org-journal-new-entry)

		 :map org-mode-map
		 ([s-return] . org-meta-return)
		 ([return] . org-return-indent)

		 :map org-agenda-mode-map
		 ("w" . org-agenda-refile)
		 ("j" . org-agenda-next-line)
		 ("k" . org-agenda-previous-line)
		 ("C-c C-e" . org-export-dispatch)))

(use-package org-cliplink
  :ensure t
  :defer t)

(use-package org-ref
  :ensure t
  :defer t

  :custom
  (reftex-default-bibliography `("~/org-shared/bibliography/references.bib"))
  (org-ref-bibliography-notes "~/org-shared/bibliography/notes.org")
  (org-ref-default-bibliography "~/org-shared/bibliography/references.bib")
  (org-ref-pdf-directory "~/org-shared/bibliography/bibtex-pdfs/"))

(use-package deft
  :ensure t

  :custom
  (deft-recursive t)
  (deft-default-extsnsion "org")
  (deft-extensions `("txt" "tex" "org"))
  (deft-directory "~/org-shared/brain/")
  (deft-use-filter-string-for-filename t)
  (deft-incremental-search t)

  :bind
  ("<f8>" . deft))

(provide 'init-05-org)
;;; init-05-org.el ends here
