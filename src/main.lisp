(defpackage cl-dbi-tutorial
  (:use :cl)
  (:import-from :cl-dbi-tutorial/db
                #:connect
                #:disconnect
                #:create-db-schema))

(in-package :cl-dbi-tutorial)

(defparameter *connection* (connect "/Users/vedam/users.db"))

;; load our schema
(create-db-schema *connection*)

;; close database
(disconnect *connection*)
