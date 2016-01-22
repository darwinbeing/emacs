;;; ELPA settings

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;; (defvar my/favorite-packages
;;   '(
;;     auto-install
;;     google-c-style
;;     auto-complete
;;     s
;;     yasnippet
;;   ))

;; (dolist (package my/favorite-packages)
;;   (unless (package-installed-p package)
;; 	(package-install package)))
