#lang racket

(require "colors.rkt")

(define (assert a b)
  (if (= a b)
    (begin (foreground 'green)
           (displayln "PASS")
           (reset))
    (begin (foreground 'red)
           (displayln "FAIL")
           (reset))))

(provide assert)
