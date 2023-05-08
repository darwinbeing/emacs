;;; ELPA settings


(require 'package)
(setq package-enable-at-startup nil)
(setq package-archives
      '(("gnu" . "http://elpa.gnu.org/packages/")
        ("melpa" . "http://melpa.org/packages/")))
(package-initialize)

(defvar my/favorite-packages
  '(
    solarized-theme
    auctex
    color-theme
    s
    yasnippet
    auto-complete
    google-c-style
    scala-mode
  ))

(dolist (package my/favorite-packages)
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))
