### Exercise 1.39

A continued fraction representation of the tangent function was published in
1770 by the German mathematician J. H. Lambert:

```
                x
tan x = _______________
        1 -     x^2
            ___________
            3 -   x^2
                _______
                5 - ...
```

where *x* is in radians. Define a procedure `(tan-cf x k)` that computes an
approximation to the tangent function based on Lambert's formula. `k` specifies
the number of terms to compute, as in Exercise 1.37.

### Solution

```scheme
(define (cont-frac n d k)
  (define (iter i result)
    (cond ((= i 0) result)
          (else (iter (- i 1) (/ (n i) (+ (d i) result))))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (y) (if (= y 1)
                             x
                             (- (* x x))))
             (lambda (y) (- (* 2 y) 1))
             k))
```
