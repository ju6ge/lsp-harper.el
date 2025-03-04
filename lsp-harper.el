;;; lsp-harper.el --- Description -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2024 Felix Richter
;;
;; Author: Felix Richter <judge@felixrichter.tech>
;; Maintainer: Felix Richter <judge@felixrichter.tech>
;; Created: März 04, 2024
;; Modified: März 04, 2024
;; Version: 0.0.1
;; Keywords: languages tools lsp harper
;; Homepage: https://github.com/ju6ge/lsp-harper
;; Package-Requires: ((emacs "24.3"))
;;
;; This file is not part of GNU Emacs.
;;
;;; Commentary:
;;
;;  Description
;;
;;; Code:
;;;
(require 'lsp-mode)

(defgroup lsp-harper nil
  "Settings for harper grammar language Server."
  :prefix "lsp-harper-"
  :group 'lsp-mode
)

(defcustom lsp-harper-active-modes
  '( rust-mode python-mode ess-mode typst-ts-mode )
  "List of major modes that work with lsp-ai"
  :type 'list
  :group 'lsp-harper
)

(lsp-register-client
  (make-lsp-client
    :new-connection (lsp-stdio-connection
                     "harper-ls -s")
    :major-modes lsp-harper-active-modes
    :add-on? 't
    :priority -3
    :server-id 'lsp-harper
  )
)

(provide 'lsp-harper)
;;; lsp-harper.el ends here
