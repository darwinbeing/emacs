;;; for latex-mode

;; (package-install 'auctex)

(require 'tex-mik)
(require 'preview)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-on-reftex)
(add-hook 'latex-mode-hook 'turn-off-auto-fill)
(add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)
(setq reftex-plug-into-auctex t)
(setq TeX-PDF-mode t)

(add-hook 'LaTeX-mode-hook
	  (lambda()
	    (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex%(mode)%' %t" TeX-run-TeX nil t))
	    (setq TeX-command-default "XeLaTeX")
	    (setq TeX-save-query nil )
	    (setq TeX-show-compilation t)
	    ))
