(setq load-path
      (cons (expand-file-name "~/lib/emacs") load-path))

(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")
                         ("tromey"    . "http://tromey.com/elpa/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")))

(package-initialize)


(put 'eval-expression 'disabled nil)
(menu-bar-mode -1)
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(defun ts ()
  (interactive)
  (insert (format-time-string "%D %R %Z")))


(defun gpw ()
  (interactive)
  (insert (substring (shell-command-to-string "gpw") 0 8)))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(epa-file-cache-passphrase-for-symmetric-encryption t)
 '(lj-update-mode-hook (quote (flyspell-mode)))
 '(python-indent 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(put 'narrow-to-region 'disabled nil)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-i" 'ispell-buffer)
(global-set-key "\C-c\r" 'magit-status)
(global-set-key "\C-c\C-c" 'compile)

(setq numitor 1)

(defun numit (start end)
  (move-to-column start t)
  (insert (number-to-string numitor))
  (setq numitor (+ numitor 1)))

(defun number-rectangle (start end &optional prefix)
  (interactive
   (progn (barf-if-buffer-read-only)
          (list
           (region-beginning)
           (region-end)
           (prefix-numeric-value current-prefix-arg))))
  (if prefix
      (setq numitor prefix)
    (setq numitor 1))
  (apply-on-rectangle 'numit start end))


(display-time)


(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))

(defun unfill-region ()
  (interactive)
  (let ((fill-column (point-max)))
    (fill-region (region-beginning) (region-end) nil)))

(add-hook 'php-mode-hook 'local-keybindings)

(defun local-keybindings ()
  (local-set-key "\C-c\r" 'magit-status))


;
; HasOffers local style hack
;


(require 'php-mode)
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
      '(lambda ()
         (setq indent-tabs-mode t)
         (setq tab-width 4)
         (setq c-basic-indent 4)))
