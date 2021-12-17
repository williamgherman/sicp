### Exercise 2.06

In case representing pairs as procedures wasn't mind-boggling enough, consider
that, in a language that can manipulate procedures, we can get by without
numbers (at least insofar as nonnegative integers are concerned) by implementing
0 and the operation of adding 1 as

```scheme
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))
```

This representation is known as *Church numerals*, after its inventor, Alonzo
Church, the logician who invented the &lambda;-calculus.

Define `one` and `two` directly (not in terms of `zero` and `add-1`). (Hint: Use
substitution to evaluate `(add-1 zero))`. Give a direct definition of the
addition procedure `+` (not in terms of repeated application of `add-1`).

### Solution

```scheme
; calculate one
(add-1 zero)
(lambda (f) (lambda (x) (f ((lambda (g) (lambda (y) y)) f) x)))
(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))
(define two (lambda (f) (lambda (x) (f (f x)))))

(define (add a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))
```

Since each successive number from zero (which returns the identity function) is
just an additional function application, the sum of two numbers can be done by
composing both numbers' function applications together. That is, 2 being `(f (f
x))` added to 1 `(f x)` is 3 `(f (f (f x)))`.
