### Exercise 1.38

In 1737, the Swiss mathematician Leonhard Euler published a memoir *De
Fractionibus Continuis*, which included a continued fraction expansion for *e*
-- 2, where *e* is the base of the natural logarithms. In this fraction, the
*N*<sub>*i*</sub> are all 1, and the *D*<sub>*i*</sub> are successively 1, 2, 1,
1, 4, 1, 1, 6, 1, 1, 8, ... . Write a program that uses your `cont-frac`
procedure from Exericse 1.37 to approximate *e*, based on Euler's expansion.

### Solution

```scheme
(define (cont-frac n d k)
  (define (iter i result)
    (cond ((= i 0) result)
          (else (iter (- i 1) (/ (n i) (+ (d i) result))))))
  (iter k 0))


(define (euler k)
  (+ 2
     (cont-frac (lambda (x) 1)
                (lambda (x)
                  (if (not (= (remainder x 3) 2))
                      1
                      (* (+ (truncate (/ x 3)) 1) 2)))
                k)))
```
