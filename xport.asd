;;; xport.asd
;;;
;;; Author: chiku (Takehiko Nawata, samugari.penguin@gmail.com)
;;; License: MIT License
(defsystem xport
  :name "xport"
  :version "0.9.0"
  :maintainer "Takehiko Nawata"
  :author "Takehiko Nawata"
  :license "MIT License"
  :description "Macro collection to export symbols."
  :long-description ""
  :serial t
  :components ((:file "src/packages")
               (:file "src/xport")))
