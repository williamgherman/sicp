### Exercise 1.29

Simpson's Rule is a more accurate method of numerical integration than the
method illustrated above. Using Simpson's Rule, the integral of a function *f*
between *a* and *b* is approximated as:

(*h*/3)(*y*<sub>0</sub> + 4*y*<sub>1</sub> + 2*y*<sub>2</sub> + 4*y*<sub>3</sub> +
2*y*<sub>4</sub> + ... + 2*y*<sub>*n*-2</sub> + 4*y*<sub>*n*-1</sub> +
*y*<sub>*n*</sub>

where *h* = (*b* - *a*)/*n*, for some even integer *n*, and *y*<sub>*k*</sub> =
*f*(*a* + *kh*). (Increasing *n* increases the accuracy of the approximation.)
Define a procedure that takes as arguments *f*, *a*, *b* and *n* and returns the
value of the integral, computed using Simpson's Rule. Use your procedure to
integrate `cube` between 0 and 1 (with *n* = 100 and *n* = 1000), and compare
the results to those of the `integral` prodedure shown above.

### Solution

See `29.scm`. On my machine, the interpreter produces an exact answer of `1/4`.
Out of curiousity, I tested the original `integral` program and reproduced the
answers found in the book:

```scheme
(integral cube 0 1 0.01)
; Value: 0.24998750000000042

(integral cube 0 1 0.001)

; Value: 0.249999875000001
```
