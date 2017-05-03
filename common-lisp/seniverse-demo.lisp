(defpackage seniverse-demo
  (:use :cl))

(in-package :seniverse-demo)

(defvar *api-key* "4r9bergjetiv1tsd") ;; Please use your own API key
(defvar *user-id* "U785B76FC9")       ;; Please use your own User ID
(defvar *auth-ttl* 1800) ;; second
(defvar *api-url* "https://api.seniverse.com/v3/weather/now.json")
(defvar *universal-time-diff-unix-time* 2208988800)

(defun universal-time->unix-time (universal-time)
  (- universal-time *universal-time-diff-unix-time*))

(defun unix-time->universal-time (unix-time)
  (+ unix-time *universal-time-diff-unix-time*))

(defun test ()
  (let* ((unix-time (universal-time->unix-time (get-universal-time)))
         (string (format nil "ts=~A&ttl=~A&uid=~A"
                         unix-time
                         *auth-ttl*
                         *user-id*))
         (string-vector (flex:string-to-octets string :external-format :utf-8))
         (key-vector (flex:string-to-octets *api-key* :external-format :utf-8))
         (hmac (ironclad:make-hmac key-vector 'ironclad:sha1))
         (signature (progn
                      (ironclad:update-hmac hmac string-vector)
                      (drakma:url-encode
                       (base64:usb8-array-to-base64-string
                        (ironclad:hmac-digest hmac))
                       :utf-8)))
         (request-url (format nil "~A?location=~A&ts=~A&ttl=~A&uid=~A&sig=~A"
                              *api-url*
                              "beijing"
                              unix-time
                              *auth-ttl*
                              *user-id*
                              signature)))
    (setf request-url (ppcre:regex-replace-all "%3D" request-url "%3d"))
    (format *terminal-io* "request-url: ~A~%~%" request-url)
    (multiple-value-bind (data status-code)
        (drakma:http-request request-url
                             :preserve-uri t
                             :additional-headers '(("Accept-Encoding" . "")))
      (format *terminal-io* "~A~%~A~%"
              (flex:octets-to-string data :external-format :utf-8)
              status-code))))

(test)
