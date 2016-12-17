#lang racket
(require "test.rkt")

; Calculates elements of the Pascal's triangle at a given row and column
; The Pascal's triangle is given in the form:
; 1.     1
; 2.    1 1
; 3.   1 2 1
; 4.  1 3 3 1
; 5. 1 4 6 4 1
; All the elements at its edge are 1 and the other elements are the sum
; of the elements directly above it.
(define (pasc row col)
  (cond ((or (= row col) (= col 1) (<= row 0) (<= col 0)) 1)
        (else (+
                (pasc (- row 1) (- col 1))
                (pasc (- row 1) col)
              ))))

(assert (pasc 4 4) 1)
(assert (pasc 4 1) 1)
(assert (pasc 3 2) 2)
(assert (pasc 5 2) 4)
(assert (pasc 5 3) 6)

; TODO: create a procedure to print the triangle 
