### Exercise 2.04

Here is an alternative procedural representation of pairs. For this
representation, verify that `(car (cons x y))` yeilds `x` for any objects `x`
and `y`.

```scheme
(define (cons x y)
  (lambda (m) (m x y)))
(define (car z)
  (z (lambda (p q) p)))
```

What is the corresponding definition of `cdr`? (Hint: To verify that this works,
make use of the substitution model of Section 1.1.5.)

### Solution

```scheme
; checking car and cons
(car (cons x y))
(car (lambda (m) (m x y)))
((lambda (m) (m x y)) (lambda (p q) p))
((lambda (p q) p) x y)
x

; define cdr
(define (cdr p)
  (p (lambda (a b) b)))
```
