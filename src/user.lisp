(defpackage :cl-dbi-tutorial/user
  (:use :cl)
  (:export
   #:user
   #:make-user
   #:insert-user
   #:update-user
   #:get-user
   #:get-user-id-by-name
   #:delete-user
   #:first-name
   #:last-name
   #:age
   #:occupation))

(in-package :cl-dbi-tutorial/user)

;; our user class abstraction (used as part of the API to leverage the database)
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

(defun insert-user (conn user-obj)
  "insert USER into the database DB"
  (with-slots (first-name last-name age occupation) user-obj
   (dbi:do-sql conn "INSERT INTO users (fname, lname, age, occupation) VALUES (?, ?, ?, ?)"
     first-name
     last-name
     age
     occupation)))

(defun update-user (db id user-obj)
  "update USER in the database DB."
  (with-slots (first-name last-name age occuaption) user-obj
    (dbi:do-sql "UPDATE users SET fname=?, lname=?, age=?, occupation=? WHERE id=?"
      first-name
      last-name
      age
      occupation
      id)))

(defun delete-user (db id)
  "delete USER from database DB."
  (dbi:do-sql "DELETE FROM users WHERE id=?" id))

;; Write your database driver on top of cl-dbi
;;
;; create subclass of dbi.driver:dbi-driver
;; make-connection, disconnect, execute-using-connection
;; do-sql, escape-sql, fetch-using-connection
