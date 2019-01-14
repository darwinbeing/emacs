;;; 20_sh-mode.el --- shell script                   -*- lexical-binding: t; -*-

(add-hook 'shell-script-mode-hook
	  '(lambda ()
	     (setq c-basic-offset 8)
	     (setq tab-width 8)
	     (sh-indent-level 8)
	     (setq indent-tabs-mode t)
	     ))

(add-hook 'sh-script-mode-hook
	  '(lambda ()
	     (setq c-basic-offset 8)
	     (setq tab-width 8)
	     (sh-indent-level 8)
	     (setq indent-tabs-mode t)
	     ))
