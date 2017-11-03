;; SICP Exercise 1.22.
;; 
;; Author: William Gherman
;; Date:   2017-11-03.
;;
;; The search-for-primes procedure checks the primality of consecutive odd
;; integers in a specified integer range. The total testing algorithm should
;; have an order of growth of O(sqrt(n)).

(define (square x) (* x x))

(define (smallest-divisor n)
  (find-divisor n 2))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))
(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
    (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-iter n b)
  (if (<= n b) (timed-prime-test n))
  (if (<= n b) (search-iter (+ n 2) n)))

(define (search-for-primes a b)
  (search-iter (if (even? a) (+ a 1) a)
               (if (even? b) (- b 1) b)))

(search-for-primes 1000 1019)
(search-for-primes 10000 10037)
(search-for-primes 100000 100043)
(search-for-primes 1000000 1000037)


;; test from 1 billion to 1 trillion for modern machines
(newline)
(search-for-primes 1000000000 1000000021)
(search-for-primes 10000000000 10000000061)
(search-for-primes 100000000000 100000000057)
(search-for-primes 1000000000000 1000000000063)
