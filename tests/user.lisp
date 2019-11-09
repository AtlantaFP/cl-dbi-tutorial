(defpackage cl-dbi-tutorial/tests/user
  (:use :cl
        :cl-dbi-tutorial/user
	:rove))
(in-package :cl-dbi-tutorial/tests/user)

(deftest test-make-user
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
      (ok (string= (occupation test-user) expected-occupation) "occupations must match"))))
