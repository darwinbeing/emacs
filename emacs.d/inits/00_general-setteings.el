;;; general settings

(transient-mark-mode t)
(define-key ctl-x-map "n" 'goto-line)
(define-key ctl-x-map "\\" 'indent-region)
(put 'upcase-region 'disabled nil)
(show-paren-mode t)
(setq show-paren-style 'parentheses)
(setq line-number-mode t)
(setq column-number-mode t)
(setq default-tab-with 8)

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

(global-set-key "\M-g" 'goto-line)

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

;; (require 'wb-line-number)
(set-scroll-bar-mode nil)
;;(wb-line-number-toggle)
(line-number-mode 1)

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

(load-library "saveplace")
(make-directory "/tmp/saveplace" t)
(make-directory "/tmp/shadowtodo" t)
(setq save-place-file "/tmp/saveplace/file")
(setq shadow-todo-file "/shadowtodo/file")

(require 'saveplace)
(setq save-place-file "/tmp/saveplace/files")
(setq-default save-place t)

(global-set-key "\C-x\C-x" 'kill-this-buffer)

(setq track-eol t)

(require 'hl-line)
;(global-hl-line-mode t)

(defface hl-line '((t (:foreground "Black" :background "SlateGray3")))
  "Face to use for `hl-line-face'." :group 'hl-line)
(setq hl-line-face 'hl-line)


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

; for emacsclient
(server-start)
