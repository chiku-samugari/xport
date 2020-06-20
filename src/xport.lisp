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
    "XDEFMACRO defines a macro and XPORTs the argument given to NAME
     parameter. XPORT means that the process to EXPORT the NAME is done
     in any situation i.e. (:compile-toplevel :load-toplevel :execute).
     As well as CL:DEFMACRO, the binding between the NAME and the
     defined macro function is established in any situation, too. This
     macro is therefore typically used to define utility macros that is
     used to define other operators in the same file."
    `(xport
       (defmacro ,name ,lambda-list ,@body))))

(export
  (defmacro xdefun (name lambda-list &body body)
    "XDEFUN defines a function and XPORTs the argument given to NAME
     parameter. Unlike CL:DEFUN and CL:EXPORT, both processes
     (define and export) are executed in any situation i.e.
     (:compile-toplevel :load-toplevel :execute). The usage of this
     macro should therefore be very limited. The utility functions that
     is used in the definition of macro defined in the same file AND
     used in some other packages too should be defined by this macro.
     Since an utility functions that is only used in the definition of
     some macros defined in the same file should not be CL:EXPORTed, we
     should use CL:EVAL-WHEN with a proper situation specification to
     make it properly accessible. An utility function that is not used
     in the same file to define some macros on the other hand, does not
     need to be accessible during the compilation time and we should use
     CL:EXPORT (or some other stuff to export symbols) to export the
     symbol that names the function."
    `(xport
       (defun name lambda-list &body body))))
