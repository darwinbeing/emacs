;;; load-path settings
(add-to-list 'load-path "~/.emacs.d/elpa")
(add-to-list 'load-path "~/.emacs.d/auto-install")

;;; load configuration scripts
(let* ((dir "~/.emacs.d/inits")
       (el-suffix "\\.el\\'")
       (files (mapcar
	       (lambda (path) (replace-regexp-in-string el-suffix "" path))
	       (directory-files dir t el-suffix))))
  (dolist (file files) (load file)))
