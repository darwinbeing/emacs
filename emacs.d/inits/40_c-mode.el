;;; for c-mode

;; (package-install 'google-c-style)
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-hook
          #'(lambda ()
             (setq c-basic-offset 8)))

(add-hook 'c-mode-common-hook
	  #'(lambda()
	     (c-toggle-auto-hungry-state)))
