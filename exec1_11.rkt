#lang racket
(require "test.rkt")

; Calculates f(n) = n if n<3 and f(n) = f(n - 1) + 2f(n - 2) + 3f(n - 3) if n> 3

; Recursive process.
; Notice how each call to fr will span 3 new calls to fr untill
; n is smaller than 3 and we can return concrete values.
(define (fr n)
  (if (< n 3)
    n
    (+ (* 1 (fr (- n 1)))
       (* 2 (fr (- n 2)))
       (* 3 (fr (- n 3))))))

(assert (fr -1) -1)
(assert (fr 2) 2)
(assert (fr 3) 4)

; Iterative process.
(define (f n)
  (if (< n 3)
    n
    (f-it 2 1 0 n))) ; 2 1 0 are the three first elements in our series

; Here we relly in the fact that f(n) depends on f(n-1), f(n-2) and f(n-3)
; We call a = f(n-1), b = f(n-2) and c = f(n-3), the next value will be
; a + 2b + 3c
(define (f-it a b c n)
  (if (< n 3)
    a
    (f-it (+ a (* 2 b) (* 3 c)) a b (- n 1))))

(assert (f -1) -1)
(assert (f 2) 2)
(assert (f 3) 4)
