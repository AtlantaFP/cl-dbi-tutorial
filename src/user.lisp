(defpackage :cl-dbi-tutorial/user
  (:use :cl)
  (:export
   #:user
   #:make-user
   #:insert-user
   #:update-user
   #:get-user
   #:delete-user
   #:first-name
   #:last-name
   #:age
   #:occupation))

(in-package :cl-dbi-tutorial/user)

(defclass user ()
  ((first-name :initarg :first-name :accessor first-name)
   (last-name :initarg :last-name :accessor last-name)
   (occupation :initarg :occupation :accessor occupation)
   (age :initarg :age :accessor age)))

(defun make-user (&key first-name last-name age occupation)
  "constructor for a user object"
  (make-instance 'user :first-name first-name
		       :last-name last-name
		       :age age
		       :occupation occupation))

(defun insert-user (db user-obj)
  "insert USER into the database DB"
  )

(defun update-user (db user-obj)
  "update USER in the database DB."
  )

(defun delete-user (db user-obj)
  "delete USER from database DB."
  )
