(setq tls-checktrust t)
(setq gnutls-verify-error t)
(package-initialize)
(setq package-enable-at-startup nil)
(setq package-archives nil)

;; Load sources for package manager
(dolist (source '( ("gnu" . "https://elpa.gnu.org/packages/")
                   ("melpa-stable" . "https://stable.melpa.org/packages/")
                   ("melpa" . "https://melpa.org/packages/")))
                   (add-to-list 'package-archives source t))
(unless (and (file-exists-p "~/.emacs.d/elpa/archives/gnu")
             (file-exists-p "~/.emacs.d/elpa/archives/melpa")
             (file-exists-p "~/.emacs.d/elpa/archives/melpa-stable"))
             (package-refresh-contents))

;; Install use-package.el if necessary
(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-verbose t)
(setq use-package-always-ensure t)
(require 'use-package)

(use-package auto-compile
  :config (auto-compile-on-load-mode))
(setq load-prefer-newer t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("2b8dff32b9018d88e24044eb60d8f3829bd6bbeab754e70799b78593af1c3aba" "b181ea0cc32303da7f9227361bb051bbb6c3105bb4f386ca22a06db319b08882" "962dacd99e5a99801ca7257f25be7be0cebc333ad07be97efd6ff59755e6148f" default)))
 '(display-battery-mode t)
 '(git-gutter:added-sign "++")
 '(git-gutter:deleted-sign "--")
 '(git-gutter:modified-sign "~~")
 '(package-selected-packages
   (quote
    (which-key linum-relative evil-nerd-commenter airline-themes powerline git-gutter magit solarized-theme auto-compile use-package)))
 '(save-place t)
 '(show-paren-mode t))

(global-set-key (kbd "C-c C-r") 'load-file)

;; Start off with beautifying this dumpsterfire
(use-package solarized-theme)
(load-theme 'solarized-dark t)
(setq solarized-high-contrast-mode-line t)

;; Powerline!
(use-package powerline)
(powerline-center-theme)
(use-package airline-themes)
(load-theme 'airline-solarized-alternate-gui)

;; Commentation
(use-package evil-nerd-commenter
  :config
  (evilnc-default-hotkeys))


;; Disable various bars
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; Change font
(set-default-font "SourceCodePro+Powerline+Awesome Regular")

;; Keyboard scroll one line at a time
(setq scroll-step 1)

;; Show line numbers and allow relative line numbers
(global-linum-mode t)
(use-package linum-relative
  :commands linum-relative-toggle
  :init
  global-set-key (kbd "C-c l") 'Linum-relative-toggle))
 
;; Free the left alt-key for special characters
(setq ns-right-alternate-modifier nil)


;; Install git stuff and configure it
(use-package magit)
(global-set-key (kbd "C-x g") 'magit-status)

(use-package git-gutter)
(global-git-gutter-mode +1)
;;; Jump to next/previous hunk
(global-set-key (kbd "C-x p") 'git-gutter:previous-hunk)
(global-set-key (kbd "C-x n") 'git-gutter:next-hunk)

;; Heeeeehlp when waiting in minibuffer with an unfinished command
(use-package which-key
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
