;;


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


(define (vigenere-proc key msg)
  (let loop ((key (apply circular-list (map char->integer (string->list key))))
             (msg msg)
             (res '()))
    (if (null? msg) (reverse res)
      (loop (cdr key) (cdr msg)
            (cons (logxor (car msg) (car key)) res)))))


(define (vigenere-encrypt key msg)
  (vigenere-proc key (map char->integer (string->list msg))))


(define (vigenere-decrypt key msg)
  (list->string (map integer->char (vigenere-proc key msg))))


(define (slice msg key-len idx)
  (let loop ((i 0)
             (t idx)
             (msg msg)
             (res '()))
    (cond ((null? msg) (reverse res))
          ((= i t) (loop (1+ i) (+ t key-len) (cdr msg) (cons (car msg) res)))
          (else    (loop (1+ i) t (cdr msg) res)))))



;; end of file
