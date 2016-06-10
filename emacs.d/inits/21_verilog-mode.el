(require 'verilog-mode)

;; Verilog-mode
(setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.tb\\'" . verilog-mode) auto-mode-alist))

(add-hook 'verilog-mode-hook '(lambda ()
                                (font-lock-mode 1)
                                (electric-pair-mode t)
                                (add-to-list 'electric-pair-pairs '(?[ . ?]))
                                (electric-indent-mode t)
                                ))

(setq verilog-indent-level             8
      verilog-indent-level-module      8
      verilog-indent-level-declaration 8
      verilog-indent-level-behavioral  8
      verilog-indent-level-directive   8)
