;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Zigameni"
      user-mail-address "shehu.meni@gmail.com")


;;===================================================
(defun ziga/random-quote ()
  (let ((quotes '(
                  "\"Faber est suae quisque fortunae. \n Every man is the artisan of his own fortune. - Appius Claudius Caecus\""
                  "\"Vitam regit fortuna, non sapientia. \n Life is governed by fortune, not wisdom. - Marcus Tullius Cicero\""
                  "\"Nullus est liber tam malus ut non aliqua parte prosit. \n No book is so bad that it is not profitable in some part. - Pliny the Elder\""
                  "\"Homines dum docent discunt. \n Even while they teach, men learn. - Seneca the Younger\""
                  "\"Fortes fortuna adiuvat. \n Fortune favors the bold. - Terence\""
                  "\"Dum spiro, spero. \n While I breathe, I hope. - Cicero\""
                  "\"Vita brevis, ars longa. \n Life is short, craft long. - Hippocrates\""
                  "\"Non scholae sed vitae discimus. \n We learn not for school, but for life. - Seneca the Younger\""
                  "\"Scientia potentia est. \n Knowledge is power. - Francis Bacon (Latin proverb)\""
                  "\"Per aspera ad astra. \n Through hardships to the stars. - Seneca the Younger\"")))
    (nth (random (length quotes)) quotes)))

