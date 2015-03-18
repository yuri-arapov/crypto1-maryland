;;

;; English characters frequencies determined from the books of Gutenberg project.
(load "char-freq-tab.scm")

(define (cfreq c) (vector-ref *char-freq-tab* c))


(define *encrypted-message* '(
#xf9 #x6D #xE8 #xC2 #x27 #xA2 #x59 #xC8 #x7E #xE1 #xDA #x2A #xED #x57 #xC9 #x3F
#xE5 #xDA #x36 #xED #x4E #xC8 #x7E #xF2 #xC6 #x3A #xAE #x5B #x9A #x7E #xFF #xD6
#x73 #xBE #x4A #xCF #x7B #xE8 #x92 #x3C #xAB #x1E #xCE #x7A #xF2 #xDA #x3D #xA4
#x4F #xCF #x7A #xE2 #x92 #x35 #xA2 #x4C #x96 #x3F #xF0 #xDF #x3C #xA3 #x59 #x9A
#x70 #xE5 #xDA #x36 #xBF #x1E #xCE #x77 #xF8 #xDC #x34 #xBE #x12 #x9A #x6C #xF4
#xD1 #x26 #xBF #x5B #x9A #x7C #xFE #xDF #x3E #xB8 #x50 #xD3 #x7C #xF0 #xC6 #x3A
#xA2 #x50 #x9A #x76 #xFF #x92 #x27 #xA5 #x5B #x9A #x6F #xE3 #xD7 #x20 #xA8 #x50
#xD9 #x7A #xB1 #xDD #x35 #xED #x5F #xCE #x6B #xF0 #xD1 #x38 #xA8 #x4C #xC9 #x31
#xB1 #xF1 #x21 #xB4 #x4E #xCE #x70 #xF6 #xC0 #x32 #xBD #x56 #xC3 #x3F #xF9 #xD3
#x20 #xED #x5C #xDF #x7A #xFF #x92 #x26 #xBE #x5B #xDE #x3F #xF7 #xDD #x21 #xED
#x56 #xCF #x71 #xF5 #xC0 #x36 #xA9 #x4D #x96 #x3F #xF8 #xD4 #x73 #xA3 #x51 #xCE
#x3F #xE5 #xDA #x3C #xB8 #x4D #xDB #x71 #xF5 #xC1 #x7F #xED #x51 #xDC #x3F #xE8
#xD7 #x32 #xBF #x4D #x96 #x3F #xF3 #xC7 #x27 #xED #x4A #xC8 #x7E #xF5 #xDB #x27
#xA4 #x51 #xD4 #x7E #xFD #x92 #x30 #xBF #x47 #xCA #x6B #xFE #xC1 #x2A #xBE #x4A
#xDF #x72 #xE2 #x92 #x24 #xA8 #x4C #xDF #x3F #xF5 #xD7 #x20 #xA4 #x59 #xD4 #x7A
#xF5 #x92 #x32 #xA3 #x5A #x9A #x7A #xE7 #xD3 #x3F #xB8 #x5F #xCE #x7A #xF5 #x92
#x3A #xA3 #x1E #xDB #x3F #xF7 #xD3 #x3A #xBF #x52 #xC3 #x3F #xF0 #xD6 #x73 #xA5
#x51 #xD9 #x3F #xFC #xD3 #x3D #xA3 #x5B #xC8 #x31 #xB1 #xF4 #x3C #xBF #x1E #xDF
#x67 #xF0 #xDF #x23 #xA1 #x5B #x96 #x3F #xE5 #xDA #x36 #xED #x68 #xD3 #x78 #xF4
#xDC #x36 #xBF #x5B #x9A #x7A #xFF #xD1 #x21 #xB4 #x4E #xCE #x76 #xFE #xDC #x73
#xBE #x5D #xD2 #x7A #xFC #xD7 #x73 #xBA #x5F #xC9 #x3F #xE5 #xDA #x3C #xB8 #x59
#xD2 #x6B #xB1 #xC6 #x3C #xED #x5C #xDF #x3F #xE2 #xD7 #x30 #xB8 #x4C #xDF #x3F
#xF7 #xDD #x21 #xED #x5A #xDF #x7C #xF0 #xD6 #x36 #xBE #x1E #xDB #x79 #xE5 #xD7
#x21 #xED #x57 #xCE #x3F #xE6 #xD3 #x20 #xED #x57 #xD4 #x69 #xF4 #xDC #x27 #xA8
#x5A #x96 #x3F #xF3 #xC7 #x27 #xED #x49 #xDF #x3F #xFF #xDD #x24 #xED #x55 #xD4
#x70 #xE6 #x9E #x73 #xAC #x50 #xDE #x3F #xE5 #xDA #x3A #xBE #x1E #xDF #x67 #xF4
#xC0 #x30 #xA4 #x4D #xDF #x3F #xF5 #xD7 #x3E #xA2 #x50 #xC9 #x6B #xE3 #xD3 #x27
#xA8 #x4D #x96 #x3F #xE5 #xDA #x32 #xB9 #x1E #xD3 #x6B #xB1 #xD1 #x32 #xA3 #x1E
#xD8 #x7A #xB1 #xD0 #x21 #xA2 #x55 #xDF #x71 #xB1 #xC4 #x36 #xBF #x47 #x9A #x7A
#xF0 #xC1 #x3A #xA1 #x47 #x94 ))



(define *plain-text-chars* (make-vector 256 #f))

(for-each (lambda (c) (vector-set! *plain-text-chars* (char->integer c) #t))
          (string->list "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz .,:!;-"))


;; return true if given character belongs to plain text domain.
(define (plain-text-char? c) (vector-ref *plain-text-chars* c))


;; read text from the file, return list of characters.
(define (file->plain-text fname)
  (call-with-input-file 
    fname
    (lambda (in)
      (let loop ((c (read-char in))
                 (res '()))
        (if (eof-object? c) (reverse res)
          (loop (read-char in) (cons c res)))))))


;; Vigenere's encryption/decription function.
(define (vigenere-proc key msg)
  (let loop ((key (apply circular-list 
                         (if (list? key) key
                           (map char->integer (string->list key)))))
             (msg msg)
             (res '()))
    (if (null? msg) (reverse res)
      (loop (cdr key) (cdr msg)
            (cons (logxor (car msg) (car key)) res)))))


;; Vigenere's encryption function.
(define (vigenere-encrypt key msg)
  (vigenere-proc 
    key 
    (map char->integer 
         (if (list? msg) msg
           (string->list msg)))))


;; Vigenere's dencryption function.
(define (vigenere-decrypt key msg)
  (list->string (map integer->char (vigenere-proc key msg))))


;; return list of every key-len-s characters of the message starting
;; from given index.
(define (slice msg key-len idx)
  (let loop ((i 0)
             (t idx)
             (msg msg)
             (res '()))
    (cond ((null? msg) (reverse res))
          ((= i t) (loop (1+ i) (+ t key-len) (cdr msg) (cons (car msg) res)))
          (else    (loop (1+ i) t (cdr msg) res)))))


(define (sqr n) (* n n))


;; iterate over [from to] range of numbers.
(define (iterate proc from to init)
  (let loop ((from from)
             (res  init))
    (if (> from to) res
      (loop (1+ from) (proc from res)))))


;; compute characters' frequencies of given slice.
(define (compute-slice-freq slice)
  (let ((ftab (make-vector 256 0))
        (len  (length slice)))
    (for-each (lambda (c) 
                (if (< c 256)
                  (vector-set! ftab c (1+ (vector-ref ftab c))))) slice)
    (fold
      (lambda (f res) (+ res (sqr (/ f len))))
      0
      (vector->list ftab))))


;; compute frequencies of characters for given key length.
(define (compute-key-freq msg key-len)
  (iterate
    (lambda (pos res) (+ res (compute-slice-freq (slice msg key-len pos))))
    0 (1- key-len)
    0))


;; find best item in the list. the 'better?' is a (proc new old) function
;; returning true if 'new' is better than 'old'.
(define (bestof s better?)
  (if (null? s) #f
    (fold (lambda (x res) (if (better? x res) x res))  (car s) (cdr s))))


;; determine length of the key.
(define (determine-key-len msg max-key-len)
  (car 
    (bestof
      (map (lambda (k-len) (cons k-len (compute-key-freq msg k-len))) 
           (iota max-key-len 1))
      (lambda (a b) (> (cdr a) (cdr b))))))


;; guess value of the key in given pos.
(define (guess-key-pos msg key-len pos)

  (let* ((s    (slice msg key-len pos))
         (slen (length s)))

    (define (candidat-freq candidat)
      (let ((ds (map (lambda (e) (logxor e candidat)) s)))
        (if (not (every plain-text-char? ds)) 0
          (let ((x (make-vector 256 0)))
            (for-each (lambda (c) (vector-set! x c (1+ (vector-ref x c)))) ds)
            (fold
              (lambda (c res) (+ res (* (sqr (/ (vector-ref x c) slen)) (sqr (cfreq c)))))
              0
              ds)))))

    (car
      (bestof
        (map (lambda (candidat) (cons candidat (candidat-freq candidat))) (iota 256))
        (lambda (x y) (> (cdr x) (cdr y)))))))


;; do the magic and summon the key.
(define (determine-key msg key-len)
  (map (curry guess-key-pos msg key-len) (iota key-len)))


;; all the fun in single call.
(define (pa1)
  (vigenere-decrypt
    (determine-key *encrypted-message* (determine-key-len *encrypted-message* 13))
    *encrypted-message*))


;; end of file
