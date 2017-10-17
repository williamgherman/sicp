### Exercise 1.3.
Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.

```scheme
(define (sum-of-squares-of-two-largest x y z)
  (cond ((and (>= x z) (>= y z)) (+ (* x x) (* y y)))
        ((and (>= x y) (>= z y)) (+ (* x x) (* z z)))
        ((and (>= y x) (>= z x)) (+ (* y y) (* z z)))))

```            
