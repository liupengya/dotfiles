;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.
(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '("~/.emacs.d/spacemacs-private/")
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     auto-completion
     better-defaults
     (colors :variables
             colors-enable-nyan-cat-progress-bar
             colors-enable-rainbow-identifiers t)
     (git :variables
          git-magit-status-fullscreen t
          git-enable-github-support t
          git-gutter-use-fringe t)
     osx
     markdown
     org
     dash
     syntax-checking
     python
     html
     javascript
     restclient
     emacs-lisp
     ycmd
     gtags
     c-c++
     lua
     ;; semantic
     (clojure :variables clojure-enable-fancify-symbols t)
     (perspectives :variables
                   perspective-enable-persp-projectile t)
     my-evil
     my-lua
     my-c-c++
     my-lisp
     my-misc
     my-better-defaults
     my-web
     my-tools
     my-writing
     my-org
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(evil-escape
                                    ;; remove mode for git layer
                                    magit-gh-pulls
                                    magit-gitflow
                                    magit-svn
                                    smeargle
                                    ;; remove mode for python layer
                                    nose
                                    pony-mode
                                    hy-mode
                                    )
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects bookmarks)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(solarized-light
                         monokai
                         solarized-dark
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.0)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil)
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  (add-hook 'prog-mode-hook #'linum-mode)
  ;; change evil initial mode state
  (loop for (mode . state) in
        '(
          (minibuffer-inactive-mode . emacs)
          (Info-mode . emacs)
          (term-mode . emacs)
          (log-edit-mode . emacs)
          (inf-ruby-mode . emacs)
          (yari-mode . emacs)
          (flycheck-error-list-mode . emacs)
          (erc-mode . emacs)
          (gud-mode . emacs)
          (help-mode . emacs)
          (eshell-mode . emacs)
          (shell-mode . emacs)
          (rst-mode . emacs)
          (magit-log-edit-mode . emacs)
          (fundamental-mode . emacs)
          (gtags-select-mode . emacs)
          (weibo-timeline-mode . emacs)
          (elfeed-search-mode . emacs)
          (git-rebase-mode . emacs)
          (weibo-post-mode . emacs)
          (sr-mode . emacs)
          (dired-mode . normal)
          (compilation-mode . emacs)
          (speedbar-mode . emacs)
          (magit-cherry-mode . emacs)
          (magit-commit-mode . normal)
          (magit-status-mode . emacs)
          (magit-blame-mode . emacs)
          (rtags-mode . emacs)
          (js2-error-buffer-mode . emacs)
          (mu4e~update-mail-mode . emacs)
          (mu4e-about-mode . emacs)
          (epa-key-list-mode . emacs)
          (magit-commit-mode . emacs)
          (diff-mode . emacs)
          (makey-key-mode . emacs)
          (srefactor-ui-menu-mode . emacs)
          (eww-mode . emacs)
          (elfeed-show-mode . emacs)
          (fundamental-mode . normal)
          (weibo-image-mode . emacs)
          (sx-question-list-mode . emacs)
          (sx-question-mode . emacs))
        do (evil-set-initial-state mode state))
  
  (global-company-mode t)
  (setq powerline-default-separator 'arrow)
  (menu-bar-mode t)
  (setq-default yas-prompt-functions '(yas-ido-prompt yas-dropdown-prompt))
  ;; See https://github.com/bbatsov/prelude/pull/670 for a detailed
  ;; discussion of these options.
  (setq helm-split-window-in-side-p           t
        helm-move-to-line-cycle-in-source     t
        helm-ff-search-library-in-sexp        t
        helm-ff-file-name-history-use-recentf t)
  (evil-leader/set-key-for-mode 'c++-mode
    "mtr" 'rtags-find-references
    "mts" 'rtags-find-symbol
    "mti" 'rtags-imenu
    "mtf" 'rtags-find-file
    "mtv" 'rtags-find-virtuals-at-point)
  (diminish 'global-whitespace-mode)
  (require 'yasnippet)
  (add-to-list 'yas/root-directory "~/.emacs.d/yasnippet-snippets/")
  (setq right-fringe-width 10)
  (global-set-key (kbd "s-s") 'save-buffer)
  (global-set-key (kbd "C-c SPC") 'avy-goto-char-2)
  (evil-leader/set-key "fR" 'rename-file-and-buffer)
  (define-key evil-insert-state-map (kbd "C-y") 'lispy-yank)
  (define-key evil-insert-state-map (kbd "C-d") 'lispy-delete)
  (define-key evil-insert-state-map (kbd "C-p") 'previous-line)
  (define-key yas-minor-mode-map (kbd "TAB") 'yas-expand)
  (if (executable-find "gls")
      (setq insert-directory-program (executable-find "gls")))
  (set-variable 'ycmd-server-command `("python" ,(expand-file-name  "~/Github/ycmd/ycmd/__main__.py")))
  (evil-leader/set-key "pf" 'helm-ls-git-ls)
  (setq flycheck-display-errors-function 'flycheck-display-error-messages)
  ;; the solution is not perfect, maybe I should wait for the spacemacs author
  ;; to fix the issue
  (delete 'company-c-headers company-backends-c-mode-common)
  (delete 'company-clang company-backends-c-mode-common)
  (push 'company-c-headers company-backends-c-mode-common))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ahs-case-fold-search nil)
 '(ahs-default-range (quote ahs-range-whole-buffer))
 '(ahs-idle-interval 0.25)
 '(ahs-idle-timer 0 t)
 '(ahs-inhibit-face-list nil)
 '(magit-use-overlays nil)
 '(org-agenda-custom-commands nil)
 '(org-agenda-files
   (quote
    ("~/org-notes/gtd.org" "~/org-notes/emacs.org" "~/org-notes/cocos2d-x.org" "~/org-notes/notes.org" "~/org-notes/learning.org" "~/org-notes/vim.org" "~/org-notes/journal.org")))
 '(org-agenda-ndays 1)
 '(org-agenda-show-all-dates t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-skip-deadline-prewarning-if-scheduled t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-start-on-weekday nil)
 '(org-deadline-warning-days 14)
 '(org-fast-tag-selection-single-key (quote expert))
 '(org-reverse-note-order t)
 '(paradox-github-token t)
 '(ring-bell-function (quote ignore) t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(git-gutter-fr:added ((t (:foreground "#859900" :weight bold :width extra-expanded))))
 '(helm-ls-git-modified-and-staged-face ((t (:foreground "dark cyan"))))
 '(helm-ls-git-modified-not-staged-face ((t (:foreground "dark cyan"))))
 '(helm-ls-git-renamed-modified-face ((t (:foreground "dark cyan")))))
