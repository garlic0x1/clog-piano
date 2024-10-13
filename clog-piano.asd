(asdf:defsystem #:clog-piano
  :author "garlic0x1"
  :depends-on (#:alexandria #:clog #:cl-collider)
  :serial t
  :components ((:file "package")
               (:file "backend")
               (:file "css")
               (:file "frontend")))
