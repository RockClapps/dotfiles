(dolist (package '(use-package))
 (unless (package-installed-p package)
  (package-install package)))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package company
 :config
 (global-company-mode))
(use-package dape)
(use-package evil
 :config
 (evil-mode))
(use-package evil-exchange)
(use-package evil-matchit)
(use-package evil-nerd-commenter)
(use-package evil-numbers)
(use-package evil-surround
 :config
 (global-evil-surround-mode))
(use-package flycheck)
(use-package go-mode)
(use-package magit)
(use-package markdown-mode)
(use-package rainbow-delimiters)
(use-package which-key
 :config
 (which-key-mode))
(use-package zenburn-theme)

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
   '(evil zenburn-theme which-key rainbow-delimiters magit go-mode flycheck company))
 '(pixel-scroll-precision-mode t)
 '(savehist-mode t)
 '(standard-indent 2)
 '(tab-always-indent t))

(global-set-key (kbd "M-n") 'windmove-left)
(global-set-key (kbd "M-o") 'windmove-right)
(global-set-key (kbd "M-e") 'windmove-down)
(global-set-key (kbd "M-i") 'windmove-up)
(global-set-key (kbd "M-N") 'windmove-swap-states-left)
(global-set-key (kbd "M-O") 'windmove-swap-states-right)
(global-set-key (kbd "M-E") 'windmove-swap-states-down)
(global-set-key (kbd "M-I") 'windmove-swap-states-up)
(require 'evil)
(evil-define-key '(normal) 'global 
 "n" 'evil-backward-char
 "e" 'evil-next-line
 "i" 'evil-previous-line
 "o" 'evil-forward-char
 "k" 'evil-insert
 "K" 'evil-insert-line
 "E" 'evil-join
 "l" 'evil-open-below
 "L" 'evil-open-above
 "gk" 'evil-insert-resume
 "gK" 'evil-insert-0-line
 "gE" 'evil-join-whitespace
 "zl" 'evil-open-fold
 "zL" 'evil-open-fold-rec
 "\C-h" 'evil-paste-pop-next
 )
(evil-define-key '(visual) 'global 
 "n" 'evil-backward-char
 "e" 'evil-next-line
 "i" 'evil-previous-line
 "o" 'evil-forward-char
 "K" 'evil-insert
 "l" 'exchange-point-and-mark
 "L" 'evil-visual-exchange-corners
 "k" evil-inner-text-objects-map
 )
(evil-define-key '(motion) 'global 
 "j" 'evil-forward-word-end
 "J" 'evil-forward-WORD-end
 "n" 'evil-backward-char
 "N" 'evil-window-top
 "e" 'evil-next-line
 "i" 'evil-previous-line
 "o" 'evil-forward-char
 "I" 'evil-lookup
 "O" 'evil-window-bottom
 "h" 'evil-search-next
 "H" 'evil-search-previous
 "gj" 'evil-backward-word-end
 "gJ" 'evil-backward-WORD-end
 "ge" 'evil-next-visual-line
 "gi" 'evil-previous-visual-line
 "gl" 'evil-goto-char
 (kbd "C-j") 'evil-scroll-line-down
 (kbd "C-l") 'evil-jump-backward
 "zo" 'evil-scroll-column-right
 [?z right] "zo"
 "zn" 'evil-scroll-column-left
 [?z left] "zn"
 "zO" 'evil-scroll-right
 "zN" 'evil-scroll-left
 )
(evil-define-key '(operator) 'global 
 "k" evil-inner-text-objects-map
 )
(evil-set-leader '(normal visual motion) (kbd "<SPC>"))
(evil-define-key '(normal visual motion) 'global
 (kbd "<leader>q") 'evil-window-delete
 (kbd "<leader>w") 'save-buffer
 (kbd "<leader>e") 'split-window-below
 (kbd "<leader>o") 'split-window-right
 (kbd "<leader>t") 'tab-new
 (kbd "<leader>x") 'tab-close
 (kbd "<leader>n") 'tab-next
 (kbd "<leader>p") 'tab-previous
 (kbd "<leader>d") 'project-switch-project
 (kbd "<leader>g") 'magit
 (kbd "<leader>ff") 'find-name-dired
 (kbd "<leader>fg") 'find-grep-dired
 )

(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'eglot-ensure)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'eglot-format-buffer)

(add-to-list 'warning-suppress-types '(emacs))

;; To recompile all .el files, run C-u 0 M-x byte-recompile-directory
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
