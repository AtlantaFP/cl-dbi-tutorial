(defpackage cl-dbi-tutorial/tests/main
  (:use :cl
        :cl-dbi-tutorial
        :rove))
(in-package :cl-dbi-tutorial/tests/main)

;; NOTE: To run this test file, execute `(asdf:test-system :cl-dbi-tutorial)' in your Lisp.

(deftest test-target-1
  (testing "should (= 1 1) to be true"
    (ok (= 1 1))))
