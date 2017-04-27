(require 'verilog-mode)

;; Verilog-mode
;; (setq auto-mode-alist (cons '("\\.v\\'" . verilog-mode) auto-mode-alist))
;; (setq auto-mode-alist (cons '("\\.tb\\'" . verilog-mode) auto-mode-alist))

(add-hook 'verilog-mode-hook '(lambda ()
				;; (setq-default indent-tabs-mode nil)
				(setq indent-tabs-mode nil)
				;; (setq-default tab-width 4)
				(setq tab-width 4)
                                (font-lock-mode 1)
                                (electric-pair-mode t)
                                (add-to-list 'electric-pair-pairs '(?[ . ?]))
                                (electric-indent-mode t)
                                ))

(add-hook 'verilog-mode-hook '(lambda ()
  (add-hook 'write-file-functions (lambda()
     (untabify (point-min) (point-max))
     nil))))

;; (setq verilog-indent-level             8
;;       verilog-indent-level-module      8
;;       verilog-indent-level-declaration 8
;;       verilog-indent-level-behavioral  8
;;       verilog-indent-level-directive   8)

;; (custom-set-variables
;;  '(verilog-align-ifelse t)
;;  '(verilog-auto-delete-trailing-whitespace t)
;;  '(verilog-auto-inst-param-value t)
;;  '(verilog-auto-inst-vector nil)
;;  '(verilog-auto-lineup (quote all))
;;  '(verilog-auto-newline nil)
;;  '(verilog-auto-save-policy nil)
;;  '(verilog-auto-template-warn-unused t)
;;  '(verilog-case-indent 2)
;;  '(verilog-cexp-indent 2)
;;  '(verilog-highlight-grouping-keywords t)
;;  '(verilog-highlight-modules t)
;;  '(verilog-indent-level 2)
;;  '(verilog-indent-level-behavioral 2)
;;  '(verilog-indent-level-declaration 2)
;;  '(verilog-indent-level-module 2)
;;  '(verilog-tab-to-comment t))

;;;;;;;;;;;;;;;;;
;; INDENTATION ;;
;;;;;;;;;;;;;;;;;
;; (setq verilog-indent-level             4 ; if else
;;       verilog-indent-level-module      3 ; after module declaration
;;       verilog-indent-level-declaration 3 ; ?
;;       verilog-indent-level-behavioral  3 ; ?
;;       verilog-indent-level-directive   1 ; ?
;;       verilog-case-indent              2
;;       ;; Close parentheses' indentation of module
;;       verilog-cexp-indent              2
;;       ;; changed t -> nil to remove indentation during specifying module args
;;       verilog-indent-lists t; default is t
;;       )

;; (setq verilog-auto-newline             t
;;       verilog-auto-indent-on-newline   t
;;       verilog-tab-always-indent        t
;;       verilog-auto-endcomments         t
;;       verilog-minimum-comment-distance 40
;;       verilog-indent-begin-after-if    t
;;       verilog-auto-lineup              'declarations
;;       verilog-highlight-p1800-keywords t
;;       verilog-highlight-grouping-keywords t
;;       verilog-highlight-modules t
;;       verilog-indent-declaration-macros t
;;       verilog-auto-delete-trailing-whitespace t)

;; (setq verilog-align-ifelse t
;;       verilog-auto-delete-trailing-whitespace t
;;       verilog-auto-inst-param-value t
;;       verilog-auto-inst-vector nil
;;       verilog-auto-lineup (quote all)
;;       verilog-auto-newline t
;;       verilog-auto-save-policy nil
;;       verilog-auto-template-warn-unused t
;;       verilog-case-indent 8
;;       verilog-cexp-indent 8
;;       verilog-highlight-grouping-keywords t
;;       verilog-highlight-modules t
;;       verilog-indent-level 8
;;       verilog-indent-level-behavioral 8
;;       verilog-indent-level-declaration 8
;;       verilog-indent-level-module 8
;;       verilog-tab-to-comment nil)

;; (setq verilog-indent-level 4
;;       verilog-indent-level-module 4
;;       verilog-indent-level-declaration 4
;;       verilog-indent-level-behavioral 4
;;       verilog-indent-level-directive 4
;;       verilog-case-indent 0
;;       verilog-cexp-indent 4
;;       verilog-tab-always-indent t
;;       verilog-indent-lists nil
;;       verilog-indent-begin-after-if nil
;;       verilog-minimum-comment-distance 0
;;       verilog-auto-endcomments nil
;;       verilog-auto-lineup 'declarations)
;; (setq show-trailing-whitespace t)

;;;--------------------------------------------------------------------
;;; Verilog mode (verilog-mode.el)
;;; まだnatureやdiscipline関係のインデントを誤判定してしまう．
;;;--------------------------------------------------------------------
;;; C-;にインデント付きの改行をアサイン．
;; (add-hook 'verilog-mode-hook
;; 		  '(lambda ()
;; 			 ;; デフォルトでは\C-jはアサインされていないようなのでそのまま．
;; 			 ;; (define-key matlab-mode-map "\C-j" 'ce-next-line)
;; 			 ;; Returnはデフォルトの設定'electric-verilog-terminate-and-indent
;; 			 ;; で支障が出てないのでそのまま．
;; 			 ;; (define-key verilog-mode-map [return] 'newline)
;; 			 ;; (define-key verilog-mode-map [(control \;)] 'electric-verilog-terminate-and-indent)
;; 			 ;; 'newlineと使い分ける必要が出てくるかもしれないので，\C-;を使う．
;; 			 ;; (define-key verilog-mode-map [(control \;)] 'electric-verilog-terminate-line)
;; 			 (define-key verilog-mode-map (kbd "C-;") 'recenter-top-bottom)
;; 			 )
;; )

;; User customization
;; (setq verilog-indent-level             3
;; 	  verilog-indent-level-module      3
;; 	  verilog-indent-level-declaration 3
;; 	  verilog-indent-level-behavioral  3
;; 	  verilog-indent-level-directive   1
;; 	  verilog-case-indent              2
;; 	  verilog-auto-newline             nil ;Changed
;; 	  verilog-auto-indent-on-newline   t
;; 	  verilog-tab-always-indent        t
;; 	  verilog-auto-endcomments         t
;; 	  verilog-minimum-comment-distance 40
;; 	  verilog-indent-begin-after-if    t
;; 	  verilog-auto-lineup              'all ;'declarations => 'all
;; 	  verilog-highlight-p1800-keywords nil
;; 	  verilog-linter                   "my_lint_shell_command"
;; 	  )

;; (autoload 'verilog-mode "verilog-mode" "Verilog mode" t)
;; (setq auto-mode-alist
;; 	  (append '(("\\.v$"       . verilog-mode)
;; 				("\\.f$"       . verilog-mode)
;; 				("\\.sv$"      . verilog-mode)
;; 				("\\.vinc$"    . verilog-mode)
;; 				;; ("\\.va$"      . verilog-mode)
;; 				("\\.vams$"    . verilog-mode)
;; 				("\\.vt*$"     . verilog-mode)
;; 				("\\.vh*$"     . verilog-mode)
;; 				("\\.verilog$" . verilog-mode)
;; 				("\\.verimix$" . verilog-mode)
;; 				)
;; 			  auto-mode-alist))

;; bind the .v files with verilog-mdoe
(autoload 'verilog-mode "verilog-mode" "Verilog mode" t )
(add-to-list 'auto-mode-alist '("\\.[ds]?vh?\\'" . verilog-mode))

;; (setq verilog-indent-level             8
;;       verilog-indent-level-module      8
;;       verilog-indent-level-declaration 8
;;       verilog-indent-level-behavioral  8
;;       verilog-indent-level-directive   0
;;       verilog-case-indent              0
;;       verilog-cexp-indent              8
;;       verilog-if-indent                8
;;       verilog-auto-newline             nil
;;       verilog-auto-indent-on-newline   t
;;       verilog-tab-always-indent        t
;;       verilog-auto-endcomments         t
;;       verilog-minimum-comment-distance 40
;;       verilog-indent-begin-after-if    nil
;;       verilog-auto-lineup              'declarations
;;       verilog-highlight-p1800-keywords nil
;;       verilog-linter			 "my_lint_shell_command"
;;       verilog-auto-delete-trailing-whitespace t
;;       )

;; (setq verilog-indent-level             4
;;       verilog-indent-level-module      0
;;       verilog-indent-level-declaration 0
;;       verilog-indent-level-behavioral  4
;;       verilog-indent-level-directive   0
;;       verilog-case-indent              4
;;       verilog-cexp-indent              4
;;       verilog-if-indent                4
;;       verilog-auto-newline             nil
;;       verilog-auto-indent-on-newline   t
;;       verilog-tab-always-indent        t
;;       verilog-auto-endcomments         t
;;       verilog-minimum-comment-distance 40
;;       verilog-indent-begin-after-if    t
;;       verilog-auto-lineup              'declarations
;;       verilog-highlight-p1800-keywords nil
;;       verilog-linter			 "my_lint_shell_command"
;;       verilog-auto-delete-trailing-whitespace t
;;       )

;; mor1kx setting
(setq verilog-indent-level             3
      verilog-indent-level-module      3
      verilog-indent-level-declaration 3
      verilog-indent-level-behavioral  3
      verilog-indent-level-directive   0
      verilog-case-indent              2
      verilog-cexp-indent              2
      verilog-if-indent                2
      verilog-auto-newline             nil
      verilog-auto-indent-on-newline   t
      verilog-tab-always-indent        t
      verilog-auto-endcomments         t
      verilog-minimum-comment-distance 40
      verilog-indent-begin-after-if    t
      verilog-auto-lineup              'declarations
      verilog-highlight-p1800-keywords nil
      verilog-linter			 "my_lint_shell_command"
      verilog-auto-delete-trailing-whitespace t
      )

;; open auto-complete-mode when open .v files
(add-hook 'verilog-mode-hook 'auto-complete-mode)

;; Colorize numbers
(font-lock-add-keywords
 'verilog-mode
 '(("\\(\\<[1-9][0-9_]*\\)?'h[0-9_a-fxz]+\\>" . font-lock-string-face)   ; hex
   ("\\(\\<[1-9][0-9_]*\\)?'d[0-9_xz]+\\>"    . font-lock-string-face)   ; decimal
   ("\\(\\<[1-9][0-9_]*\\)?'o[0-7_xz]+\\>"    . font-lock-string-face)   ; octal
   ("\\(\\<[1-9][0-9_]*\\)?'b[01_xz]+\\>"     . font-lock-string-face)   ; binary
   ("\\<[0-9][0-9_]*\\>"                      . font-lock-string-face))) ; none
