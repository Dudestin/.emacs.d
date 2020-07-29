(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

(load-theme 'alect-dark t)

(setq inhibit-startup-screen t)
(tool-bar-mode 0)
(menu-bar-mode 0)

(global-set-key "\C-h" 'delete-backward-char)

(require `helm)
(require `helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))
(global-unset-key (kbd "C-s"))
(global-set-key (kbd "C-s") 'helm-swoop)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(global-unset-key (kbd "C-x C-r"))
(global-unset-key (kbd "C-x C-b"))
(global-unset-key (kbd "C-x b"))
(global-unset-key (kbd "C-c h C-x C-f"))
(global-unset-key (kbd "M-x"))

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)
(global-set-key (kbd "C-x C-r") 'helm-recentf)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)

;; helm-gtags: key bindings
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
              (local-set-key (kbd "C-c t") 'helm-gtags-find-tag)
              (local-set-key (kbd "C-c r") 'helm-gtags-find-rtag)
              (local-set-key (kbd "C-c s") 'helm-gtags-find-symbol)
              (local-set-key (kbd "C-c p") 'helm-gtags-pop-stack)))

;; Flycheck
(when (locate-library "flycheck")
  (require `flycheck)
  (global-flycheck-mode)
  )

(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))

;; C Style
(add-hook `c-mode-hook
	  `(lambda()
	     (c-set-style "ellemtel")
	     (setq indent-tabs-mode nil)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'arglist-close 0)
	     ))
(add-hook `c-mode-hook `helm-gtags-mode)

;; C++ Style
(add-hook `c++-mode-hook
	  `(lambda()
	     (c-set-style "ellemtel")
	     (setq indent-tabs-mode nil)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'arglist-close 0)
	     ))
(add-hook `c++-mode-hook `helm-gtags-mode)

;; gdb
(setq gdb-many-windows t)
(add-hook 'gdb-mode-hook '(lambda() (gud-tooltip-mode t)))
(setq gdb-use-separate-io-buffer t)
(setq gud-tooltip-echo-area nil)

;; multiple-cursors
(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c a") 'mc/mark-all-like-this)

;; !!WORNING!!don't edit here!!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (w3m alect-themes multiple-cursors helm-gtags quickrun flycheck helm-swoop helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)

(autoload 'navi2ch "navi2ch" "Navigator for 2ch for Emacs" t)
(setq navi2ch-net-http-proxy "127.0.0.1:9080")
(setq browse-url-browser-function 'w3m-browse-url)
