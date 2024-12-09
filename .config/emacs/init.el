(dolist (package '(use-package))
 (unless (package-installed-p package)
  (package-install package)))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package avy)
(use-package company
 :config
 (global-company-mode))
(use-package dape)
(use-package evil
 :init
 (setq evil-want-C-u-scroll t)
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
(use-package helm)
(use-package magit)
(use-package markdown-mode)
(use-package rainbow-delimiters)
(use-package undo-tree
 :config
 (global-undo-tree-mode)
 (setq undo-tree-auto-save-history nil))
(use-package which-key
 :config
 (which-key-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(custom-enabled-themes '(womby-dark))
 '(custom-safe-themes
   '("ce705d0cd0b55d19cb48596f0f2b91c0c986c2d015a48aa22a4ee588cd128445" "427eb94b8511f8d6d1e7756367369beb179f19dfbe0de478065543cab9c2c3d5" default))
 '(custom-theme-directory "~/.config/emacs/themes")
 '(delete-selection-mode nil)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kill-buffer-delete-auto-save-files t)
 '(make-backup-files nil)
 '(package-selected-packages
   '(avy evil which-key rainbow-delimiters magit go-mode flycheck company))
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
(evil-set-undo-system 'undo-tree)
(evil-set-leader '(normal visual motion) (kbd "<SPC>"))
(evil-define-key '(normal visual motion) 'global
 "n" 'evil-backward-char
 "e" 'evil-next-line
 "i" 'evil-previous-line
 "o" 'evil-forward-char
 "N" 'evil-window-top
 "E" 'evil-join
 "I" 'evil-lookup
 "O" 'evil-window-bottom
 "h" 'evil-search-next
 "j" 'evil-forward-word-end
 "k" 'evil-insert
 "l" 'evil-open-below
 "H" 'evil-search-previous
 "J" 'evil-forward-WORD-end
 "K" 'evil-insert-line
 "L" 'evil-open-above
 (kbd "<leader>q") 'evil-window-delete
 (kbd "<leader>w") 'save-buffer
 (kbd "<leader>e") 'split-window-below
 (kbd "<leader>o") 'split-window-right
 (kbd "<leader>T") 'evil-buffer-new
 (kbd "<leader>X") 'evil-delete-buffer
 (kbd "<leader>N") 'evil-next-buffer
 (kbd "<leader>P") 'evil-prev-buffer
 (kbd "<leader>b") 'helm-buffers-list
 (kbd "<leader>t") 'tab-new
 (kbd "<leader>x") 'tab-close
 (kbd "<leader>n") 'tab-next
 (kbd "<leader>p") 'tab-previous
 (kbd "<leader>g") 'magit
 (kbd "<leader>h") 'help
 (kbd "<leader>s") 'avy-goto-char-2
 (kbd "<leader>d") 'eglot-find-declaration
 (kbd "<leader>D") 'eglot-find-typeDefinition
 (kbd "<leader>i") 'eglot-find-implementation
 (kbd "<leader>r") 'eglot-rename
 ;;(kbd "<leader>ff") 'project-find-file
 (kbd "<leader>ff") 'find-name-dired
 (kbd "<leader>fg") 'helm-regexp
 (kbd "<leader>fp") 'helm-recentf
)

(evil-define-key '(normal) 'global 
 "gi" 'evil-previous-visual-line
 "gk" 'evil-insert-resume
 "gK" 'evil-insert-0-line
 "gE" 'evil-join-whitespace
 "zl" 'evil-open-fold
 "zL" 'evil-open-fold-rec
 "\C-h" 'evil-paste-pop-next
 )
(evil-define-key '(visual) 'global 
 "K" 'evil-insert
 "l" 'exchange-point-and-mark
 "L" 'evil-visual-exchange-corners
 "k" evil-inner-text-objects-map
 )
(evil-define-key '(motion) 'global 
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

(electric-pair-mode)
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'electric-pair-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'eglot-ensure)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'eglot-format-buffer)

(add-to-list 'eglot-server-programs '((java-mode) "~/Apps/jdt-language-server/bin/jdtls"))
(add-to-list 'eglot-server-programs '((c++-mode c-mode) "~/scripts/bin/clangd"))

(add-to-list 'warning-suppress-types '(emacs))

(load-file (concat custom-theme-directory "/womby-light-theme.el"))
(load-file (concat custom-theme-directory "/womby-dark-theme.el"))

(add-to-list 'load-path "~/Apps/gdscript-emacs")
(require 'gdscript-mode)

;; To recompile all .el files, run C-u 0 M-x byte-recompile-directory
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
