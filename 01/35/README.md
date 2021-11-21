### Exercise 1.35

Show that the golden ratio &phi; (Section 1.2.2) is a fixed point of the
transformation *x* &mapstoright; 1 + 1/*x*. and use this fact to compute &phi;
by means of the `fixed-point` procedure.

### Solution


&phi; = (1 + &sqrt;5)/2 (from Section 1.2.2)

*x* = 1 + 1/*x*  
*x*<sup>2</sup> = *x* + 1  
*x*<sup>2</sup> - *x* - 1 = 0  
*x* = (1 &plusmn; &sqrt;5)/2 (Apply quadratic formula)

Discarding the additional zero, we get the solution *x* = &phi;.


```scheme
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
;Value: 1.6180327868852458
```
