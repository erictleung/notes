;; Snippets for Emacs Lisp

;; Unset keybindings
;; Use case when global keybindings are having issues
;; Source: https://stackoverflow.com/a/7549357/6873133
(dolist (key '("\C-a" "\C-b" "\C-c" "\C-d" "\C-e" "\C-f" "\C-g"
               "\C-h" "\C-k" "\C-l" "\C-n" "\C-o" "\C-p" "\C-q"
               "\C-t" "\C-u" "\C-v" "\C-x" "\C-z" "\e"))
  (global-unset-key key))
