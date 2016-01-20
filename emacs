;; F1  - emacs help
;; F2  - save buffer
;; F3  - undo
;; F4  - redo
;; F5  - comment
;; F6  - line to top of window
;; F7  - compile
;; F8  - other window
;; F9  - find file
;; F10 - toggle line number
;; F11 - remove all visible ^M's
;; F12 - indent region

;; Hide splash-screen and startup-message
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(modify-frame-parameters nil '((wait-for-wm . nil)))
;; (set-menubar nil)
;; (set-specifier menubar-visible-p nil)
;; (add-to-list 'load-path "/usr/share/emacs/misc")
(add-to-list 'load-path "~/.emacs.d")

;; (set-default-font "-adobe-courier-medium-r-normal--18-180-75-75-m-110-iso8859-1")
;; (set-frame-height (selected-frame) 50)
;; (set-frame-width (selected-frame) 110)

(setq visible-bell t)
(fset 'yes-or-no-p 'y-or-n-p)
(setq lazy-lock-defer-on-scrolling t)
(setq font-lock-support-mod 'lazy-lock-mode)
(setq font-lock-maximum-decoration t)

(setq enable-recursive-minibuffers t)
(setq inhibit-startup-message t)

;; (menu-bar-mode nil)
;; (tool-bar-mode nil)
;; (scroll-bar-mode nil)

(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(setq text-mode-hook '(lambda() (auto-fill-mode 1)))
(global-font-lock-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(current-language-environment "Chinese-GB")
 '(default-input-method "chinese-py-punct")
 '(global-font-lock-mode t nil (font-lock))
 '(safe-local-variable-values (quote ((add-log-time-format lambda nil (progn (setq tz (getenv "TZ")) (set-time-zone-rule "UTC") (setq time (format-time-string "%a %b %e %H:%M:%S %Z %Y" (current-time))) (set-time-zone-rule tz) time)))))
 '(save-place t nil (saveplace))
 '(show-paren-mode t nil (paren))
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:foreground "white" :background "black")))))

(add-hook 'emacs-lisp-mode-hook 'turn-on-font-lock)
(add-hook 'c-mode-hook 'turn-on-font-lock)

(add-hook 'c-mode-hook
	  '(lambda()
	     (c-set-style "k&r")
	     (setq c-basic-offset 8)))

;; (add-hook 'c++-mode-hook
;; 	  '(lambda()
;; 	     (c-set-style "stroustrup")))

(add-hook 'c++-mode-hook
	  '(lambda()
	     (c-set-style "k&r")
	     (setq c-basic-offset 8)))

(add-hook 'c-mode-hook
	  '(lambda()
	     (c-toggle-auto-hungry-state)))

(add-hook 'c++-mode-hook
	  '(lambda()
	     (c-toggle-auto-hungry-state)))

(transient-mark-mode t)

