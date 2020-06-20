(in-package :xport)

(export
  (defmacro xport-when (situations &body forms)
    `(eval-when ,situations
       (export
         ,@forms)))

  (defmacro xport (&body forms)
    `(xport-when (:compile-toplevel :load-toplevel :execute)
       ,@forms)))
