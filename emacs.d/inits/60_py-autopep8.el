;;; py-autopep8

;; (package-install 'py-autopep8)
;; (require 'py-autopep8)
(add-hook 'python-mode-hook
          '(lambda()
             (define-key python-mode-map (kbd "C-c F") 'py-autopep8)
             (define-key python-mode-map (kbd "C-c f") 'py-autopep8-region)))

;;(add-hook 'before-save-hook 'py-autopep8-before-save)
;;(setq py-autopep8-options '("--max-line-length=99"))
