;; org.el
(setq org-agenda-files
      '("~/Dev/org/Courses/Schedule.org"
        ))

(setq org-log-done 'time)
(setq org-agenda-start-on-weekday 1)
(setq org-agenda-span '21)

;; ORG Configs
(setq org-directory "~/Dev/org")
(setq org-roam-directory "~/Dev/org")

;; Simplified org-roam config to troubleshoot
(after! org
  (use-package! org-roam
    :custom
    (org-roam-dailies-directory "daily/")
    (org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory))
    :config
    ;; Start with manual sync until things work
    (setq org-roam-db-update-on-save t)))

(use-package! org-roam-ui
  :after org-roam
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))


;; ;; ORG Configs
;; (setq org-directory "~/Dev/org"
;;       org-roam-directory (file-truename "~/Dev/org"))
;;
;; (use-package! org-roam
;;   :after org
;;   :custom
;;   ;; Optional, set where you want dailies to go
;;   (org-roam-dailies-directory "daily/")
;;   ;; Explicitly set the database connector and location
;;   (org-roam-database-connector 'sqlite)
;;   (org-roam-db-location (expand-file-name "org-roam.db" org-roam-directory))
;;   :config
;;   ;; Try manually syncing first instead of auto-sync
;;   (org-roam-db-autosync-mode nil))

;; (use-package! org-roam-ui
;;   :after org-roam
;;   :config
;;   (setq org-roam-ui-sync-theme t
;;         org-roam-ui-follow t
;;         org-roam-ui-update-on-save t
;;         org-roam-ui-open-on-start nil))
