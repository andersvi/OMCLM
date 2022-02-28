(in-package :om)


;; (in-package :clm)

;; (load "/home/andersvi/site/cm-sys/clm-5/all.lisp")
;; (load "/home/andersvi/site/cm-sys/clm-5/noise")
;; (setf noter '(fm-noise 0 2.0 500 .25 '(0 0 25 1 75 1 100 0) .1 .1 1000 '(0 0 100 1) .1 .1 10 1000 '(0 0 100 1) 0 0 100 500 '(0 0 100 1) 0 0))

;; (ws-wrapper noter :channels 3)


(defun ws-wrapper (notelist &key (output *clm-file-name*) continue-old-file
			      (channels *clm-channels*)
			      (verbose *clm-verbose*) info comment (statistics *clm-statistics*)
			      (srate *clm-srate*) sampling-rate
			      reverb reverb-data (reverb-channels *clm-reverb-channels*) revfile (decay-time 1.0) reverb-func reverb-args
			      (play *clm-play*)
			      force-recomputation
			      (notehook *clm-notehook*)
			      (header-type *clm-header-type*) (data-format *clm-data-format*) save-body
			      scaled-to scaled-by (clipped *clm-clipped*)
		   &allow-other-keys)

  "ws-wrapper around CLMs 'with-sound'-macro, for use in om patches.

with-sound is a macro that performs all the various services needed to produce and play a sound file; it also wraps an unwind-protect around its body to make sure that everything is cleaned up properly if you happen to interrupt computation; at the end it returns the output file name. with-sound opens an output sound file, evaluates its body (normally a bunch of instrument calls), applies reverb, if any, as a second pass, and plays the sound, if desired. The sound file's name defaults to \"test.snd\" or something similar; use the output argument to write some other file

Check extensive documentation: https://ccrma.stanford.edu/software/snd/snd/clm.html#with-sound
"
  (clm::with-sound (:output output
		    :continue-old-file continue-old-file
		    :channels channels
		    :info info
		    :comment comment
		    :srate srate
		    :reverb reverb
		    :reverb-data reverb-data
		    :reverb-channels reverb-channels
		    :revfile revfile
		    :decay-time decay-time
		    :reverb-func reverb-func
		    :reverb-args reverb-args
		    :play play
		    :force-recomputation force-recomputation
		    :notehook notehook
		    :statistics statistics
		    :header-type header-type
		    :data-format data-format
		    :save-body save-body
		    :verbose verbose
		    :scaled-to scaled-to
		    :clipped clipped
		    :scaled-by scaled-by
		    :sampling-rate sampling-rate
		    )
    notelist))

