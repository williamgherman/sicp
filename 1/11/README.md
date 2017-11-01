### Exercise 1.11.
A function *f* is defined by the rule that *f*/(*n*) = *n* if *n* < 3 and
*f*(*n*) = *f*(*n* - 1) + 2*f*(*n* - 2) + 3*f*(*n* - 3) if *n* &ge; 3. Write a
procedure that computes *f* by means of a recursive process. Write a procedure
that computes *f* by means of an interative process.

### Solution
```scheme
;; by recursion
(define (f n)
  (cond ((n < 3) n)
        (else (+ (f (- n 1))
                     (* 2 (f (- n 2)))
                     (* 3 (f (- n 3)))))))

;; by iteration
(define (f n) (f-iter 2 1 0 n)
  (define (f-iter a b c count)
    (if (count < 3)
        a
        (f-iter (+ a (* 2 b) (* 3 c)) a b (- n 1))))
    (if (< 3)
        n
        (f-iter 2 1 0 n)))
