(in-package #:clog-piano)

(defparameter *from* 53)
(defparameter *to* 72)

(defparameter *default-port* 5000)
(defvar *server* nil)

(defun midi->note (midi)
  (multiple-value-bind (octave step) (floor midi 12)
    (multiple-value-bind (name color) (step-info step)
      (make-note
       :midi midi
       :name name
       :octave (1- octave)
       :color color))))

(defun create-piano (clog-obj &key (from 60) (to 71))
  (let* ((div (create-div clog-obj :class "piano-container"))
         (ul (create-unordered-list div :class "piano-keys-list")))
    (dolist (note (loop :for midi :from from :to to :collect (midi->note midi)))
      (let* ((li (if (eql :white (note-color note))
                     (create-list-item ul :class "piano-keys white-key")
                     (create-list-item ul :class "piano-keys black-key")))
             (label (create-label li :style "position:absolute;bottom:0;")))
        ;; (setf (style li "align-text") "bottom")
        (setf (text label) (format nil "~a~%~a" (note-name note)(note-midi note)))
        (set-on-click li (lambda (obj)
                           (declare (ignore obj))
                           (play-midi (note-midi note))))))))

(defun on-new-window (page)
  (setf (title (html-document page)) "Piano")
  (let ((style (create-style-block page)))
    (setf (text style) *piano-css*))
  (create-piano page :from *from* :to *to*))

(defun start-server (&key (port *default-port*))
  (unless *server*
    (setf *server*
          (initialize 'on-new-window
                      :host "127.0.0.1"
                      :port port))))

(defun stop-server ()
  (when *server*
    (shutdown)
    (setf *server* nil)))

(defun open-piano (&key (from 60) (to 71))
  (setf *from* from *to* to)
  (start-server)
  (start-sc)
  (open-browser))
