;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; NOTE: No need to run 'doom sync' after modifying this file!

;;;; EDITOR

(setq doom-theme 'doom-gruvbox)
(setq display-line-numbers-type 'visual)
(set-frame-parameter (selected-frame) 'alpha '(95 . 95)) (add-to-list 'default-frame-alist '(alpha . (95 . 95)))
;; TODO: Set font

(after! corfu
  (map! :map corfu-map
        :nvi "TAB" nil
        :nvi "<tab>" nil
        :i "C-k" #'corfu-popupinfo-scroll-down
        :i "C-j" #'corfu-popupinfo-scroll-up))

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

;;;; ORG MODE

(setq org-directory "~/org/")
(setq org-tags-column -77)

;;;; TERMINAL

;; Configure fish shell for emulation and bash for execution
(setq shell-file-name (executable-find
                       "bash"))

(setq-default vterm-shell
              "/opt/homebrew/bin/fish") (setq-default explicit-shell-file-name
              "/opt/homebrew/bin/fish")

;;;; OS
(when (eq system-type 'darwin)
  (setq mac-command-modifier 'control))

;;;; HELPFUL DOOM STUFF

;; TODO: Eventually delete this

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
