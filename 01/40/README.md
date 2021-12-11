### Exercise 1.40

Define a procedure `cubic` that can be used togeher with the `newtons-method`
procedure in expressions of the form

```scheme
(newtons-method (cubic a b c) 1)
```

to approximate zeros of the cubic *x*<sup>3</sup> + *ax*<sup>2</sup> + *bx*
+ *c*.

### Solution

```scheme
(define (cubic a b c)
  (lambda (x) (+ (* x x x)
                 (* a x x)
                 (* b x)
                 c)))
```
