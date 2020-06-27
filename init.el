(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
(package-initialize)

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


;; Flycheck
(when (locate-library "flycheck")
  (require `flycheck)
  (global-flycheck-mode)
)
(add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++20")))

;; C Style
(add-hook `c-mode-hook
	  `(lambda()
	     (c-set-style "ellemtel")
	     (setq indent-tabs-mode nil)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'arglist-close 0)
	     ))

;; C++ Style
(add-hook `c-mode-hool
	  `(lambda()
	     (c-set-style "ellemtel")
	     (setq indent-tabs-mode nil)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'arglist-close 0)
	  ))

;; gdb
(setq gdb-many-windows t)
(add-hook 'gdb-mode-hook '(lambda() (gud-tooltip-mode t)))
(setq gdb-use-separate-io-buffer t)
(setq gud-tooltip-echo-area nil)

			    



;; !!WORNING!!don't edit here!!
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (quickrun flycheck helm-swoop helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'downcase-region 'disabled nil)
