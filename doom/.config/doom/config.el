;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(load! "local.el")

;;;; General settings
(setopt confirm-kill-emacs nil)
(map! :leader "h K" #'describe-keymap)
(map! :leader :desc "Show hunk" "g p" #'diff-hl-show-hunk)
(after! persp-mode
  (setq persp-emacsclient-init-frame-behaviour-override #'+workspace-current-name))

;;;; Whick-key
(setopt which-key-idle-delay 0.5)
(setopt which-key-allow-multiple-replacements t)
(after! which-key
  (pushnew!
   which-key-replacement-alist
   '(("" . "\\`+?evil[-:]?\\(?:a-\\)?\\(.*\\)") . (nil . "◂\\1"))
   '(("\\`g s" . "\\`evilem--?motion-\\(.*\\)") . (nil . "◃\\1"))
   ))

;;;; Remove unused keybindings
(keymap-unset doom-leader-map "o i" t)
(keymap-unset doom-leader-map "o I" t)
(keymap-unset doom-leader-map "o u" t)
(keymap-unset doom-leader-map "o U" t)
(keymap-unset doom-leader-map "o l" t)
(keymap-unset doom-leader-map "o L" t)

;;;; Editor
(setq display-line-numbers-type 'visual
      truncate-string-ellipsis "…")

(global-set-key [remap dabbrev-expand] 'hippie-expand)

(after! corfu
  (map! :map corfu-map
        :i "C-k" #'corfu-popupinfo-scroll-down
        :i "C-j" #'corfu-popupinfo-scroll-up))

(defun scroll-down-centered ()
  "Keep window centered when scrolling down"
  (interactive)
  (evil-scroll-down 0)
  (evil-scroll-line-to-center (line-number-at-pos)))

(defun scroll-up-centered ()
  "Keep window centered when scrolling up"
  (interactive)
  (evil-scroll-up 0)
  (evil-scroll-line-to-center (line-number-at-pos)))

(map! :nv "C-d" #'scroll-down-centered)
(map! :nv "C-u" #'scroll-up-centered)

(map! :nv "M-k" #'move-dup-move-lines-up)
(map! :nv "M-j" #'move-dup-move-lines-down)
(map! :nv "C-M-k" #'move-dup-duplicate-up)
(map! :nv "C-M-j" #'move-dup-duplicate-down)

;;;; Languages
(after! rustic
  (map! :map rustic-mode-map
        :desc "Insert double colon"
        :i "C-;" #'(lambda () (interactive) (insert "::")))
  (map! :map rustic-mode-map
        :desc "Insert =>"
        :i "C-=" #'(lambda () (interactive) (insert "=>")))
  (map! :map rustic-mode-map
        :desc "Insert right arrow"
        :i "C--" #'(lambda () (interactive) (insert "->")))
  (map! :map rustic-mode-map
        :desc "Insert trailing comma"
        :i "C-c ," #'(lambda () (interactive) (end-of-line) (insert ",")))
  (map! :map rustic-mode-map
        :desc "Insert trailing semicolon"
        :i "C-c ;" #'(lambda () (interactive) (end-of-line) (insert ";")))
  )


;;;; ORG MODE
(after! org
  (setopt org-tags-column -77)
  )
