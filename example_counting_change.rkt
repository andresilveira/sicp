; Counts how many different ways we can give change for amount cents given we have
; 50, 25, 10, 5 and 1 cent coins
(define (count-change amount)
  (cc amount 5))

; This function lies in the fact that the number of ways to change amount a using
; n kinds of coins is equal to:
;   * the number of ways to change amount a using all but the first coin, plus
;   * the number of ways to change amount a - v using all n kinds of coins where
;     v is the value of the first coin
; This will degenerate into three cases:
;   * amount a is equal to 0, in this case there's only 1 way to give change
;   * amount a is smaller than 0, then we should count it as 0 ways to give change
;   * kinds of coins n is 0, we should also count it as 0 ways to give change
(define (cc amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else (+ (cc amount (- kinds-of-coins 1))
                 (cc (- amount (first-value kinds-of-coins)) kinds-of-coins)))))

; Returns the value of the first coin type depending on how many they are
; While they are arranged in order, the order doesn't really matter.
(define (first-value kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))

(print (count-change 100))
