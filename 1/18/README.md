### Exercise 1.18.
Using the results of exercises 1.16 and 1.17, devise a procedure that generates
an iterative process for multiplying two integers in terms of adding, doubling,
and halving and uses a logarithmic number of steps.

### Solution
```scheme
;; assuming double and halve are given
(define (* a b)
  (define (mult-iter count a b)
    (cond ((= b 0) count)
          ((even? b) mult-iter count (double a) (halve b))
          (else (mult-iter (+ count a) a (- b 1)))))
  mult-iter 0 a b)
(define (even? n)
  (= (remainder n 2) 0))

;; alternative version with Russian Peasant Algorithm
(define (* a b)
  (define (mult-iter count a b)
    (cond ((= b 0) count)
          ((even? b) mult-iter count (double a) (halve b))
          (else (mult-iter (+ count a) (double a) (- (halve b) 0.5)))))
  mult-iter 0 a b)
(define (even? n)
  (= (remainder n 2) 0))
