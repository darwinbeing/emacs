
;; (require-package 'color-theme)
(add-to-list 'load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(require 'color-theme-solarized)
;; (setq color-theme-is-global t)
(color-theme-initialize)
;; (color-theme-solarized-dark)
(color-theme-solarized-light)



;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)

;; (add-hook 'after-make-frame-functions
;;           (lambda (frame)
;;             (solarized-update-background-mode
;;              (if (display-graphic-p frame) 'light 'dark)
;;              (list frame))))
