;;
;; Cryptography course, week 2 programming assignment.

(define c0 '(
#xBB #x3A #x65 #xF6 #xF0 #x03 #x4F #xA9 #x57 #xF6 #xA7 #x67 #x69 #x9C #xE7 #xFA
#xBA #x85 #x5A #xFB #x4F #x2B #x52 #x0A #xEA #xD6 #x12 #x94 #x4A #x80 #x1E 
))

(define c1 '(
#xBA #x7F #x24 #xF2 #xA3 #x53 #x57 #xA0 #x5C #xB8 #xA1 #x67 #x62 #xC5 #xA6 #xAA
#xAC #x92 #x4A #xE6 #x44 #x7F #x06 #x08 #xA3 #xD1 #x13 #x88 #x56 #x9A #x1E 
))

(define c2 '(
#xA6 #x72 #x61 #xBB #xB3 #x06 #x51 #xBA #x5C #xF6 #xBA #x29 #x7E #xD0 #xE7 #xB4
#xE9 #x89 #x4A #xA9 #x5E #x30 #x02 #x47 #xF0 #xC0 #x02 #x8F #x40 #x9A #x1E 
))

(define c3 '(
#xA5 #x72 #x61 #xF5 #xF0 #x00 #x4B #xA7 #x4C #xF4 #xAA #x29 #x79 #xD9 #xA6 #xB7
#xAC #x85 #x4D #xA9 #x5E #x30 #x52 #x03 #xEC #x85 #x15 #x95 #x4C #x9D #x0F 
))

(define c4 '(
#xBB #x3A #x70 #xF3 #xB9 #x1D #x48 #xE8 #x4D #xF0 #xAB #x70 #x2E #xCF #xEE #xB5
#xBC #x8C #x5D #xA9 #x4C #x30 #x1E #x0B #xEC #xD2 #x41 #x95 #x4C #x83 #x1E 
))

(define c5 '(
#xA6 #x72 #x6D #xE8 #xF0 #x1A #x50 #xE8 #x49 #xED #xBC #x6C #x7C #x9C #xF2 #xB2
#xA8 #x8E #x19 #xFD #x42 #x3E #x06 #x47 #xEC #xCB #x04 #xDD #x4C #x9D #x1E 
))

(define c6 '(
#xBC #x75 #x70 #xBB #xBF #x1D #x46 #xE8 #x5A #xF9 #xAA #x6C #x7A #x9C #xEF #xA9
#xE9 #x82 #x5C #xFD #x5E #x3A #x00 #x47 #xF7 #xCD #x00 #x93 #x05 #xA7 #x1E 
))

(define c-pairs (list
(list c0 c1)
(list c0 c2)
(list c0 c3)
(list c0 c4)
(list c0 c5)
(list c0 c6)
(list c1 c2)
(list c1 c3)
(list c1 c4)
(list c1 c5)
(list c1 c6)
(list c2 c3)
(list c2 c4)
(list c2 c5)
(list c2 c6)
(list c3 c4)
(list c3 c5)
(list c3 c6)
(list c4 c5)
(list c4 c6)
(list c5 c6)
))


(define non-letter (map char->integer (string->list " ,:-;")))


(define zzz (map (lambda (i) (map logxor (car i) (cadr i))) c-pairs ))
(define www (apply zip zzz))


(define (print-www)
  (format #t "    01 02 03 04 05 06 12 13 14 15 16 23 24 25 26 34 35 36 45 46 56\n")
  (let loop ((n 0) (w www)) 
    (if (not (null? w)) 
      (begin 
        (format #t "~2d " n)
        (for-each (lambda (x) (format #t " ~2,'0b" (ash x -6))) (car w))
        (format #t "\n") 
        (loop (1+ n) (cdr w))))))


(define (ende k c)
  (if (char? c) (ende k (char->integer c))
    (logxor k c)))

(define (decode k c) (map integer->char (map ende k c)))


;; A to Z
(define (upper? c) (<= 65 c 90))

;; some ascii character
(define (ascii? c) (<= 32 c 126))

;; a to z
(define (lower? c) (<= 97 c 122))

;; space or comma
(define (sep? c) (or (= c 32) (= c 44)))

(define (punct? c) (or (<= 32 c 47) (<= 58 63)))

(define *lines* (list c0 c1 c2 c3 c4 c5 c6))

;; this key is result of manual text recovering with the help of (try) and (undo)
;; functions.
(define *key* '(242 26 4 155 208 115 35 200 57 152 206 9 14 188 134 218 201 224 57 137 42 95 114 103 131 165 97 253 37 238 48))


;; print current part of decoded messages.
(define (curr . key)
  (if (null? key) (curr *key*)
    (for-each 
      (lambda (line)
        (format #t "~d  " (car line))
        (for-each (curry format #t "~a") (decode (car key) (cadr line)))
        (format #t "\n"))
      (zip (iota (length *lines*)) *lines*))))

;; try to decode one more character (column) for all encripted messages.
(define (try line ch)
  (let* ((l (list-ref *lines* line))
         (c (list-ref l (length *key*)))
         (k (ende c ch)))
    (set! *key* (append *key* (list k)))
    (curr)))

;; remove last key element.
(define (undo) 
  (set! *key* (take *key* (1- (length *key*))))
  (curr))


;; end of file
