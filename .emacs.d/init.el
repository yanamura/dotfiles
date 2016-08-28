(setq backup-inhibited t)
(setq auto-save-default nil)

;;melpa
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;;Language
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
(remove-hook 'find-file-hooks 'vc-find-file-hook)

;;Keybooard
(keyboard-translate ?\C-h ?\C-?)
(define-key global-map (kbd "C-t") 'other-window)
(setq transient-mark-mode t)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
;;(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-g s") 'helm-do-grep)

;; tab -> 4 spaces.
(setq-default tab-width 4 indent-tabs-mode nil)
(setq indent-line-function 'insert-tab)

;; buffer
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;; title
(setq frame-title-format "%f")

;; autocomplete
(when (require 'auto-complete-config nil t)
  (add-to-list 'ac-dictionary-directories
               "~/.emacs.d/elisp/ac-dict")
  (define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
  (ac-config-default))

;;white space setting.
(setq whitespace-style
      '(tabs tab-mark spaces space-mark))
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\ ])
        (tab-mark   ?\t   [?\xBB ?\t])
        ))
(require 'whitespace)
(global-whitespace-mode 1)
(set-face-foreground 'whitespace-space "LightSlateGray")
(set-face-background 'whitespace-space "DarkSlateGray")
(set-face-foreground 'whitespace-tab "LightSlateGray")
(set-face-background 'whitespace-tab "DarkSlateGray")

;;Php-mode
(when (require 'php-mode nil t)
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . php-mode))
  (setq php-search-url "http://jp.php.net/ja/")
  (setq php-manual-url "http://jp.php.net/manual/ja/"))

(defun php-indent-hook ()
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (c-set-offset 'arglist-intro '+)
  (c-set-offset 'arglist-close 0))

(add-hook 'php-mode-hook 'php-indent-hook)

;; yaml
(unless (package-installed-p 'yaml-mode)
  (package-refresh-contents) (package-install 'yaml-mode))
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.ya?ml$" . yaml-mode))
(define-key yaml-mode-map "\C-m" 'newline-and-indent)

;;helm
(require 'helm-config)
(helm-mode 1)
;;(define-key helm-c-read-file-map (kbd "C-h") 'delete-backward-char)
;;(define-key helm-c-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
(setq helm-buffer-max-length 50)

;;popwin
(require 'popwin)
(setq display-buffer-function 'popwin:display-buffer)

(setq anything-samewindow nil)
(push '("*helm-mini*" :height 20) popwin:special-display-config)
