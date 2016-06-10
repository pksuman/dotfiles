
; Give Space of 4 with command for aesthetic purpose & put a blank line between two different
; category of commands

; turn on Semantic
    (semantic-mode 1)
; turn on ede mode let's just keep it simple , makefile
;    (global-ede-mode 1)
; turn on automatic reparsing of open buffers in semantic
;    (global-semantic-idle-scheduler-mode 1)
; Remove the welcome screen
    (setq inhibit-startup-message t)
; Remove buffer message
   (setq initial-scratch-message "")
; Disable menu-bar
;   (menu-bar-mode -1)
;hide tool-bar
;   (tool-bar-mode -1)

; Function key binding
    (global-set-key [f2] 'search-forward)
    (global-set-key [f3] 'undo)
    (global-set-key [f4] "\C-g")

    (global-set-key [f5] 'find-file)
    (global-set-key [f6] 'save-buffer)
    (global-set-key [f7] 'kill-buffer)
    (global-set-key [f8] 'save-buffers-kill-terminal)






; Keypad bindings
    (global-set-key [up] "\C-p")
    (global-set-key [down] "\C-n")
    (global-set-key [left] "\C-b")
    (global-set-key [right] "\C-f")
    (global-set-key [home] "\C-a")
    (global-set-key [end] "\C-e")
    (global-set-key [prior] "\M-v")
    (global-set-key [next] "\C-v")
    (global-set-key [C-up] "\M-\C-b")
    (global-set-key [C-down] "\M-\C-f")
    (global-set-key [C-left] "\M-b")
    (global-set-key [C-right] "\M-f")
    (global-set-key [C-home] "\M-<")
    (global-set-key [C-end] "\M->")
    (global-set-key [C-prior] "\M-<")
    (global-set-key [C-next] "\M->")

; Adding melpa
    (require 'package)
    (add-to-list 'package-archives '("MELPA" ."http://melpa.milkbox.net/packages/"))
    (package-initialize)

; start auto-complete with emacs
;    (require 'auto-complete)
;    (require 'auto-complete-config)
;    (ac-config-default)

; start yasnippet with emacs
;    (require 'yasnippet)
;    (yas-global-mode 1)

; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
;    (defun my:ac-c-header-init ()
;      (require 'auto-complete-c-headers)
;      (add-to-list 'ac-sources 'ac-source-c-headers)
;      (add-to-list 'achead:include-directories '"/usr/lib/gcc/i686-linux-gnu/5/include")
;    )
; now let's call this function from c/c++ hooks
;    (add-hook 'c++-mode-hook 'my:ac-c-header-init)
;    (add-hook 'c-mode-hook 'my:ac-c-header-init)

;enables flycheck
;   (add-hook 'after-init-hook #'global-flycheck-mode)

;enable google-c-style
;    (add-hook 'c-mode-common-hook 'google-set-c-style)
 ;   (add-hook 'c-mode-common-hook 'google-make-newline-indent)

; enable afternoon theme
  ; (load-theme 'afternoon t)

;enable dakrone theme
;    (load-theme 'dakrone t)
;enable gotham theme
;    load-theme 'gotham t)
;enable atom-dark them my favorite
    (load-theme 'atom-dark t)

;enable smooth scrolling
;   (require 'smooth-scrolling)
 ;  (setq smooth-scroll-margin 5)
;hide comment
 ;  (require 'hide-comnt)

;enable c-eldoc-mode
 ;  (require 'eldoc)
 ;  (add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)
;enable anaconda mode
  ; (add-hook 'python-mode-hook 'anaconda-mode)
;enable elpy-mode
