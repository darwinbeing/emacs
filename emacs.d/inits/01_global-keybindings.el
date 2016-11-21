;;; 01-global-keybindings.el ---

(define-key ctl-x-map "n" 'goto-line)
(define-key ctl-x-map "\\" 'indent-region)
(define-key global-map (kbd "C-h") 'hs-toggle-hiding)
(define-key ctl-x-map "k"  'kill-current-line)

(global-set-key "\M-g" 'goto-line)
(global-set-key [f1]  'help-command)
(global-set-key [f2]  'save-buffer)
(global-set-key [f3]  'undo)
(global-set-key [f4]  'replace-string)
(global-set-key [f5]  'kdab-insert-header)
(global-set-key [f6]  'kdab-insert-forward-decl)
(global-set-key [f7]  'compile)
(global-set-key [f8]  'other-window)
(global-set-key [f9]  'find-file)
(global-set-key [f10] 'wb-line-number-toggle)
(global-set-key [f11] 'remove-ctl-m)
(global-set-key [f12] 'indent-region)
(global-set-key [home] 'beginning-of-line-or-non-whitespace)
(global-set-key (kbd "C-c l") 'add-change-log-entry-other-window)
(global-set-key "\C-x\C-x" 'kill-this-buffer)
(global-set-key (kbd "C-x d") 'ediff)

;; Linux
(global-set-key (kbd "<C-mouse-4>") 'text-scale-increase)
(global-set-key (kbd "<C-mouse-5>") 'text-scale-decrease)

;; MacOS/Windows
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;;;;苹果键位remap
;; (setq mac-command-modifier 'meta) ;映射苹果键
;; (setq mac-control-modifier 'control) ;映射Ctrl键
;; (setq mac-option-modifier 'alt) ;映射Alt键
