(in-package #:clog-piano)

(defun load-synths ()
  (defsynth saw-synth ((note 60) (dur 0.5) (vol 1))
    (let* ((env (env-gen.kr (env `(0 ,vol 0) (list (* dur .1) (* dur .9))) :act :free))
           (freq (midicps note))
           (sig (lpf.ar (saw.ar freq env) (* freq 2))))
      (out.ar 0 (list sig sig)))))

(defstruct note
  midi
  name
  octave
  color)

(defun step-info (step)
  (values-list
   (a:assoc-value
    '((0 "C" :white)
      (1 "C#" :black)
      (2 "D" :white)
      (3 "D#" :black)
      (4 "E" :white)
      (5 "F" :white)
      (6 "F#" :black)
      (7 "G" :white)
      (8 "G#" :black)
      (9 "A" :white)
      (10 "A#" :black)
      (11 "B" :white))
    step)))

(defun play-midi (midi)
  (synth 'saw-synth :note midi))

(defun start-sc ()
  (setf *s* (make-external-server "localhost" :port 48800))
  (server-boot *s*)
  (load-synths)
  (values))

(defun stop-sc ()
  (server-quit *s*))
