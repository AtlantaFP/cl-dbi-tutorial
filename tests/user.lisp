(defpackage cl-dbi-tutorial/tests/user
  (:use :cl
        :cl-dbi-tutorial/db
        :cl-dbi-tutorial/user
	:rove))
(in-package :cl-dbi-tutorial/tests/user)


;;
;; dummy macro used as a replacement for dbi:with-connection for the purposes
;; of this application so that we can connect and create the schema for testing
;;
(defmacro with-database (db &body body)
  `(let* ((conn (connect ,db)))
     (create-db-schema conn)
     ,@body
     (disconnect conn)))

(deftest test-user-suite
  (testing "make-user returns a user instance"
    (let* ((expected-fname "John")
	   (expected-lname "Doe")
	   (expected-age 34)
	   (expected-occupation "student")
	   (test-user (make-user :first-name expected-fname
				 :last-name expected-lname				 
				 :age expected-age				 
				 :occupation expected-occupation)))
      (ok (string= (first-name test-user) expected-fname) "first names must match")
      (ok (string= (last-name test-user) expected-lname) "last names must match")
      (ok (= (age test-user) expected-age) "ages must match")
      (ok (string= (occupation test-user) expected-occupation) "occupations must match")))
  (testing "user objects can get properly inserted into the database."
    (with-database "test.db"
     (let ((user (make-user :first-name "John"
                            :last-name "Doe"
                            :age 34
                            :occupation "professional engineer")))
       (let ((rows (insert-user conn user)))
         (ok (= 1 rows) "update function properly returns that one row gets inserted into the database."))
       (dbi:do-sql conn "DELETE FROM users"))))
  )
