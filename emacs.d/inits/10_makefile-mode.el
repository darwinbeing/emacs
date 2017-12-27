;;; for makefile-mode

(setq auto-mode-alist
      (append auto-mode-alist
	      '(
		("makefile"            . makefile-mode)
		("Makefile"            . makefile-mode)
		("\\.am$"              . makefile-mode)
		("\\.mk$"              . makefile-mode)
		("\\.mak$"             . makefile-mode)
		("\\.make$"            . makefile-mode)
		("Makefile\\."         . makefile-mode)
	       ) auto-mode-alist))

(add-hook 'makefile-mode-hook
          '(lambda ()
	     (setq-default indent-tabs-mode t)
             ))
