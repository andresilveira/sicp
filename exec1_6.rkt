#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)
  )
)

(if (= 2 2) 1 0)
(new-if (= 2 2) 1 0)

(if (> 2 2) 1 0)
(new-if (> 2 2) 1 0)

(define (square x)
  (* x x)
)

(define (average x y)
  (/ (+ x y) 2)
)

(define (improve guess x)
  (average guess (/ x guess))
)

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001)
)

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)
  )
)

(define (sqrt x)
  (sqrt-iter 1.0 x)
)

(sqrt 25)
