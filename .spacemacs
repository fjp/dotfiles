;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     c-c++
     chrome
     emacs-lisp
     erc
     latex
     git
     gnus
     markdown
     org
     osx
     rcirc
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     spell-checking
     spotify
     syntax-checking
     themes-megapack
;;     w3m
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(w3m
                                      bbdb
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. (default t)
   dotspacemacs-check-for-update t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents projects)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(twilight-bright
                         twilight
                         tao-yang
                         tao-ying
                         leuven
                         spacemacs-dark
                         spacemacs-light
                         solarized-light
                         solarized-dark
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.3)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; (Not implemented) dotspacemacs-distinguish-gui-ret nil
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;;; osx stuff
  ;; get right alt behavior back
  (setq-default mac-right-option-modifier nil)
  ;; font
  ;; (set-face-attribute 'default nil :family "Source Code Pro")
  ;; (set-face-attribute 'default nil :height 155)

  ;; set global line numbers
  (setq-default dotspacemacs-line-numbers t)

  ;; git
  ;; display magit status buffer in fullscreen
  (defun dotspacemacs/user-init ()
    (setq-default git-enable-magit-svn-plugin t)
    )
  ;; use spacemacs as global git commit editor
  (global-git-commit-mode t)
  ;; follow symlinks if they are under version control
  (setq vc-follow-symlinks t)

  ;;; w3m configuration
  (setq w3m-home-page "http://www.google.com")
  ;; W3M Home Page
  (setq w3m-default-display-inline-images t)
  (setq w3m-default-toggle-inline-images t)
  ;; W3M default display images
  (setq w3m-command-arguments '("-cookie" "-F"))
  (setq w3m-use-cookies t)
  ;; W3M use cookies
  (setq browse-url-browser-function 'w3m-browse-url)
  ;; Browse url function use w3m
  (setq w3m-view-this-url-new-session-in-background t)
  ;; W3M view url new session in background

  ;;; gnus configuration
  ;; https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/gnus-guide-en.org
  (require 'nnir)

  ;; @see http://www.emacswiki.org/emacs/GnusGmail#toc1
  ;; (setq gnus-select-method '(nntp "news.gmane.org")) ;; if you read news groups (service gmane shutdown...)

  ;; ask encyption password once
  (setq epa-file-cache-passphrase-for-symmetric-encryption t)

  ;; @see http://gnus.org/manual/gnus_397.html
  (add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      ; @see http://www.gnu.org/software/emacs/manual/html_node/gnus/Expiring-Mail.html
                      ;; press 'E' to expire email
                      (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
                      (nnmail-expiry-wait 90)))

  (setq gnus-thread-sort-functions
        '((not gnus-thread-sort-by-date)
          (not gnus-thread-sort-by-number)))

  ;; NO 'passive
  (setq gnus-use-cache t)

  ;; BBDB: Address list
  (add-to-list 'load-path "/where/you/place/bbdb/")
  (require 'bbdb)
  (bbdb-initialize 'message 'gnus 'sendmail)
  (add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
  (setq bbdb/mail-auto-create-p t
        bbdb/news-auto-create-p t)

  ;; auto-complete emacs address using bbdb UI
  (add-hook 'message-mode-hook
            '(lambda ()
               (flyspell-mode t)
             (local-set-key "<TAB>" 'bbdb-complete-name)))

  ;; Fetch only part of the article if we can.
  ;; I saw this in someone's .gnus
  (setq gnus-read-active-file 'some)

  ;; open attachment
  (eval-after-load 'mailcap
    '(progn
       (cond
        ;; on OSX, maybe change mailcap-mime-data?
        ((eq system-type 'darwin))
        ;; on Windows, maybe change mailcap-mime-data?
        ((eq system-type 'windows-nt))
        (t
        ;; Linux, read ~/.mailcap
        (mailcap-parse-mailcaps)))));; Tree view for groups.  I like the organisational feel this has.

  (add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

  ;; Threads!  I hate reading un-threaded email -- especially mailing
  ;; lists.  This helps a ton!
  (setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject)

  ;; Also, I prefer to see only the top level message.  If a message has
  ;; several replies or is part of a thread, only show the first
  ;; messa  'gnus-thread-ignore-subject' will ignore the subject and
  ;; look at 'In-Reply-To:' and 'References:' headers.
  (setq gnus-thread-hide-subtree t)
  (setq gnus-thread-ignore-subject t)

  ;; Personal Information
  (setq user-full-name "Franz Pucher"
        user-mail-address "franz.pucher@gmail.com")

  ;; Read HTML mail
  ;; You need install the command line brower 'w3m' and Emacs plugin 'w3m'
  (setq mm-text-html-renderer 'w3m)

  ;; Setup to send email through SMTP
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        smtpmail-local-domain "homepc")
  ;; http://www.gnu.org/software/emacs/manual/html_node/gnus/_005b9_002e2_005d.html
  (setq gnus-use-correct-string-widths nil)

  (eval-after-load 'gnus-topic
    '(progn
       (setq gnus-message-archive-group '((format-time-string "sent.%Y")))
       (setq gnus-server-alist '(("archive" nnfolder "archive" (nnfolder-directory "~/Mail/archive")
                                  (nnfolder-active-file "~/Mail/archive/active")
                                  (nnfolder-get-new-mail nil)
                                  (nnfolder-inhibit-expiry t))))

       (setq gnus-topic-topology '(("Gnus" visible)
                                   (("misc" visible))
                                   (("gmail" visible))))

       (setq gnus-topic-alist '(("gmail" ; the key of topic
                                 "nnimap+gmail:BA"
                                 "nnimap+gmail:Me"
                                 "nnimap+gmail:Notes"
                                 "nnimap+gmail:Reisen"
                                 "nnimap+gmail:Social Networks"
                                 "nnimap+gmail:TUM/Mensa"
                                 "nnimap+gmail:TUM/TumFB"
                                 "nnimap+gmail:[Gmail]"
                                 "nnimap+gmail:[Gmail]/Spam"
                                 "nnimap+gmail:top"
                                 "nnimap+gmail:Beatport"
                                 "nnimap+gmail:Geocaching"
                                 "nnimap+gmail:Lukas"
                                 "nnimap+gmail:Netbanking"
                                 "nnimap+gmail:Privat"
                                 "nnimap+gmail:Reisen/australia"
                                 "nnimap+gmail:TUM"
                                 "nnimap+gmail:TUM/BA"
                                 "nnimap+gmail:TUM/Erasmus"
                                 "nnimap+gmail:[Gmail]/Entw\303\274rfe"
                                 "nnimap+gmail:[Gmail]/Gesendet"
                                 "nnimap+gmail:[Gmail]/Markiert"
                                 "nnimap+gmail:[Gmail]/Papierkorb"
                                 "nnimap+gmail:[Gmail]/Wichtig"
                                 "nnimap+gmail:[Gmail]/Alle Nachrichten"
                                        ;"nnimap+gmail:INBOX"
                                        ;"nnimap+gmail:[Gmail]/Sent Mail"
                                        ;"nnimap+gmail:[Gmail]/Trash"
                                        ;"nnimap+gmail:Sent Messages"
                                        ;"nnimap+gmail:Drafts"
                                 )
                                ("misc" ; the key of topic
                                 "nnfolder+archive:sent.2015-12"
                                 "nnfolder+archive:sent.2016"
                                 "nnfolder+archive:sent.2017"
                                 "nndraft:drafts")
                                ("Gnus")))))

  ;; rcirc
  (setq-default dotspacemacs-configuration-layers '(
    (rcirc :variables rcirc-enable-authinfo-support t)))

  (setq rcirc-server-alist
      '(("chat.freenode.net"
         :user "fjp"
         :port "8000"
         :channels ("#emacs"
                    "#mixxx"))))


  (setq debug-on-error t)
  ;; org configuration
  (add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|txt\\)$" . org-mode))

  (push (expand-file-name "~/git/dotfiles/") load-path)
  ;; include Bernt Hansen's key-binding
  (require 'org-mode-key-bindings)

  (with-eval-after-load 'org
    ;; here goes your Org config :)

    ;; enable shift-select-mode in org-mode
    (setq org-support-shift-select t)

    ;; disable line numbers in org files due to slowness
    (add-hook 'org-mode-hook 'spacemacs/toggle-line-numbers-off 'append)

    ;; disable indent on startup
    (setq org-startup-indented nil)

    ;; include Bernt Hansens GTD implementaiton
    ;;(add-to-list 'org-modules 'org-habit)
    (require 'org-mode-gtd)

    ;; agenda setup
    ;; org agenda files
    ;; (setq org-agenda-files '("~/Dropbox/org/tasks.org"
    ;;                          "~/Dropbox/org/projects.org"
    ;;                          "~/Dropbox/org/stuff.org"
    ;;                          "~/Dropbox/org/someday.org"
    ;;                          "~/Dropbox/org/references.org"
    ;;                          "~/Dropbox/org/isa.org"))

    )

  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(org-mode-line-clock ((t (:foreground "red" :box (:line-width -1 :style released-button))))))