(define-key ctl-x-map "n" 'goto-line)
(define-key ctl-x-map "\\" 'indent-region)

(put 'upcase-region 'disabled nil)

(show-paren-mode t)
(setq show-paren-style 'parentheses)

(setq line-number-mode t)
(setq column-number-mode t)
(setq default-tab-with 8)

;;(global-set-key [(control tab)] 'senator-complete-symbol);
;;(global-set-key [(control tab)] 'senator-completion-menu-popup)
;;(global-set-key [(meat ?/)] 'semantic-ia-complete-symbol-menu)
;; (setq semanticdb-project-roots
;;       (list
;;        (expand-file-name "/")))
;; (load-file "/usr/share/emacs/cedet/common/cedet.el")

;;(setq-default abbrev-mode t)
(setq scroll-step 1
      scroll-margin 3
      scroll-conservatively 10000)
;;(setq scroll-conservatively 1)

;;set make-backup-files nil stops emacs from making backups of files
;; (setq make-backup-files nil)

;; (setq-default fill-column 72)
(set-cursor-color "red")
(set-mouse-color "goldenrod")
(set-face-background 'region "blue")
(set-background-color "black")
;; (menu-bar-mode nil)
(setq require-final-newline t)



;;===== Funtion to delete a line =====
;; (defvar previous-column nil "Save the column position")
;; (defun delete-current-line()
;;   "Kill an entire line, including the trailing newline character"
;;   (interactive)
;;   (setq previous-column (current-column))
;;   (end-of-line)
;;   (if (= (current-column) 0)
;;       (delete-char 1)
;;     (progn
;;       (beginning-of-line)
;;       (kill-line)
;;       (delete-char 1)
;;       (move-to-column previous-column))))
;; (define-key ctl-x-map "k" 'delete-current-line)

;;the buffer should not be auto-saved.
;;(setq buffer-auto-save-file-name t)

;;emacs deletes auto-save files when a true save is done.
;;(setq delete-auto-save-files t)
;;Esc-G runs the goto-line function.
(global-set-key "\M-g" 'goto-line)

;;(setq auto-save-default nil)
;;(setq auto-save-directory "/tmp/USERNAME")


;;put auto save files (ie #foo#) in one place, *not*
;;scattered all over the file system!
(defvar autosave-dir
  (concat "/tmp/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
	  (if buffer-file-name
	      (concat "#" (file-name-nondirectory buffer-file-name) "#")
	    (expand-file-name
	     (concat "#%" (buffer-name) "#")))))

;;put backup files (ie foo~) in one place too. (The backup-directory-alist
;;list contains regexp>=directory mappings; filenames matching a regexp are
;;backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "/tmp/emacs_backups/" (user-login-name) "/"))
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)
(setq backup-directory-alist (list (cons "." backup-dir)))
(setq backup-by-coping t)



;;(setq tags-file-name "/mnt/hda6/TAGS/TAGS")

;;Line to top of window
;;replace three keystroke sequence C-u 0 C-1
(defun line-to-top-of-window ()
  "Move the line point is on to top of window."
  (interactive)
  (recenter 0))

(defun remove-ctl-m ()
  (interactive)
  (beginning-of-buffer)
  (while (search-forward "\r" nil t)
  (replace-match "" nil t))
)

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

(require 'wb-line-number)
(set-scroll-bar-mode nil)
;;(wb-line-number-toggle)

;; (require 'klaralv)

(defun beginning-of-line-or-non-whitespace ()
  (interactive)
  (if (bolp)
      (back-to-indentation)
    (beginning-of-line)))
(global-set-key [home] 'beginning-of-line-or-non-whitespace)


(setq kill-whole-line t)

(defun kill-current-line ()
  (interactive)
  (beginning-of-line)
  (kill-line)
)
(define-key ctl-x-map "k"  'kill-current-line)
(global-set-key (kbd "C-c l") 'add-change-log-entry-other-window)

(display-time-mode t)
(setq display-time-24hr-format t)
(setq display-time-day-and-date t)
(setq display-time-interval 10)
(display-time)

(setq next-line-add-newlines nil)
(setq kill-ring-max 200)

;; (load "desktop")
;; (desktop-load-default)
;; (desktop-read)

 (load-library "saveplace")
 (make-directory "/tmp/saveplace" t)
 (make-directory "/tmp/shadowtodo" t)
 (setq save-place-file "/tmp/saveplace/file")
 (setq shadow-todo-file "/shadowtodo/file")

;; (setq mas-file-history-menu-path nil)
;; (setq mas-file-history-menu-title "History")
;; (with-temp-buffer)

(require 'saveplace)
(setq save-place-file "/tmp/saveplace/files")
(setq-default save-place t)

(defun linux-c-mode ()
  "C mode with adjusted defaults for use with the Linux kernel."
  (interactive)
  (c-mode)
  (setq c-indent-level 4)
  (setq c-brace-imaginary-offset 0)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 4)
  (setq c-label-offset -4)
  (setq c-continued-statement-offset 4)
  (c-set-style "K&R")
  (setq tab-width 8)
  (setq indent-tabs-mode t)
  (setq c-basic-offset 8))
(setq auto-mode-alist (cons '("/usr/src/linux.*/.*\\.[ch]$". linux-c-mode)
			    auto-mode-alist))


(global-set-key "\C-x\C-x" 'kill-this-buffer)


(setq track-eol t)

(require 'hl-line)
;(global-hl-line-mode t)


(defface hl-line '((t (:foreground "Black" :background "SlateGray3")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)
;(global-hl-line-mode t)


;(when (locate-library 'CC-mode)
;  (setq c-font-lock-keywords-3
;  (append '("signals" "\\(public\\|protected\\|private\\) slots")
;	  c-font-lock-keywords-3)))


;(require 'font-lock)
;; (setq c-C++access-key "\\<\\(slots\\|signals\\|private\\|protected\\|public\\)\\>[ \t]*[(slots\\|signals)]*[ \t]*:")
;; (font-lock-add-keywords 'c++-mode '(("\\<\\(Q_OBJECT\\|public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\)\\>" . font-lock-constant-face)))

;(c-add-style "qt-gnu" '("gnu"
;			(c-access-key .
;				      "\\<\\(slots\\|signals\\|private\\|protected\\|public\\)\\>[ \t]*[(slots\\|signals)]*[ \t]*:")
;			(c-basic-offset .4)))



;; (c-add-style "qt-gnu" '("gnu"
;;                         (c-access-key .
;; "\\<\\(signals\\|public\\|protected\\|private\\|public slots\\|protected slots\\|private slots\\):")
;;                          (c-basic-offset . 4)))


;; syntax-highlighting for Qt
 ;; (based on work by Arndt Gulbrandsen, Troll Tech)
 ;; (defun jk/c-mode-common-hook ()
 ;;   "Set up c-mode and related modes.

 ;; Includes support for Qt code (signal, slots and alikes)."

 ;;   ;; base-style
 ;;   (c-set-style "stroustrup")
 ;;   ;; set auto cr mode
 ;;   (c-toggle-auto-hungry-state 1)

 ;;   ;; qt keywords and stuff ...
 ;;   ;; set up indenting correctly for new qt kewords
 ;;   (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
 ;;                                  "\\|protected slot\\|private\\|private slot"
 ;;                                  "\\)\\>")
 ;;         c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
 ;;                                  "\\|public slots\\|protected slots\\|private slots"
 ;;                                  "\\)\\>[ \t]*:"))
 ;;   (progn
 ;;     ;; modify the colour of slots to match public, private, etc ...
 ;;     (font-lock-add-keywords 'c++-mode
 ;;                             '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
 ;;     ;; make new font for rest of qt keywords
 ;;     (make-face 'qt-keywords-face)
 ;;     (set-face-foreground 'qt-keywords-face "BlueViolet")
 ;;     ;; qt keywords
 ;;     (font-lock-add-keywords 'c++-mode
 ;;                             '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
 ;;     (font-lock-add-keywords 'c++-mode
 ;;                             '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
 ;;     (font-lock-add-keywords 'c++-mode
 ;;                             '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
 ;;     ))
 ;; (add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)


;; Other things I like are, for example,

 ;; cc-mode
 (require 'cc-mode)

 ;; automatic indent on return in cc-mode
;; (define-key c-mode-base-map [RET] 'newline-and-indent)

 ;; Do not check for old-style (K&R) function declarations;
 ;; this speeds up indenting a lot.
 (setq c-recognize-knr-p nil)

 ;; Switch fromm *.<impl> to *.<head> and vice versa
 (defun switch-cc-to-h ()
   (interactive)
   (when (string-match "^\\(.*\\)\\.\\([^.]*\\)$" buffer-file-name)
     (let ((name (match-string 1 buffer-file-name))
 	  (suffix (match-string 2 buffer-file-name)))
       (cond ((string-match suffix "c\\|cc\\|C\\|cpp")
 	     (cond ((file-exists-p (concat name ".h"))
 		    (find-file (concat name ".h"))
 		   )
 		   ((file-exists-p (concat name ".hh"))
 		    (find-file (concat name ".hh"))
 		   )
 	    ))
 	    ((string-match suffix "h\\|hh")
 	     (cond ((file-exists-p (concat name ".cc"))
 		    (find-file (concat name ".cc"))
 		   )
 		   ((file-exists-p (concat name ".C"))
 		    (find-file (concat name ".C"))
 		   )
 		   ((file-exists-p (concat name ".cpp"))
 		    (find-file (concat name ".cpp"))
 		   )
 		   ((file-exists-p (concat name ".c"))
 		    (find-file (concat name ".c"))
 		   )))))))

  (require 'cc-mode)
  (setq c-C++-access-key "\\<\\(slots\\|signals\\|private\\|protected\\|public\\)\\>[ \t]*[(slots\\|signals)]*[ \t]*:")
  (font-lock-add-keywords 'c++-mode '(("\\<\\(Q_OBJECT\\|public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\)\\>" . font-lock-constant-face)))

;; -*- Emacs-Lisp -*-    ;; Time-stamp: <2010-11-04 17:06:12 Thursday by taoshanwen>
(global-set-key (kbd "C-x d") 'ediff)

;; (load-library "ediff")
;; (add-hook 'ediff-before-setup-hook 'new-frame)
;; (add-hook 'ediff-quit-hook 'delete-frame)
;; (setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-vertically)
;;(setq ediff-split-window-function 'split-window-horizontally)

(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
	(file2 (pop command-line-args-left)))
    (ediff file1 file2)))

(add-to-list 'command-switch-alist '("diff" . command-line-diff))


;; (setq ediff-split-window-function (lambda (&optional arg)
;;                                         (if (> (frame-width) 150)
;;                                             (split-window-horizontally arg)
;;                                           (split-window-vertically arg))))

;; (defun ediff-settings ()
;; 	"settings for `ediff'."
;; 	(defun ediff-variable-settings ()
;; 		(setq ediff-highlight-all-diffs nil
;; 			ediff-highlighting-style 'face))

;; (defun ediff-keys ()
;; 	(interactive)
;; 	"`ediff-mode'hotkey setting"
;; 		(define-prefix-command 'ediff-R-map)
;; 			(define-key-list
;; 				ediff-mode-map
;; 				`(("# w" ediff+-toggle-ignore-whitespace)
;; 				("u"   ediff-update-diffs)
;; 				("/"   ediff-toggle-help)
;; 				("c"   ediff-inferior-compare-regions)
;; 				("f"   ediff-jump-to-difference)
;; 				("j"   ediff+-previous-line)
;; 				("k"   ediff-scroll-vertically)
;; 				("R"   ediff-R-map)
;; 				("R a" ediff-toggle-read-only)
;; 				("R b" ediff-toggle-read-only)
;; 				("o"   other-window)
;; 				("A"   ediff+-goto-buffer-a)
;; 				("B"   ediff+-goto-buffer-b))))

;; (defun ediff-startup-settings ()
;;       "Settings of ediff startup."
;;       (ediff-next-difference))

;; 	(add-hook 'ediff-startup-hook 'ediff-startup-settings)
;;     (add-hook 'ediff-prepare-buffer-hook 'turn-off-hideshow)
;;     (add-hook 'ediff-mode-hook 'ediff-variable-settings)
;;     (add-hook 'ediff-keymap-setup-hook 'ediff-keys)

;;    (setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;      (require 'ediff+)    (ediff+-set-actual-diff-options))
;;    (eval-after-load "ediff"
;;    `(ediff-settings))

;;    (provide 'ediff-settings)

;; (add-to-list 'load-path (expand-file-name "~/.emacs.d"))
;; (add-to-list 'load-path "~/.emacs.d")
;; (add-to-list 'load-path (expand-file-name "~/.emacs.d"))

(require 'whitespace)
(autoload 'global-whitespace-mode "whitespace" "Toggle whitespace visualization." t)
(autoload 'global-whitespace-toggle-options "whitespace" "Toggle local `whitespace-mode' options." t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)



;;; hide-show
(setq hs-allow-nesting t)

(add-hook 'c-mode-common-hook
          (lambda ()
            (hs-minor-mode 1)
            ))

(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (hs-minor-mode 1)))

(add-hook 'tcl-mode-hook (lambda ()
                           (hs-minor-mode 1)
                           ))

(add-to-list 'hs-special-modes-alist
             '(c-mode "[\n\t ]*{" "}" "/[*/]" nil hs-c-like-adjust-block-beginning))
(add-to-list 'hs-special-modes-alist
             '(c++-mode "[\n\t ]*{" "}" "/[*/]" nil hs-c-like-adjust-block-beginning))

(define-key global-map (kbd "C-h") 'hs-toggle-hiding)


;; ;; Last modified
;; ;; Mon Feb 14 11:15:06 CET 2011

;; ;; Thanks to:
;; ;; JanBorsodi.emacs (http://www.dotemacs.de/dotfiles/JanBorsodi/JanBorsodi.emacs.html)
;; ;; KDE (http://websvn.kde.org/trunk/KDE/kdesdk/scripts/kde-emacs/)
;; ;; emacswiki.org (http://www.emacswiki.org/cgi-bin/wiki?QtMode)

;; ;; REMINDER
;; ;; M-x name-last-kbd-macro
;; ;; M-x insert-kbd-macro
;; ;; (global-set-key (kbd "C-c a") 'my-macro)

;; ;; No startup message
;; (setq inhibit-startup-screen t)

;; ;; No more backup
;; (setq make-backup-files nil)

;; ;; rightheader macro
;; ;; open src/myclass.cpp
;; ;; then M-x rightheader to open headers/myclass.h
;; (fset 'rightheader "\C-[xbuffer-menu\C-m\C-[OF\C-@\C-[[1;5D\C-[[1;5D\C-[w\C-xk\C-m\C-x3\C-xo\C-x\C-f\C-?\C-?\C-?\C-?headers/\C-y\C-?\C-?\C-?h\C-m\C-xo")

;; ;; ajout au PATH-Emacs
(add-to-list 'load-path "~/.emacs.d")
;; ;;(add-to-list 'load-path "~/.emacs.d/kde")

;; ;; headers trigger C++ mode
;; (add-to-list 'auto-mode-alist '("\\.h" . c++-mode))

;; ;; Show whitespaces
;; (setq show-trailing-whitespace t)
;; (setq-default show-trailing-whitespace t)

;; ;; Syntax color
;; (font-lock-mode t)
;; (global-font-lock-mode t)
;; (setq font-lock-maximum-decoration 5)

;; (set-face-foreground   'font-lock-string-face "Yellow")
;; (set-face-foreground   'font-lock-comment-face  "OrangeRed")
;; (set-face-foreground   'font-lock-keyword-face  "Cyan")
;; (set-face-bold-p       'font-lock-keyword-face t)
;; (set-face-foreground   'font-lock-type-face     "Wheat")
;; ;; (set-face-underline-p  'font-lock-type-face t)
;; (set-face-foreground   'font-lock-function-name-face    "Blue")
;; (set-face-bold-p       'font-lock-function-name-face t)
;; (set-face-foreground   'font-lock-variable-name-face    "Green")
;; ;; reference
;; ;; (set-face-foreground   'font-lock-constant-face "White")
;; ;; (set-face-background   'font-lock-constant-face "BlueViolet")
;; (set-foreground-color "white")
;; (set-background-color "black")

;; ;; Line highlight
;; (global-hl-line-mode t)
;; (custom-set-faces '(highlight ((t (:weight bold)))))

;; ;; Encoding style
;; (set-terminal-coding-system 'latin-1)
;; (set-language-environment 'latin-1)
;; (set-keyboard-coding-system 'latin-1)

;; ;; --------
;; ;; MODELINE
;; ;; --------

;; ;; Display numbers of rows and columns
;; (line-number-mode 1)
;; (column-number-mode 1)

;; ;; show current function in modeline
;; (which-func-mode t)

;; ;; Show time in modeline
;; (display-time)


;; ;; Show Matching Parentheses
;; (show-paren-mode t)

;; ;; Highlight selection
;; (transient-mark-mode t)

;; ;; Default indentation
;; (setq c-indentation-style "sh-mode")

;; ;; No menu bar
;; (menu-bar-mode nil)

;; ;; when moving the cursor to the bottom/top of screen, scroll up/down 2 lines
;; (setq scroll-step 5)

;; ;; when moving page up/down, keep 1 line in common
;; (setq next-screen-context-lines 5)

;; ;; Working Del key
;; (and
;;  window-system
;;  (functionp 'normal-erase-is-backspace-mode)
;;  (normal-erase-is-backspace-mode nil))

;; ;; ---------------
;; ;;  LANGUAGE MODS
;; ;; ---------------

;; ;; CMake
;; (require 'cmake-mode)
;; (setq auto-mode-alist (append '(("CMakeLists\\.txt\\'" . cmake-mode)
;;                                 ("\\.cmake\\'" . cmake-mode))
;;                               auto-mode-alist))

;; ;; Autocomplete
;; ;; http://cx4a.org/software/auto-complete/
;; ;; (require 'auto-complete-config)
;; ;; (add-to-list 'ac-dictionary-directories "/home/rdally/.emacs.d/ac-dict")
;; ;; (ac-config-default)

;; ;; Hideshow (blocks hidding)
;; ;; http://www.emacswiki.org/emacs/HideShow/
;; (load-library "hideshow")
;; (dolist (hook (list
;;                'c-mode-hook
;;                'java-mode-hook
;;                'perl-mode-hook
;;                'php-mode-hook
;;                'emacs-lisp-mode-hook
;;                'lisp-mode-hook
;;                ))
;;   (add-hook hook 'hs-minor-mode))

;; (provide 'init-hideshow)

;; ;; DosBat
;; ;; http://sourceforge.net/projects/dosbat/
;; (autoload 'bat-mode "dosbat" "DosBat Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.bat\\'" . bat-mode))

;; ;; Python
;; ;; http://launchpadlibrarian.net/21781107/python-mode.el
;; (autoload 'python-mode "python-mode" "Python Mode." t)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
;; (add-to-list 'interpreter-mode-alist '("python" . python-mode))

;; ;; php
;; ;; http://www.emacswiki.org/emacs/PhpMode
;; (autoload 'php-mode "php-mode" "Major mode for editing php code." t)
;; (add-to-list 'auto-mode-alist '("\\.php$" . php-mode))
;; (add-to-list 'auto-mode-alist '("\\.inc$" . php-mode))

;; ;; Qt projects
;; (require 'qt-pro)
;; (add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode))

;; ;; Shortcuts
;; (global-set-key "\C-c\C-r"      'iwb)
;; (global-set-key "\C-c\C-g"      'goto-line)
;; (global-set-key "\C-c\C-c"      'comment-or-uncomment-region)
;; (global-set-key "\C-p"          'rightheader)
;; (global-set-key [home]          'beginning-of-line)
;; (global-set-key [end]           'end-of-line)
;; (global-set-key [f12]           'iwb)

;; ;; Jeux de claviers
;; (setq default-input-method 'french-postfix)
;; (global-set-key "\C-x\C-g" 'toggle-input-method)
;; (add-hook 'message-mode-hook 'toggle-input-method)

;; ;; --------
;; ;;  MACROS
;; ;; --------

;; ;; Usage
;; ;; $ emacs
;; ;; M-x my-class-generator
;; (defun my-class-generator (classname)
;;   (setq src_dir "src")
;;   (setq headers_dir "headers")
;;   (interactive "sEnter classname: ")
;;   (if (and
;;        (file-accessible-directory-p src_dir)
;;        (file-accessible-directory-p headers_dir))
;;       (progn
;;         (message "Generating class...")
;;         (find-file (concat src_dir "/" (downcase classname) ".cpp"))
;;         (insert (concat "#include \"" (downcase classname) ".h\"\n\n"))
;;         (insert (concat classname "::" classname "(void)\n{\n}\n\n"))
;;         (insert (concat classname "::~" classname "(void)\n{\n}\n"))
;;         (save-buffer)
;;         (split-window-horizontally)
;;         (other-window -1)
;;         (find-file (concat "../" headers_dir "/" (downcase classname) ".h"))
;;         (insert (concat "#ifndef " (upcase classname) "_H_\n"))
;;         (insert (concat "#define " (upcase classname) "_H_\n\n"))
;;         (insert (concat "class " classname "\n{\npublic:\n"))
;;         (insert (concat classname "(void);\n"))
;;         (insert (concat "~" classname "(void);\n"))
;;         (insert "};\n\n#endif")
;;         (indent-region (point-min) (point-max) nil)
;;         (save-buffer)
;;         (other-window -1)
;;         (message "Generating class... done"))
;;     (message (concat src_dir " and " headers_dir " directories must exist."))
;;     )
;;   )

;; (defun ltverbose ()
;;   "Insert #ifdef LT_VERBOSE #include QDebug #endif"
;;   (interactive)
;;   (setq macro_title "LT_VERBOSE")
;;   (insert (concat "\n#if defined(" macro_title ")\n"))
;;   (insert "#include <QDebug>\n")
;;   (insert "#endif\n")
;;   )

;; (defun iwb ()
;;   "indent whole buffer"
;;   (interactive)
;;   (delete-trailing-whitespace)
;;   (indent-region (point-min) (point-max) nil)
;;   (untabify (point-min) (point-max))
;;   )

;; (defun now ()
;;   "Insert string for the current time formatted like '2:34 PM'."
;;   (interactive)
;;   (insert (format-time-string "%D %-I:%M %p")))

;; (defun timestamp ()
;;   (interactive)
;;   (insert (format-time-string "%a %b %d %H:%M:%S %Z %Y")))

;; (defun today ()
;;   "Insert string for today's date nicely formatted in American style, e.g. Sunday, September 17, 2000."
;;   (interactive)
;;   (insert (format-time-string "%A, %B %e, %Y")))

;; ;; Count words in buffer
;; (defun count-words-buffer ()
;;   "Count the number of words in current the buffer
;; print a message in the minibuffer with the result."
;;   (interactive)
;;   (save-excursion
;;     (let ((count 0))
;;       (goto-char (point-min))
;;       (while (< (point) (point-max))
;;         (forward-word 1)
;;         (setq count (1+ count)))
;;       (message "buffer contains %d words." count))))

;; ;; Will align c/c++ variable declarations in the selected region
;; ;; Example:
;; ;; int a;
;; ;; const QString b;
;; ;; static unsigned int c;
;; ;;
;; ;; will become:
;; ;; int                 a;
;; ;; const QString       b;
;; ;; static unsigned int c;
;; (defun align-vars(beg end)
;;   "Aligns c/c++ variable declaration names on the same column, with beginning and end taken from selected region."
;;   (interactive "r")
;;   (save-excursion
;;     (let (bol eol expr-end
;;               (max-col 0) col
;;               poslist curpos)
;;       (goto-char end)
;;       (if (not (bolp))
;;           (setq end (line-end-position)))
;;       (goto-char beg)
;;       (while (and (> end (point)) (not (eobp)))
;;         (setq bol (line-beginning-position))
;;         (setq eol (line-end-position))
;;         (beginning-of-line)
;;         (setq expr-end (point))
;;         (if (search-forward-regexp "^[^/][^/]\\([a-zA-Z][a-zA-Z]*\\)[ \t]+[^;]" eol t)
;;             (let ()
;;               (setq expr-end (match-end 1))
;;               (while (search-forward-regexp "\\([a-zA-Z][a-zA-Z]*\\)[ \t]+[^;]" eol t)
;;                 (setq expr-end (match-end 1)))
;;               (goto-char expr-end)
;;               (setq col (current-column))
;;               (if (search-forward-regexp (concat "\\(\\*\\|&[ \t]*\\)?"
;;                                                  "\\([a-zA-Z\\_][a-zA-Z0-9\\_]*\\)\\([\[][0-9]+[\]]\\)?"
;;                                                  "\\([ \t]*,[ \t]*\\([a-zA-Z\\_][a-zA-Z0-9\\_]*\\)\\([\[][0-9]+[\]]\\)?\\)*"
;;                                                  "[ \t]*;$") eol t)
;;                   (let ((name-col-end 0))
;;                     (if (eq (match-beginning 2) (match-beginning 0))
;;                         (setq name-col-end 1))
;;                     (setq poslist (cons (list expr-end col (match-beginning 0) name-col-end) poslist))
;;                     (if (> col max-col)
;;                         (setq max-col col))
;;                     (beginning-of-next-line))
;;                 (beginning-of-next-line)))
;;           (beginning-of-next-line)))
;;       (setq curpos poslist)
;;       (while curpos
;;         (let* ((pos (car curpos))
;;                (col (car (cdr pos)))
;;                (col-end (car (cdr (cdr pos))))
;;                (col-end-name (car (cdr (cdr (cdr pos)))))
;;                (abs-pos (car pos)))
;;           (goto-char abs-pos)
;;           (delete-region abs-pos col-end)
;;           (insert-string (make-string (+ (+ (- max-col col) 1) col-end-name) 32)))
;;         (setq curpos (cdr curpos))))))

;; ;; Aligns all variable declarations in this buffer
;; (defun align-vars-buffer()
;;   "Aligns c/c++ variable declaration names on the same column in this buffer."
;;   (interactive)
;;   (save-excursion
;;     (let (beg end)
;;       (beginning-of-buffer)
;;       (setq beg (point))
;;       (end-of-buffer)
;;       (setq end (point))
;;       (align-vars beg end))))

;; ;; Checks for known classes and adds includes on the top if none are present
;;                                         ;(defun insert-include( buffer buf )
;; (defun insert-include()
;;   "Insert #include on the top of the file if certain class names are found in the file"
;;   (interactive)
;;   (if (string-equal mode-name "C++")
;;       (let ((includes project-include-classes)
;;             (include)
;;             (include-classes)
;;             (include-class)
;;             (include-file)
;;             (class-exists nil))
;;         (while includes
;;           (setq include (car includes))
;;           (setq include-classes (car include))
;;           (setq include-file (car (cdr include)))
;;           (setq class-exists nil)
;;           (while (and (not class-exists) include-classes)
;;             (setq include-class (car include-classes))
;;             (save-excursion
;;               (beginning-of-buffer)
;;               (if (search-forward-regexp (concat "\\<" include-class "\\>") nil t)
;;                   (setq class-exists t)))
;;             (setq include-classes (cdr include-classes)))
;;           (if class-exists
;;               (let ((already-present nil))
;;                 (save-excursion
;;                   (beginning-of-buffer)
;;                   (if (search-forward-regexp (concat "^#include[ \t]+"
;;                                                      include-file
;;                                                      "[ \t]*\n") nil t )
;;                       (setq already-present t)))
;;                 (if (not already-present)
;;                     (save-excursion
;;                       (goto-char (end-of-include-place))
;;                       (insert-string (concat "#include " include-file "\n"))))))
;;           (setq includes (cdr includes))))))

;; ;; Cursor stands still on scroll
;; ;; (setq scroll-preserve-screen-position t)
;; ;; (setq cursor-in-non-selected-windows t)

;; ;; Copy on cursor position, not mouse one
;; ;; (setq mouse-yank-at-point t)

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector ["black" "red" "green" "yellow" "lightslateblue" "magenta" "cyan" "white"])
;;  '(canlock-password "e722586516e941d6dfddd0e88b7623046bec29aa")
;;  '(compilation-scroll-output t)
;;  '(compile-auto-highlight 5)
;;  '(executable-chmod 755)
;;  '(gnus-buttonized-mime-types (quote (".*/.*")))
;;  '(gnus-show-threads t)
;;  '(gnus-thread-hide-subtree t)
;;  '(grep-command "grep -i -n -e "))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(cursor ((t (:background "tan"))))
;;  '(gnus-header-content-face ((t (:foreground "green3"))) t)
;;  '(gnus-header-from-face ((((class color) (background dark)) (:foreground "SeaGreen3"))) t)
;;  '(gnus-header-name-face ((((class color) (background dark)) (:foreground "Green"))) t)
;;  '(gnus-header-subject-face ((((class color) (background dark)) (:foreground "spring green"))) t)
;;  '(info-xref ((t (:foreground "magenta" :weight bold))))
;;  '(message-header-name-face ((((class color) (background dark)) (:inherit gnus-header-name-face))) t)
;;  '(message-header-other-face ((((class color) (background dark)) (:inherit gnus-header-content-face))) t)
;;  '(mode-line ((((type x w32 mac) (class color)) (:background "slateblue" :foreground "black" :box (:line-width -1 :style released-button)))))
;;  '(mouse ((t (:background "white"))))
;;  '(show-paren-match ((((class color)) (:background "DarkSlateBlue"))))
;;  '(tooltip ((((class color)) (:background "lightyellow" :foreground "black")))))

;; ;; Do not check for old-style (K&R) function declarations;
;; ;; this speeds up indenting a lot.
;; (setq c-recognize-knr-p nil)

;; C++/Qt keywords
;; syntax-highlighting for Qt
;; (based on work by Arndt Gulbrandsen, Troll Tech)
(defun jk/c-mode-common-hook ()
  "Set up c-mode and related modes.
   Includes support for Qt code (signal, slots and alikes)."

;;  base-style
  (c-set-style "stroustrup")
;;  set auto cr mode
  ;; (c-toggle-auto-hungry-state 1)

;; qt keywords and stuff ...
;; set up indenting correctly for new qt kewords
  (setq c-protection-key (concat "\\<\\(public\\|public slot\\|protected"
                                 "\\|protected slot\\|private\\|private slot"
                                 "\\)\\>")
        c-C++-access-key (concat "\\<\\(signals\\|public\\|protected\\|private"
                                 "\\|public slots\\|protected slots\\|private slots"
                                 "\\)\\>[ \t]*:"))
  (progn
;; modify the colour of slots to match public, private, etc ...
    (font-lock-add-keywords 'c++-mode
                            '(("\\<\\(slots\\|signals\\)\\>" . font-lock-type-face)))
;; make new font for rest of qt keywords
    (make-face 'qt-keywords-face)
    (set-face-foreground 'qt-keywords-face "BlueViolet")
;; qt keywords
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Q_OBJECT\\>" . 'qt-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<SIGNAL\\|SLOT\\>" . 'qt-keywords-face)))
    (font-lock-add-keywords 'c++-mode
                            '(("\\<Q[A-Z][A-Za-z]*" . 'qt-keywords-face)))
    ))
(add-hook 'c-mode-common-hook 'jk/c-mode-common-hook)

(setq c-C++-access-key "\\<\\(slots\\|signals\\|private\\|protected\\|public\\)\\>[ \t]*[(slots\\|signals)]*[ \t]*:")
(font-lock-add-keywords 'c-mode '(("\\<\\(Q_OBJECT\\|public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\)\\>" . font-lock-constant-face)))

(font-lock-add-keywords 'c++-mode '(("\\<\\(Q_OBJECT\\)\\>" . font-lock-constant-face)))
(font-lock-add-keywords 'c++-mode '(("\\<\\(public slots\\|public signals\\|private slots\\|private signals\\|protected slots\\|protected signals\\|signals\\)\\>" . font-lock-keyword-face)))



;;git mergetool 使用ediff ,前提可以正常使用emacsclient ,并且Emacs已经启动。
;; ~/.gitconfig
;; [mergetool "ediff"]
;; cmd = emacsclient --eval \"(git-mergetool-emacsclient-ediff \\\"$LOCAL\\\" \\\"$REMOTE\\\" \\\"$BASE\\\" \\\"$MERGED\\\")\"
;; trustExitCode = false
;; [mergetool]
;; prompt = false
;; [merge]
;; tool = ediff
;;
;; Setup for ediff.
;;
;;(require 'ediff)

(defvar ediff-after-quit-hooks nil
  "* Hooks to run after ediff or emerge is quit.")

(defadvice ediff-quit (after edit-after-quit-hooks activate)
  (run-hooks 'ediff-after-quit-hooks))

(setq git-mergetool-emacsclient-ediff-active nil)

(defun local-ediff-frame-maximize ()
  (when (boundp 'display-usable-bounds)
    (let* ((bounds (display-usable-bounds))
           (x (nth 0 bounds))
           (y (nth 1 bounds))
           (width (/ (nth 2 bounds) (frame-char-width)))
           (height (/ (nth 3 bounds) (frame-char-height))))
      (set-frame-width (selected-frame) width)
      (set-frame-height (selected-frame) height)
      (set-frame-position (selected-frame) x y))  )
  )
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)

(defun local-ediff-before-setup-hook ()
  (setq local-ediff-saved-frame-configuration (current-frame-configuration))
  (setq local-ediff-saved-window-configuration (current-window-configuration))
  (local-ediff-frame-maximize)
  (if git-mergetool-emacsclient-ediff-active
      (raise-frame)))

(defun local-ediff-quit-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(defun local-ediff-suspend-hook ()
  (set-frame-configuration local-ediff-saved-frame-configuration)
  (set-window-configuration local-ediff-saved-window-configuration))

(add-hook 'ediff-before-setup-hook 'local-ediff-before-setup-hook)
(add-hook 'ediff-quit-hook 'local-ediff-quit-hook 'append)
(add-hook 'ediff-suspend-hook 'local-ediff-suspend-hook 'append)

;; Useful for ediff merge from emacsclient.
(defun git-mergetool-emacsclient-ediff (local remote base merged)
  (setq git-mergetool-emacsclient-ediff-active t)
  (if (file-readable-p base)
      (ediff-merge-files-with-ancestor local remote base nil merged)
    (ediff-merge-files local remote nil merged))
  (recursive-edit))

(defun git-mergetool-emacsclient-ediff-after-quit-hook ()
  (exit-recursive-edit))

(add-hook 'ediff-after-quit-hooks 'git-mergetool-emacsclient-ediff-after-quit-hook 'append)


(custom-set-variables
 '(initial-frame-alist (quote ((fullscreen . maximized)))))


; start package.el with emacs
(require 'package)
; add MELPA to repository list
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
; initialize package.el
(package-initialize)
; start auto-complete with emacs
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)
; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)
; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '"/Applications/Xcode.app/Contents/Developer/usr/llvm-gcc-4.2/lib/gcc/i686-apple-darwin11/4.2.1/include")
)
; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)

; Fix iedit bug in Mac
(define-key global-map (kbd "C-c ;") 'iedit-mode)

; start flymake-google-cpplint-load
; let's define a function for flymake initialization
(defun my:flymake-google-init ()
  (require 'flymake-google-cpplint)
  (custom-set-variables
   '(flymake-google-cpplint-command "/opt/local/Library/Frameworks/Python.framework/Versions/2.7/bin/cpplint"))
  (flymake-google-cpplint-load)
)
(add-hook 'c-mode-hook 'my:flymake-google-init)
(add-hook 'c++-mode-hook 'my:flymake-google-init)

; start google-c-style with emacs
(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

; turn on Semantic
(semantic-mode 1)
; let's define a function which adds semantic as a suggestion backend to auto complete
; and hook this function to c-mode-common-hook
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)
; turn on ede mode
(global-ede-mode 1)
; create a project for our program.
(ede-cpp-root-project "my project" :file "~/demos/my_program/src/main.cpp"
		      :include-path '("/../my_inc"))
; you can use system-include-path for setting up the system header file locations.
; turn on automatic reparsing of open buffers in semantic
(global-semantic-idle-scheduler-mode 1)
