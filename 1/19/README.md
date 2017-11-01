### Exercise 1.19.
There is a clever algorithm for computing the Fibonacci numbers in a logarithmic
number of steps. Recall the transformation of the state variables a and b in the
`fib-iter` process of section 1.2.2: a ← a + b and b ← a. Call this
transformation T, and observe that applying T over and over again n times,
starting with 1 and 0, produces the pair Fib(n+1) and Fib(n). In other words,
the Fibonacci numbers are produced by applying T<sup>n</sup>, the nth power of
the transformation T, starting with the pair (1, 0). Now consider T to be the
special case of p = 0 and q = 1 in a family of transformations T<sub>pq</sub>,
where T<sub>pq</sub> transforms the pair (a, b) according to a ← bq + aq + ap
and b ← bp + aq. Show that if we apply such a transformation T<sub>pq</sub>
twice, the effect is the same as using a single transformation T<sub>p'q'</sub>
of the same form, and compute p' and q' in terms of p and q. This gives us an
explicit way to square these transformations, and thus we can compute
T<sup>n</sup> using sucessive squaring, as in the `fast-expt` procedure. Put
this all together to complete the following procedure, which runs in a
logarithmic number of steps:
```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
          (fib-iter a
                    b
                    <??>      ; compute p'
                    <??>      ; compute q'
                    (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (*a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
```
### Solution
Assume numbers a and b, which we will apply T<sub>pq</sub> once to return a' and
b', and a second time to produce a" and b":

    a' = aq + bq + ap
    b' = bp + aq

    a" = a'q + b'q + a'p
       = (aq + bq + ap)q + (bp + aq)q + (aq + bq + ap)p
       = aq² + bq² + apq + bpq + aq² + apq + bpq + ap²
       = a(p² + 2pq + 2q²) + b(2pq + q²)

    b" = b'p + a'q
       = bp² + apq + aq² + bq² + apq
       = a(2pq + q²) + b(p² + q²)

Then, q' and p' will be defined as applying q and p twice, as seen from the
result of b":
    p' = p² + q²
    q' = 2pq + q²

Therefore, the procedure can be completed:
```scheme
(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
          (fib-iter a
                    b
                    (+ (* p p) (* q q))   ; p' 
                    (+ (* 2 p q) (* q q)) ; q'
                    (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (*a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))
```
