### Exercise 1.41

Define a procedure `double` that takes a procedure of one argument as argument
and returns a procedure that applies the original procedure twice. For example,
if `inc` is a procedure that adds 1 to its argument, then `(double inc)` should
be a procedure that adds 2. What value is returned by

```scheme
(((double (double double)) inc) 5)
```

### Solution


```scheme
(define (double f)
  (lambda (x) (f (f x))))

; reducing the above problem:
(((double (double double)) inc) 5)
(((double (double (double x))) inc) 5)
(((double (double (double (double x)))) inc) 5)
(((double (double (double (double inc))))) 5)
(((double (double (double (inc (inc x)))))) 5)
(((double (double (inc (inc (inc (inc x))))))) 5)
(((double (inc (inc (inc (inc (inc (inc (inc (inc x)))))))))) 5)
(((inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc (inc
 (inc 5))))))))))))))))))
; 16 inc's -> +16
; 5 + 16
; 21
```


