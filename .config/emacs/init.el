(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-visited-mode t)
 '(custom-enabled-themes '(zenburn))
 '(custom-safe-themes
   '("f366d4bc6d14dcac2963d45df51956b2409a15b770ec2f6d730e73ce0ca5c8a7" default))
 '(delete-selection-mode nil)
 '(evil-undo-system 'undo-redo)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kill-buffer-delete-auto-save-files t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(zenburn-theme markdown-mode go-mode which-key ## company evil-surround magit evil))
 '(pixel-scroll-precision-mode t)
 '(savehist-mode t)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tool-bar-mode nil))

;; (setq viper-mode t)
;; (require 'viper)
;; (define-key viper-vi-global-user-map "n" 'viper-backward-char)
;; (define-key viper-vi-global-user-map "o" 'viper-forward-char)
;; (define-key viper-vi-global-user-map "e" 'viper-next-line)
;; (define-key viper-vi-global-user-map "i" 'viper-previous-line)
;; (define-key viper-vi-global-user-map "N" 'viper-window-top)
;; (define-key viper-vi-global-user-map "O" 'viper-window-bottom)
;; (define-key viper-vi-global-user-map "E" 'viper-join-lines)
;; (define-key viper-vi-global-user-map "I" 'viper-nil)
;; (define-key viper-vi-global-user-map "h" 'viper-search-next)
;; (define-key viper-vi-global-user-map "l" 'viper-open-line)
;; (define-key viper-vi-global-user-map "j" 'viper-end-of-word)
;; (define-key viper-vi-global-user-map "k" 'viper-insert)
;; (define-key viper-vi-global-user-map "H" 'viper-search-Next)
;; (define-key viper-vi-global-user-map "L" 'viper-Open-line)
;; (define-key viper-vi-global-user-map "J" 'viper-end-of-Word)
;; (define-key viper-vi-global-user-map "K" 'viper-Insert)
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
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'evil-mode-hook 'global-evil-surround-mode)
(delete-selection-mode)
(evil-mode)
(global-evil-surround-mode)
(global-company-mode)
(global-tab-line-mode)
(windmove-default-keybindings)
;; (which-key-mode)

;; To recompile all .el files, run C-u 0 M-x byte-recompile-directory
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
