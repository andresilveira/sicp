#lang racket

(require "colors.rkt")

(define (assert a b)
  (if (= a b)
    (begin (foreground 'green)
           (displayln "PASS"))
    (begin (foreground 'red)
           (displayln "FAIL"))))

(provide assert)
