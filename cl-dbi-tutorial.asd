(defsystem "cl-dbi-tutorial"
  :version "0.1.0"
  :author ""
  :license ""
  :depends-on ("alexandria"
               "serapeum"
	       "rove"
               "cl-dbi")
  :components ((:module "src"
                :components
                ((:file "user")
		 (:file "main"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-dbi-tutorial/tests"))))

(defsystem "cl-dbi-tutorial/tests"
  :author ""
  :license ""
  :depends-on ("cl-dbi-tutorial"
               "rove")
  :components ((:module "tests"
                :components	      
                ((:file "user")
		 (:file "main"))))
  :description "Test system for cl-dbi-tutorial"
  :perform (test-op (op c) (symbol-call :rove :run c)))
