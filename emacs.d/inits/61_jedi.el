;; pythonの自動補完パッケージ

;; (package-install 'jedi)
;; (require 'jedi)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
