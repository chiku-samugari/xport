(in-package :xport)

(export
  (defmacro xport (situations &body forms)
    `(eval-when ,(if (eq situations t)
                   (:compile-toplevel :load-toplevel :execute)
                   ,situations)
       (export
         ,@forms))))
