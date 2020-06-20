(in-package :xport)

(eval-when (:compile-toplevel :load-toplevel :execute)
  (export
    (defmacro xport-when (situations &body forms)
      `(eval-when ,situations
         (export
           ,@forms))))

  (export
    (defmacro xport (&body forms)
      `(xport-when (:compile-toplevel :load-toplevel :execute)
         ,@forms))))

(export
  (defmacro xdefmacro (name lambda-list &body body)
    `(xport
       (defmacro ,name ,lambda-list ,@body))))
