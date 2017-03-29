(asdf:defsystem :seniverse-demo
  :version "0.0.1"
  :description "seniverse weather API demo."
  :author "Muyinliu Xing <muyinliu@gmail.com>"
  :depends-on (:flexi-streams
               :ironclad
               :cl-base64
               :drakma)
  :components ((:static-file "seniverse-demo.asd")
               (:file "seniverse-demo")))
