(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(auto-save-visited-mode t)
 '(custom-enabled-themes '(monokai))
 '(custom-safe-themes
   '("95b0bc7b8687101335ebbf770828b641f2befdcf6d3c192243a251ce72ab1692" default))
 '(delete-selection-mode nil)
 '(evil-undo-system 'undo-redo)
 '(global-display-line-numbers-mode t)
 '(global-whitespace-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kill-buffer-delete-auto-save-files nil)
 '(make-backup-files nil)
 '(package-selected-packages
   '(markdown-mode go-mode which-key ## company evil-surround monokai-theme magit evil))
 '(pixel-scroll-precision-mode t)
 '(savehist-mode t)
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tool-bar-mode nil)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ))

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'electric-pair-mode)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'evil-mode-hook 'global-evil-surround-mode)
(delete-selection-mode)
;; (evil-mode)
;; (global-evil-surround-mode)
(global-company-mode)
(global-tab-line-mode)
(windmove-default-keybindings)
;; (which-key-mode)

;; To recompile all .el files, run C-u 0 M-x byte-recompile-directory
