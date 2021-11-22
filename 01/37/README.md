### Exercise 1.37

 * a) An infinite *continued fraction* is an expression of the form:

 
 ```
 f =         N1
     __________________
     D1 +       N2
          _____________
          D2 +    N3
               ________
               D3 + ...
```

As an example, one can show that the infinite continued fraction expansion with
the *N*<sub>*i*</sub> and the *D*<sub>*i*</sub> all equal 1 produces 1/&phi;,
where &phi; is the golden ratio (described in Section 1.2.2). One way to
approximate an infinite continued fraction is to truncate the expansion after a
given number of terms. Such a truncation---a so-called *k-term finite continued
fraction*---has the form

```
      N1
_____________
D1 +     N2
     ________
     ... + Nk
           __
           Dk
```

Suppose that `n` and `d` are procedures of one argument (the term index *i*)
that return the *N*<sub>*i*</sub> and *D*<sub>*i*</sub> of the terms of the
continued fraction. Define a procedure `cont-frac` such that evaluating
`(cont-frac n d k)` computes the value of the *k*-term finite continued
fraction. Check your procedure by approximating 1/&phi; using

```scheme
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           k)
```

for successive values of `k`. How large must you make `k` in order to get an
approximation that is accurate to 4 decimal places?

 * b) If your `cont-frac` procedure generates a recursive process, write one
   that generates an iterative process. If it generates an iterative process,
   write one that generates a recursive process.

### Solution

```scheme
; a) recursive

(define (cont-frac n d k)
  (define (next i)
    (cond ((> i k) 0)
          else (/ (n i) (+ (d i) (next (+ i 1))))))
  (next 1))

; b) iterative

(define (cont-frac n d k)
  (define (iter i result)
    (cond ((= i 0) result)
          else (iter (- i 1) (/ (n i) (+ (d i) result)))))
  (iter k 0))
```
