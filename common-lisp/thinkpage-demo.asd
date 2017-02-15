(asdf:defsystem :thinkpage-demo
  :version "0.0.1"
  :description "thinkpage weather API demo."
  :author "Muyinliu Xing <muyinliu@gmail.com>"
  :depends-on (:flexi-streams
               :ironclad
               :cl-base64
               :drakma)
  :components ((:static-file "thinkpage-demo.asd")
               (:file "thinkpage-demo")))
