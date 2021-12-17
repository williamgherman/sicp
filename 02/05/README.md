### Exercise 2.05

Show that we can represent pairs of nonnegative integers using only numbers and
arithmetic operations if we represent the pair a and b as the integer that is
the product 2<sup>a</sup>3<sup>b</sup>. Give the corresponding definitions of
the procedures `cons`, `car` and `cdr`.

### Solution

Because the product 2<sup>a</sup>3<sup>b</sup> can be factored only as itself,
it should work for any nonnegative integers including zero.

```scheme
(define (cons a b)
  (* (pow 2 a) (pow 3 b)))
(define (pair-iter p n count)
  (if (not (= (remainder p n) 0))
      count
      (pair-iter (/ p n) (+ count 1))))
(define (car p)
  (pair-iter p 2 0))
(define (cdr p)
  (pair-iter p 3 0))
```
