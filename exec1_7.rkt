#lang racket

(define (square x)
  (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

; Instead of checking if guess squared is close enough from x
; we check how big was the change between the previous and
; current guesses. If it was small (0.001) it means we're close
(define (changed-enough? previous current)
  (< (abs (- previous current)) 0.001))

(define (sqrt-iter previous current x)
  (print "sqrt-iter ")
  (print current)
  (print " ")
  (print x)
  (println "")
  (if (changed-enough? previous current)
    current
    (sqrt-iter current (improve current x) x)
  ))

(define (sqrt x)
  (sqrt-iter 0.0 1.0 x))

(sqrt 0.00000000005)
