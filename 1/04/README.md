### Exercise 1.4. 
Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:

### Solution
```scheme
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
```

The `if` expression will return either the `+` or `-` operation to be applied to `a` and `b` thereby adding the absolute value of `b` to `a`.
