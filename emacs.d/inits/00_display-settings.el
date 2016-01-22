;;; display settings
;; Hide splash-screen and startup-message
;; (set-menubar nil)
;; (set-specifier menubar-visible-p nil)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(modify-frame-parameters nil '((wait-for-wm . nil)))

;; (set-frame-height (selected-frame) 50)
;; (set-frame-width (selected-frame) 110)

(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-support-mod 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)

(setq enable-recursive-minibuffers t)

;; (menu-bar-mode nil)
;; (tool-bar-mode nil)
;; (scroll-bar-mode nil)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq text-mode-hook '(lambda() (auto-fill-mode 1)))
(global-font-lock-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Chinese-GB")
 '(default-input-method "chinese-py-punct")
 '(global-font-lock-mode t nil (font-lock))
 '(safe-local-variable-values (quote ((add-log-time-format lambda nil (progn (setq tz (getenv "TZ")) (set-time-zone-rule "UTC") (setq time (format-time-string "%a %b %e %H:%M:%S %Z %Y" (current-time))) (set-time-zone-rule tz) time)))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "white" :background "black")))))

;; (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")

;;; font-lock settings
;; (set-face-foreground 'font-lock-comment-face "red1")
;; (if (<= emacs-major-version 21)
;;     (global-font-lock-mode t))

(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'c-mode-hook 'turn-on-font-lock)

(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))
