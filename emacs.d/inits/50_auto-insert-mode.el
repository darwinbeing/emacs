;;; for auto-insert-mode
(require 'autoinsert)
(auto-insert-mode)
(setq auto-insert-directory "~/.emacs.d/templates/")
(setq auto-insert-query nil)
(define-auto-insert "\\.cpp" "template.cpp")
(add-hook 'find-file-hooks 'auto-insert)
