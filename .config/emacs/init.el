(setq gc-cons-threshold (* 64 1024 1024))
(dolist (package '(use-package))
 (unless (package-installed-p package)
  (package-install package)))
(require 'use-package-ensure)
(setq use-package-always-ensure t)

(use-package avy)
(use-package dape)
(use-package ellama
  :ensure t
  :bind ("C-c e" . ellama-transient-main-menu)
  ;; send last message in chat buffer with C-c C-c
  :hook (org-ctrl-c-ctrl-c-final . ellama-chat-send-last-message)
  :init
  (require 'llm-ollama)
  (setopt ellama-provider
    (make-llm-ollama
     ;; this model should be pulled to use it
     ;; value should be the same as you print in terminal during pull
     :chat-model "gemma3:4b"
     :embedding-model "nomic-embed-text"
     :default-chat-non-standard-params '(("num_ctx" . 8192))))
  (setopt ellama-summarization-provider
    (make-llm-ollama
     :chat-model "gemma3:4b"
     :embedding-model "nomic-embed-text"
     :default-chat-non-standard-params '(("num_ctx" . 32768))))
  (setopt ellama-coding-provider
    (make-llm-ollama
     :chat-model "gemma3:4b"
     :embedding-model "nomic-embed-text"
     :default-chat-non-standard-params '(("num_ctx" . 32768))))
  (setopt ellama-extraction-provider (make-llm-ollama
                                :chat-model "gemma3:4b"
                                :embedding-model "nomic-embed-text"
                                :default-chat-non-standard-params
                                '(("num_ctx" . 32768))))
  ;; customize display buffer behaviour
  ;; see ~(info "(elisp) Buffer Display Action Functions")~
  (setopt ellama-chat-display-action-function #'display-buffer-full-frame)
  (setopt ellama-instant-display-action-function #'display-buffer-at-bottom)
  :config
  ;; show ellama context in header line in all buffers
  (ellama-context-header-line-global-mode +1))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '((java-mode) "~/Apps/jdt-language-server/bin/jdtls"))
  (add-to-list 'eglot-server-programs '((csharp-mode) "~/.dotnet/tools/csharp-ls"))
  )
(use-package evil
 :init
 (setq evil-want-C-u-scroll t))
(use-package evil-exchange)
(use-package evil-matchit)
(use-package evil-nerd-commenter)
(use-package evil-numbers)
(use-package evil-surround
 :config
 (global-evil-surround-mode)
 ;; key bindings
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
  (kbd "<leader>q") '(lambda () (interactive)
                       ;;(if (= (length (window-list)) 1) (delete-frame) (evil-window-delete)))
                       (if (= (length (window-list)) 1) (save-buffers-kill-emacs) (evil-window-delete)))
  (kbd "<leader>Q") 'kill-emacs
  (kbd "<leader>w") 'save-buffer
  (kbd "<leader>e") 'split-window-below
  (kbd "<leader>o") 'split-window-right
  (kbd "<leader>T") 'evil-buffer-new
  (kbd "<leader>X") 'evil-delete-buffer
  (kbd "<leader>N") 'evil-next-buffer
  (kbd "<leader>P") 'evil-prev-buffer
  (kbd "<leader>b") 'switch-to-buffer
  (kbd "<leader>t") 'tab-new
  (kbd "<leader>x") 'tab-close
  (kbd "<leader>n") 'tab-next
  (kbd "<leader>p") 'tab-previous
  (kbd "<leader>g") 'magit
  (kbd "<leader>h") 'help
  (kbd "<leader>C") 'toggle-theme
  (kbd "<leader>s") 'avy-goto-char-2
  (kbd "<leader>d") 'eglot-find-declaration
  (kbd "<leader>D") 'eglot-find-typeDefinition
  (kbd "<leader>i") 'eglot-find-implementation
  (kbd "<leader>r") 'eglot-rename
  ;;(kbd "<leader>ff") 'project-find-file
  (kbd "<leader>ff") 'find-name-dired
  (kbd "<leader>fg") 'helm-regexp
  (kbd "<leader>fp") 'helm-recentf
  (kbd "<leader>/") 'comment-line
  (kbd "<leader><return>") 'ellama-code-complete
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
 )
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(custom-enabled-themes '(womby-dark))
 '(custom-safe-themes
   '("ce705d0cd0b55d19cb48596f0f2b91c0c986c2d015a48aa22a4ee588cd128445"
     "427eb94b8511f8d6d1e7756367369beb179f19dfbe0de478065543cab9c2c3d5" default))
 '(custom-theme-directory "~/.config/emacs/themes")
 '(delete-selection-mode nil)
 '(global-display-line-numbers-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message nil)
 '(kill-buffer-delete-auto-save-files t)
 '(make-backup-files nil)
 '(org-agenda-files
   '("~/Sync/Notes/School Notes/Semester 8/Homework.org"))
 '(package-selected-packages
   '(avy company ellama evil flycheck go-mode magit rainbow-delimiters typescript-mode
         which-key))
 '(read-buffer-completion-ignore-case t)
 '(read-file-name-completion-ignore-case t)
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
(global-set-key (kbd "C-n") 'completion-preview-next-candidate)
(global-set-key (kbd "C-p") 'completion-preview-prev-candidate)
(global-set-key (kbd "C-<return>") 'ellama-chat)

(global-completion-preview-mode)
(which-key-mode)
(electric-pair-mode)
(evil-mode)
;;(add-hook 'text-mode-hook 'evil-local-mode)
(setq-default fill-column 85) ;;Exactly half my 1080p screen
(add-hook 'text-mode-hook 'auto-fill-mode)
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'text-mode-hook 'electric-pair-mode)
;;(add-hook 'prog-mode-hook 'evil-local-mode)
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'prog-mode-hook 'eglot-ensure)
(add-hook 'before-save-hook 'whitespace-cleanup)
(add-hook 'before-save-hook 'eglot-format-buffer)

(add-to-list 'default-frame-alist '(font . "SpaceMono Nerd Font-12"))

(load-file (concat custom-theme-directory "/womby-light-theme.el"))
(load-file (concat custom-theme-directory "/womby-dark-theme.el"))

(add-hook 'tetris-mode-hook
          (lambda ()
            (keymap-set tetris-mode-map "<up>" 'tetris-rotate-next)))

;; To recompile all .el files, run C-u 0 M-x byte-recompile-directory
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
