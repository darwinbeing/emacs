;;; for c++-mode

; (package-install 'google-c-style)
(require 'google-c-style)
(add-hook 'c++-mode-common-hook 'google-set-c-style)

(defadvice c-lineup-arglist (around my activate)
  "Improve indentation of continued C++11 lambda function opened as argument."
  (setq ad-return-value
        (if (and (equal major-mode 'c++-mode)
                 (ignore-errors
                   (save-excursion
                     (goto-char (c-langelem-pos langelem))
                     ;; Detect "[...](" or "[...]{". preceded by "," or "(",
                     ;;   and with unclosed brace.
                     (looking-at ".*[(,][ \t]*\\[[^]]*\\][ \t]*[({][^}]*$"))))
            0                           ; no additional indent
          ad-do-it)))                   ; default behavior

;; (add-hook 'c++-mode-hook
;; 	  #'(lambda()
;; 	     (setq c-basic-offset 8)))

(add-hook 'c++-mode-hook
	  #'(lambda ()
	     (setq c-indent-level 2)
	     (setq c-basic-offset 2)
	     (setq tab-width 2)
	     ;; (setq-default tab-width 2)
	     (setq indent-tabs-mode nil))
	  )

(add-hook 'c++-mode-common-hook
	  #'(lambda()
	     (c-toggle-auto-hungry-state)))
