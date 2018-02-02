### Exercise 1.25.

Alyssa P. Hacker complains that we went to a lot of extra work in writing
`expmod`. After all, she says, since we already know how to compute
exponentials, we could have simply written

```scheme
(define (expmod base exp m)
  (remainder (fast-expt base exp) m))
```

Is she correct? Would this procedure serve as well for our fast prime tester?
Explain.

### Solution

Although the number of steps would be around the same (&Theta;(`log` *n*)),
Alyssa's `expmod` would compute huge values in `fast-expt`, which would not
generally be as fast as the previous `expmod` procedure.
