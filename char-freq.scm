;;
;;
;;
;;


(use-modules (ice-9 rdelim))


(define (char-freq-from-file fname)
  (let ((ctab  (make-vector 256 0))
        (total 0))
    (call-with-input-file fname
      (lambda (in)
        (let loop ((line (read-line in)))
          (if (eof-object? line)
            (map (lambda (i) (cons (integer->char i) (/ (vector-ref ctab i) total)))
                 (iota 256))
            (begin
              (for-each (lambda (c) 
                          (set! total (1+ total))
                          (let ((i (char->integer c)))
                            (if (<= 32 i 127)
                              (vector-set! ctab i (1+ (vector-ref ctab i))))))
                        (string->list line))
              (loop (read-line in)))))))))


;; end of file
