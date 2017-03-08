;;; for tcl-mode

(add-hook 'tcl-mode-hook
          (lambda ()
            (defvar tcl-indent-level)
            (setq tcl-indent-level tab-width)))
