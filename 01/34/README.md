### Exercise 1.34

Suppose we define the procedure

```scheme
(define (f g) (g 2))
```

Then we have

```scheme
(f square)
; 4
(f (lambda (z) (* z (+ z 1))))
; 6
```

What happens if we (perversely) ask the interpreter to evaluate the combination
`(f f)`? Explain.

### Solution

After the following expansion, the interpreter will be unable to apply 2 to 2:

```scheme
(f f)
(f 2)
(2 2)
; Error
```
