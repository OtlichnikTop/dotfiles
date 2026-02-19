;; ----------------------------------------
;; Garry's Mod Lua Syntax by OtlichnikTop
;; ----------------------------------------

(require 'subr-x)

(defvar glua-mode-syntax-table
    (let ((table (make-syntax-table)))
        ;; Lua comments
        (modify-syntax-entry ?- ". 12b" table)
        (modify-syntax-entry ?\n "> b" table)
        ;; Strings
        (modify-syntax-entry ?' "\"")
        ))

(define-derived-mode glua-mode prog-mode "GLua"
    "Simple major mode for editing Garry's Mod Lua files"
    :syntax-table glua-mode-syntax-table
    (setq-local comment-start "-- "))

(provide 'glua-mode)
