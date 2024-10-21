(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(dolist (package '(use-package))
   (unless (package-installed-p package)
       (package-install package)))

(use-package company :ensure t)
(use-package flycheck :ensure t)
(use-package go-mode :ensure t)
(use-package lsp-mode :ensure t)
(use-package magit :ensure t)
(use-package markdown-mode :ensure t)
(use-package powerline :ensure t)
(use-package rainbow-delimiters :ensure t)
(use-package treemacs :ensure t)
(use-package which-key :ensure t)
(use-package zenburn-theme :ensure t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(delete-selection-mode nil)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kill-buffer-delete-auto-save-files t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(zenburn-theme which-key rainbow-delimiters magit lsp-mode go-mode flycheck company))
 '(pixel-scroll-precision-mode t)
 '(savehist-mode t)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tab-bar-mode t)
 '(tool-bar-mode nil))

(global-set-key (kbd "M-n") 'windmove-left)
(global-set-key (kbd "M-o") 'windmove-right)
(global-set-key (kbd "M-e") 'windmove-down)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-N") 'windmove-swap-states-left)
(global-set-key (kbd "M-O") 'windmove-swap-states-right)
(global-set-key (kbd "M-E") 'windmove-swap-states-down)
(global-set-key (kbd "M-I") 'windmove-swap-states-up)

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)
(global-company-mode)

;; To recompile all .el files, run C-u 0 M-x byte-recompile-directory
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
