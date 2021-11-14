### Exercise 1.33

You can obtain an ever more general version of `accumulate` (Exercise 1.32) by
introducting the notion of a *filter* on the terms to be combined. That is,
combine only those terms derived from values in the range that satisfy a
specified condition. The resulting `filtered-accumulate` abstraction takes the
same arguments as accumulate, together with an additional predicate of one
argument that specifies the filter. Write `filtered-accumulate` as a procedure.
Show how to express the following using `filtered-accumulate`:

 * a) the sum of the squares of the prime numbers in the interval *a* to *b*
   (assuming that you have a `prime?` predicate already written)
 * b) the product of all the positive integers less than *n* that are relatively
   prime to *n* (i.e., all positive integers *i* < *n* such that GCD(*i*, *n*) =
   1).

### Solution

```scheme
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a)
                    (filtered-accumulate combiner
                                         null-value
                                         term
                                         (next a)
                                         next
                                         b
                                         filter))
          (filtered-accumulate combiner
                               null-value
                               term
                               (next a)
                               next
                               b
                               filter))))

; a)
(define (sum-sq a b) (filtered-accumulate + 0 square a increment b prime?))

; b)
(define (relative-prime? m n)
  (= (gcd m n) 1))
(define (prod-rel-primes n)
  (define (filter x)
    (relative-prime? x n))
  (filtered-accumulate *
                       1
                       identity
                       2
                       increment
                       n
                       filter))
```
