;;; local.el --- Local configuration -*- lexical-binding: t; -*-

(setopt doom-theme 'doom-gruvbox)
(set-frame-parameter (selected-frame) 'alpha '(95 . 95)) (add-to-list 'default-frame-alist '(alpha . (95 . 95)))

;; TODO: Customize capture templates
(setopt org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* [ ] %?\n%i\n%a" :prepend t)
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %?\n%i\n%a" :prepend t)
          ("p" "Templates for projects")
          ("pt" "Project-local todo" entry
           (file+headline +org-capture-project-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("pn" "Project-local notes" entry
           (file+headline +org-capture-project-notes-file "Inbox")
           "* %U %?\n%i\n%a" :prepend t)
          ("pc" "Project-local changelog" entry
           (file+headline +org-capture-project-changelog-file "Unreleased")
           "* %U %?\n%i\n%a" :prepend t)
          ("o" "Centralized templates for projects")
          ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
          ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
          ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t)))

;; TODO: Customize refile targets
(setopt org-refile-targets
        '((nil :maxlevel . 3)
          (org-agenda-files :maxlevel . 3)))

;;;; TERMINAL

;; Configure fish shell for emulation and bash for execution
(setopt shell-file-name (executable-find
                         "bash"))

(setopt vterm-shell
        "/opt/homebrew/bin/fish")

(setopt explicit-shell-file-name
        "/opt/homebrew/bin/fish")

;;;; OS
(when (eq system-type 'darwin)
  (setopt mac-command-modifier 'meta))
