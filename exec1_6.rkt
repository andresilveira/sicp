#lang racket

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)
  )
)

; this two expressions return the same value, 0
; but new-if has a catch shown bellow
(print
  (if (> 2 2) 1 0))
(print (new-if (> 2 2) 1 0))

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
  (print "sqrt-iter ")
  (print guess)
  (print " ")
  (print x)
  (println "")
  ; here, if we use new-if, we would run into a infinite loop. Because the
  ; interpreter use applicative order, i.e. it evaluates the operators and
  ; operands in order the order they appear, the interpreter would try to
  ; evaluate both operands of new-if (guess and (sqrt-iter...)) indefintely
  ; The same doesn't happen with the normal if function because of it's special
  ; construction. If's second operand is only evaulated if the predicate
  ; returns false.
  (if (good-enough? guess x)
    guess
    (sqrt-iter (improve guess x) x)
  )
)

(define (sqrt x)
  (sqrt-iter 1.0 x)
)

(sqrt 0.00000000005)