(defun custom_banner ()
  (let* ((banner
          '(""
            "▒███████▒ ██▓  ▄████  ▄▄▄       ███▄ ▄███▓▓█████  ███▄    █  ██▓ "
            "▒ ▒ ▒ ▄▀░▓██▒ ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀  ██ ▀█   █ ▓██▒ "
            "░ ▒ ▄▀▒░ ▒██▒▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███   ▓██  ▀█ ██▒▒██▒ "
            "  ▄▀▒   ░░██░░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄ ▓██▒  ▐▌██▒░██░ "
            "▒███████▒░██░░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒▒██░   ▓██░░██░ "
            "░▒▒ ▓░▒░▒░▓   ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░░ ▒░   ▒ ▒ ░▓   "
            "░░▒ ▒ ░ ▒ ▒ ░  ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░░ ░░   ░ ▒░ ▒ ░ "
            "░ ░ ░ ░ ░ ▒ ░░ ░   ░   ░   ▒   ░      ░      ░      ░   ░ ░  ▒ ░ "
            "  ░ ░     ░        ░       ░  ░       ░      ░  ░         ░  ░   "))
         (longest-line (apply #'max (mapcar #'length banner))))
    ;; Display the ASCII banner
    (put-text-property
     (point)
     (dolist (line banner (point))
       (insert (+doom-dashboard--center
                +doom-dashboard--width
                (concat line (make-string (max 0 (- longest-line (length line))) 32)))
               "\n"))
     'face 'doom-dashboard-banner)

    ;; Add an empty line as separator
    (insert "\n")

    ;; Display the random quote centered
    (let ((quote-line (ziga/random-quote)))
      (insert (+doom-dashboard--center
               +doom-dashboard--width
               quote-line)
              "\n"))))

(setq +doom-dashboard-ascii-banner-fn #'custom_banner)

;;===================================================
;;
;;



;; (defun custom_banner ()
;;   (let* (
;;          (banner
;;           '(""
;;             "▒███████▒ ██▓  ▄████  ▄▄▄       ███▄ ▄███▓▓█████  ███▄    █  ██▓ "
;;             "▒ ▒ ▒ ▄▀░▓██▒ ██▒ ▀█▒▒████▄    ▓██▒▀█▀ ██▒▓█   ▀  ██ ▀█   █ ▓██▒ "
;;             "░ ▒ ▄▀▒░ ▒██▒▒██░▄▄▄░▒██  ▀█▄  ▓██    ▓██░▒███   ▓██  ▀█ ██▒▒██▒ "
;;             "  ▄▀▒   ░░██░░▓█  ██▓░██▄▄▄▄██ ▒██    ▒██ ▒▓█  ▄ ▓██▒  ▐▌██▒░██░ "
;;             "▒███████▒░██░░▒▓███▀▒ ▓█   ▓██▒▒██▒   ░██▒░▒████▒▒██░   ▓██░░██░ "
;;             "░▒▒ ▓░▒░▒░▓   ░▒   ▒  ▒▒   ▓▒█░░ ▒░   ░  ░░░ ▒░ ░░ ▒░   ▒ ▒ ░▓   "
;;             "░░▒ ▒ ░ ▒ ▒ ░  ░   ░   ▒   ▒▒ ░░  ░      ░ ░ ░  ░░ ░░   ░ ▒░ ▒ ░ "
;;             "░ ░ ░ ░ ░ ▒ ░░ ░   ░   ░   ▒   ░      ░      ░      ░   ░ ░  ▒ ░ "
;;             "  ░ ░     ░        ░       ░  ░       ░      ░  ░         ░  ░   "))
;;          (longest-line (apply #'max (mapcar #'length banner))))
;;     (put-text-property
;;      (point)
;;      (dolist (line banner (point))
;;        (insert (+doom-dashboard--center
;;                 +doom-dashboard--width
;;                 (concat line (make-string (max 0 (- longest-line (length line))) 32)))
;;                "\n"))
;;      'face 'doom-dashboard-banner))
;;   )

;; (setq +doom-dashboard-ascii-banner-fn #'custom_banner)


;;
;;
;;
;;==================================================

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

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-old-hope)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Dev/org/")
(load! "org") ;; loads org.el from the same folder as config.el


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

;; Set default dir
(setq default-directory "~/")

;; Line numbers
(setq display-line-numbers-type 'relative)

;; Show matching parens
(show-paren-mode 1)

;; Better scrolling
(setq scroll-margin 8
      scroll-conservatively 100)

;; Set transparency (range: 0-100, 100 = fully opaque)
(add-to-list 'default-frame-alist '(alpha-background . 90))   ; Default for new frames




;; Drag stuff keys
(use-package! drag-stuff
  :config
  (drag-stuff-global-mode 1)
  (drag-stuff-define-keys))  ; enables the default M-arrow keybindings

;; Treemacs customization (commented out)
;; (after! treemacs
;;   (setq treemacs-show-hidden-files t
;;         treemacs-width 35
;;         treemacs-indentation 2
;;         treemacs-position 'left
;;         treemacs-file-event-delay 1000))

;; Enable nerd-icons for treemacs (commented out)
;; (use-package treemacs-nerd-icons
;;   :after treemacs
;;   :config
;;   (treemacs-load-theme "nerd-icons"))

;; Enable icons for dired
(use-package! all-the-icons-dired
  :after all-the-icons
  :hook (dired-mode . all-the-icons-dired-mode))

;; Enable icons for completion
(use-package! all-the-icons-completion
  :after all-the-icons
  :config
  (all-the-icons-completion-mode))

;; Neotree configuration with doom-themes integration
(after! doom-themes
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (setq doom-themes-neotree-file-icons t)
  (doom-themes-neotree-config))

(after! neotree
  ;; Use the doom-themes icons
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow)
        neo-smart-open t
        neo-show-hidden-files t
        neo-window-width 30
        neo-window-fixed-size nil
        neo-autorefresh t
        inhibit-compacting-font-caches t
        projectile-switch-project-action 'neotree-projectile-action)

  ;; truncate long file names in neotree
  (add-hook 'neo-after-create-hook
            #'(lambda (_)
                (with-current-buffer (get-buffer neo-buffer-name)
                  (setq truncate-lines t)
                  (setq word-wrap nil)
                  (make-local-variable 'auto-hscroll-mode)
                  (setq auto-hscroll-mode nil)))))

;; Set neotree keybinding to match common IDEs
(map! :leader
      :desc "Toggle neotree" "t n" #'neotree-toggle)

;; Diagnostic function using all-the-icons instead of nerd-icons
(defun check-icons-fonts ()
  "Check if all-the-icons fonts are properly installed."
  (interactive)
  (let ((font-installed (find-font (font-spec :name "all-the-icons"))))
    (if font-installed
        (message "Icon fonts are installed: %s" (font-get font-installed :name))
      (message "Icon fonts are NOT installed. Run M-x all-the-icons-install-fonts"))))

;; Add key binding for the diagnostic function
(map! :leader
      :desc "Check icon fonts" "i n" #'check-icons-fonts)

;; Function to display a grid of icons to visually check if fonts are working
(defun display-icons-test ()
  "Display a buffer with a grid of icons to test font installation."
  (interactive)
  (let ((buf (get-buffer-create "*Icons Test*")))
    (with-current-buffer buf
      (erase-buffer)
      (insert "All-The-Icons Font Test\n\n")
      (insert "If you see boxes or question marks instead of icons, the fonts are not installed correctly.\n\n")

      (insert "File icons:\n")
      (insert (all-the-icons-faicon "file-o") " ")
      (insert (all-the-icons-faicon "file-text-o") " ")
      (insert (all-the-icons-faicon "file-code-o") " ")
      (insert (all-the-icons-faicon "file-pdf-o") " ")
      (insert (all-the-icons-faicon "file-image-o") "\n\n")

      (insert "Folder icons:\n")
      (insert (all-the-icons-faicon "folder") " ")
      (insert (all-the-icons-faicon "folder-open") " ")
      (insert (all-the-icons-octicon "file-directory") " ")
      (insert (all-the-icons-octicon "file-submodule") "\n\n")

      (insert "Dev icons:\n")
      (insert (all-the-icons-alltheicon "javascript") " ")
      (insert (all-the-icons-alltheicon "python") " ")
      (insert (all-the-icons-alltheicon "html5") " ")
      (insert (all-the-icons-alltheicon "css3") " ")
      (insert (all-the-icons-alltheicon "git") "\n\n")

      (insert "Weather icons:\n")
      (insert (all-the-icons-wicon "day-sunny") " ")
      (insert (all-the-icons-wicon "cloudy") " ")
      (insert (all-the-icons-wicon "rain") " ")
      (insert (all-the-icons-wicon "snow") " ")
      (insert (all-the-icons-wicon "lightning") "\n\n"))
    (switch-to-buffer buf)
    (read-only-mode)))

(map! :leader
      :desc "Display icons test" "i N" #'display-icons-test)

;; Web Development Configuration
;; ============================

;; JavaScript/TypeScript Configuration
(after! typescript-mode
  (setq typescript-indent-level 2))

(after! js2-mode
  (setq js-indent-level 2
        js2-basic-offset 2))

;; Web mode configuration
(after! web-mode
  (setq web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-script-padding 2
        web-mode-style-padding 2
        web-mode-block-padding 2
        web-mode-attr-indent-offset 2
        web-mode-enable-auto-pairing t
        web-mode-enable-css-colorization t
        web-mode-enable-current-element-highlight t
        web-mode-enable-auto-indentation t
        web-mode-enable-auto-closing t
        web-mode-enable-auto-expanding t
        web-mode-content-types-alist '(("jsx" . "\\.js[x]?\\'")
                                       ("tsx" . "\\.ts[x]?\\'"))))

;; Format with prettier on save
(use-package! prettier-js
  :hook ((js2-mode . prettier-js-mode)
         (typescript-mode . prettier-js-mode)
         (web-mode . prettier-js-mode)
         (css-mode . prettier-js-mode)))

;; Refactoring tools
(use-package! js2-refactor
  :hook (js2-mode . js2-refactor-mode)
  :config
  (map! :map js2-mode-map
        :localleader
        (:prefix ("r" . "refactor")
                 "ee" #'js2r-expand-node-at-point
                 "cc" #'js2r-contract-node-at-point
                 "ef" #'js2r-extract-function
                 "em" #'js2r-extract-method
                 "tf" #'js2r-toggle-function-expression-and-declaration
                 "ta" #'js2r-toggle-arrow-function-and-expression
                 "ip" #'js2r-introduce-parameter
                 "lp" #'js2r-localize-parameter
                 "iv" #'js2r-inline-var
                 "rv" #'js2r-rename-var
                 "vt" #'js2r-var-to-this
                 "sv" #'js2r-split-var-declaration)))

;; Add node_modules/.bin to exec-path
(use-package! add-node-modules-path
  :hook ((js2-mode typescript-mode web-mode css-mode json-mode) . add-node-modules-path))

;; NPM mode for convenient npm commands
(use-package! npm-mode
  :hook ((js-mode typescript-mode web-mode) . npm-mode)
  :config
  (map! :map npm-mode-keymap
        :localleader
        "n" #'npm-mode-npm-init
        "i" #'npm-mode-npm-install
        "s" #'npm-mode-npm-install-save
        "d" #'npm-mode-npm-install-save-dev
        "u" #'npm-mode-npm-uninstall
        "r" #'npm-mode-npm-run
        "l" #'npm-mode-npm-list))


;; LSP performance
(after! lsp-mode
  (setq lsp-idle-delay 0.5
        lsp-enable-symbol-highlighting t
        lsp-enable-snippet t
        lsp-completion-enable t
        lsp-completion-show-detail t
        lsp-modeline-code-actions-enable t
        lsp-signature-auto-activate t
        lsp-signature-render-documentation t
        lsp-headerline-breadcrumb-enable t
        lsp-ui-sideline-enable t
        lsp-ui-doc-enable t))

(after! lsp-ui
  (setq lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-doc-position 'at-point
        lsp-ui-doc-max-width 80
        lsp-ui-doc-max-height 25))

;; Jest for JavaScript/TypeScript testing
(use-package! jest
  :hook ((js2-mode typescript-mode) . jest-minor-mode)
  :config
  (setq jest-executable "npx jest"))

;; Smarter React snippets
(after! yasnippet
  (add-hook! (js2-mode typescript-mode web-mode)
    (require 'react-snippets)))

;; Add a specific Next.js mode
(add-to-list 'auto-mode-alist '("\\.jsx?$" . js2-jsx-mode))
(add-to-list 'auto-mode-alist '("\\.tsx?$" . typescript-tsx-mode))
(add-to-list 'auto-mode-alist '("next\\.config\\.js$" . js2-mode))

;; Quick access to package.json
(defun find-package-json ()
  "Find package.json in the project root."
  (interactive)
  (let ((package-json (concat (doom-project-root) "package.json")))
    (if (file-exists-p package-json)
        (find-file package-json)
      (message "package.json not found in project root"))))

(map! :leader
      (:prefix ("p" . "project")
       :desc "Find package.json" "j" #'find-package-json))

(use-package! vertico-posframe
  :after vertico
  :config
  (vertico-posframe-mode 1)
  ;; Optional tweaks for style:
  (setq vertico-posframe-parameters
        '((left-fringe . 8)
          (right-fringe . 8))))

