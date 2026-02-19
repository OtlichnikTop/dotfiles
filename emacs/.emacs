(setq custom-file "~/.emacs.custom.el")

(tool-bar-mode 0)
(menu-bar-mode 0)
(scroll-bar-mode 0)

(setq autosave-default 0)

(electric-pair-mode)
(setq electric-pair-preserve-balance nil)

(global-display-line-numbers-mode)
(setq display-line-numbers-type 'relative)
(show-paren-mode)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default standart-indent 4)

;; YaSnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Emacs Evil Mode
(require 'evil)
(evil-mode 1)

;; Melpa Archive
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)

;; Multiple Cursors
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(with-eval-after-load 'wdired
    (add-hook 'wdired-mode-hook
        (lambda ()
            (when (fboundp 'multiple-cursors-mode)
                (setq-local multiple-cursors-mode-enabled t)))))

;; Ligature support
(use-package ligature
    :config
    (ligature-set-ligatures 't '("www"))
    (ligature-set-ligatures 'eww-mode '("ff" "fi" "ffi"))
    (ligature-set-ligatures 'prog-mode '("<---" "<--" "<<-" "<-" "->" "->>" "-->" "--->"
                                            "<===" "<==" "<<=" "<=" ">=" ">>=" "=>" "=>>" "==>" "===>"
                                            "<->" "<-->" "<--->" "<---->" "<=>" "<==>" "<===>" "<====>"
                                            "::" ":::" "<~~" "~~>" "==" "!=" "/*" "*/" "<!--" "<!---"
                                            "===" "!==" "!===" "<:" ":>" ":=" "=:" "*=" "*+"
                                            "<*" "<*>" "*>" "</" "</>" "/>" "<|" "<|>" "|>"))
    (global-ligature-mode t))

;; IDO Fix
(load-file "~/.emacs.local/ido-completing-read+.el")
(require 'ido-completing-read+)
(ido-mode)
(ido-everywhere)
(ido-ubiquitous-mode)

(add-to-list 'default-frame-alist `(font . "Iosevka SS09-25"))

(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c r") 'recompile)

;; C
(load-file "~/.emacs.local/simpc-mode.el")
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;; Fasm
(load-file "~/.emacs.local/fasm-mode.el")
(require 'fasm-mode)
(add-to-list 'auto-mode-alist '("\\.\\(f\\)?asm\\'" . fasm-mode))

;; Nasm
(require 'nasm-mode)
(add-to-list 'auto-mode-alist '("\\.nasm\\'" . nasm-mode))

;; Rust
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

;; Emacs Lisp
(add-hook 'emacs-lisp-mode-hook
    '(lambda ()                         ;; Evaluate sexpression and put result at cursor position
         (local-set-key (kbd "C-c C-j")
             (quote eval-print-last-sexp))
         (setq-local lisp-indent-offset 4)))

;; Python 
(setq python-indent-offset 4)

;; Lua
(setq lua-indent-level 4)

;; Pascal
(setq pascal-indent-level 4)

(add-to-list 'auto-mode-alist '("Cask" . emacs-lisp-mode))


(load-file custom-file)
