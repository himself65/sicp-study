#lang racket
(provide thirt)

(define map (list 1 10 9 12 3 4))

(define (pos-number x) (- x (* 10 (floor (/ x 10)))))



(define (thirt x)
  (thirt-iter x 0))

(define (thirt-iter x prev-x)
  (if (equal? x prev-x)
      x
      (thirt-iter (next-number x) x)))

(define (next-number x) (next-number-iter x 0))

(define (next-number-iter x pos)
  (if (equal? x 0)
      0
      (+ (* (list-ref map (modulo pos (length map))) (pos-number x))
         (next-number-iter (floor (/ x 10)) (+ pos 1)))))

;(equal? (thirt 1234567) 87)
;(equal? (pos-number 114514) 4)
;(equal? (next-number 87) 87)
;(equal? (next-number 1234567) 178)