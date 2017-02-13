;;; init.el --- 
;; 
;; Filename: init.el
;; Description: 
;; Author: Li Pidong  
;; E-mail: hope-dream@163.com 
;; Created: 2016-04-23 14:54:34
;; Version: 
;; Last-Updated: 2016-08-15 19:51:37

(add-to-list 'load-path "~/.emacs.d/ess/lisp")
(load "ess-site")
(add-to-list 'load-path(expand-file-name "~/.emacs.d/lisp"))
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")

(setq w32-get-true-file-attributes nil)
;; 窗口自动编号
(require 'window-numbering)
(window-numbering-mode 1)

;;comment or uncomment
(global-set-key (kbd " M-/") 'comment-or-uncomment-region)
(defun my-comment-or-uncomment-region (beg end &optional arg)
  (interactive (if (use-region-p)
				   (list (region-beginning) (region-end) nil)
				 (list (line-beginning-position)
					   (line-beginning-position 2))))
  (comment-or-uncomment-region beg end arg)
  )
(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region) 

;; set helm

(add-to-list 'load-path "~/.emacs.d/lisp/helm")
(require 'helm-config)
(global-set-key (kbd "M-x") 'helm-M-x)
;; set indent
;(setq indent-tabs-mode nil)
(setq default-tab-width 4)
(setq tab-width 4)

;; use quickrun
(require 'quickrun)

(global-set-key (kbd "C-c C-n") 'quickrun-region)

;; 显示行号
(global-linum-mode)
(setq column-number-mode t)

;; 高亮括号配对
(electric-pair-mode)

;; 高亮括号配对
(show-paren-mode t)
(setq show-paren-style 'parenthesis)


;; set color-theme
(load-theme 'monokai t)

;; add header 
(require 'header2)
(autoload 'auto-update-file-header "~/.emacs.d/lisp/header2")
(add-hook 'write-file-hooks 'auto-update-file-header)
(add-hook 'emacs-lisp-mode-hook 'auto-make-header)
(add-hook 'c-mode-common-hook 'auto-make-header)
(add-hook 'tex-mode-hook 'auto-make-header)

;; use melpa
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

; auto-complete
(add-to-list 'load-path "~/.emacs.d/elpa/auto-complete-20160416.604")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20160416.604/ac-dict")
(ac-config-default)

 ;ess
(setq ess-use-auto-complete 'script-only)
(define-key ac-completing-map [tab] 'ac-complete)
(define-key ac-completing-map [return] nil)
(setq
 ac-auto-show-menu 1
 ac-candidate-limit nil
 ac-delay 0.1
 ac-disable-faces (quote (font-lock-comment-face font-lock-doc-face))
 ac-ignore-case 'smart
 ac-menu-height 10
 ac-quick-help-delay 1.5
 ac-quick-help-prefer-pos-tip t
 ac-use-quick-help t
 )
(global-set-key (kbd "C-RET") 'ess-eval-line-and-step) ; the Enter/Return key


;; (define-key ac-completing-map (kbd "M-h") 'ac-quick-help)

;python notebook
(require 'ein)
(setq ein:use-auto-complete t)
(setq ein:use-smartrep t)
;; (global-set-key (kbd "C-o") 'ein:worksheet-toggle-output)
;; (global-set-key (kbd "C-c C-L") 'ein:worksheet-clear-all-output)


;eply
(require 'package)
(add-to-list 'package-archives
             '("elpy" . "https://jorgenschaefer.github.io/packages/"))

(package-initialize)
(elpy-enable)
; eamcs::PDE for perl
(add-to-list 'load-path "~/.emacs.d/pde")
(load "pde-load")



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("04dd0236a367865e591927a3810f178e8d33c372ad5bfef48b5ce90d4b476481" default)))
 '(fci-rule-color "#49483E")
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#49483E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#49483E" . 100))))
 '(magit-diff-use-overlays nil)
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (unspecified "#272822" "#49483E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil)))))
