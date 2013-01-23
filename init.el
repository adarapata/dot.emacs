;; -*- Mode: Emacs-Lisp ; Coding: utf-8 -*-

;; スタートアップ時のメッセージを抑制
(setq inhibit-startup-message t)

;; エンコーディングは基本的にUTF-8
(set-language-environment "Japanese")
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; ビープ音を抑制
(setq ring-bell-function '(lambda ()))

;; 行数、列数を表示
(line-number-mode t)
(column-number-mode t)

;; yes/noを、y/nで選択できるようにする。
;(ser 'yes-or-no-p 'y-or-n-p)

;; kill-lineで行末の改行文字も削除
(setq kill-whole-line t)

;; リージョンをC-hで削除
(delete-selection-mode 1)

;; インデントはスペースで
(setq-default indent-tabs-mode nil)

;; C-
(global-set-key "\C-c" 'kill-ring-save)
 
;; C-hをBackSpaceに
(global-set-key "\C-h" 'delete-backward-char)

;; C-mでインデントも。
(global-set-key "\C-m" 'newline-and-indent)

;; C-x ?でヘルプ
(global-set-key "\C-x?" 'help)

;; 
(add-to-list 'exec-path "/opt/local/bin")
(add-to-list 'exec-path "/usr/local/bin")

;;ディレクトリ追加
(add-to-list 'load-path "~/.emacs.d/elisp")

(setq load-path (cons "~/.emacs.d/elisp" load-path))

;;Ctr+tでウィンドウきりかえ
(define-key global-map (kbd "C-t") 'other-window)

;行番号・カラム番号表示
(column-number-mode t)

;;行番号は常に表示
(global-linum-mode t)

;; リージョンの背景色変更
(set-face-background 'region "red")
(set-face-foreground 'modeline "red")
;(defface my-hl-line-face
;  ;; 背景がdarkならば背景色を紺に
;  '((((class color) (background dark))
;     (:background "black"))
;    ;; 背景がlightならば背景色を緑に
;    (((class color) (background light))
;    (:background "red" t))
;   (t (:bold t)))
; "hl-line's my face")
(setq hl-line-face 'my-hl-line-face)
(global-hl-line-mode t)

;; 対応する括弧を強調
(setq show-paren-delay 0) ; 表示までの秒数
(show-paren-mode t) ;有効化
;; parenのスタイル: expressionは括弧内も強調表示
(setq show-paren-style 'expression)
;; フェイスを変更
;(set-face-background  'show-paren-match-face nil)
(set-face-underline-p 'show-paren-match-face "red")

(setq make-backup-files nil)

(setq auto-save-default nil)

(require 'install-elisp)
(setq install-elisp-repository-directory "~/.emacs.d/elisp/")
;自動補間
(require 'auto-complete)
;====================================
;;jaspace.el を使った全角空白、タブ、改行表示モード
;;切り替えは M-x jaspace-mode-on or -off
;====================================
(require 'jaspace)
(setq-default jaspace-modes nil)
;; 全角空白を表示させる。
(setq-default jaspace-alternate-jaspace-string "□")
;; 改行記号を表示させる。
(setq-default jaspace-alternate-eol-string "↓\n")
;; タブ記号を表示。
(setq-default jaspace-highlight-tabs t)

; use ^ as a tab marker(global-auto-complete-mode t)

(require 'ruby-mode)
;(defun ruby-mode-set-encoding () ())

;ruby用設定
;インデント
(setq ruby-indent-lebel 2
      ruby-deep-indent-paren-style nil
      ruby-indent-tabs-mode t)


(require 'anything)
;(require 'ruby-electric nil t)
;do end にハイライトが付く
;(when (require 'ruby-block nil t)
;  (setq ruby-block-highlight-toggle t))
;インタラクティブruby
;(autoload 'run-ruby "inf-ruby"
;  "Run as inferior Ruby process")
;(autoload 'inf-ruby-keys "inf-ruby"
;  "Set local key defs for inf-ruby in ruby-mode")
;;; ruby-mode-hook
;(defun ruby-mode-hooks ()
;  (inf-ruby-keys)
;  (ruby-block-mode t))
;
;(add-hook 'ruby-mode-hook 'ruby-mode-hooks)

;PHP設定
(require 'php-mode)
; 設定例
(autoload 'php-mode "php-mode")
(setq auto-mode-alist
            (cons '("\\.php\\'" . php-mode) auto-mode-alist))
(setq php-mode-force-pear t)
(add-hook 'php-mode-user-hook
            '(lambda ()
                    (setq php-manual-path "/usr/local/share/html")
                         (setq php-manual-url "http://www.phppro.jp/phpmanual/")))
