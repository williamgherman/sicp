(define (square x) (* x x))

(define (mr-expmod base ex m)
  (define (squaremod-with-check x)
    (define (check-sqrt1 x square)
      (if (and (= square 1)
               (not (= x 1))
               (not (= x (- m 1))))
          0
          square))
    (check-sqrt1 x (remainder (square x) m)))
  (cond ((= ex 0) 1)
        ((even? ex) (squaremod-with-check
                      (mr-expmod base (/ ex 2) m)))
        (else
          (remainder (* base (mr-expmod base (- ex 1) m))
                     m))))

(define (mr-test n)
  (define (try-it a)
    (define (check-it x)
      (and (not (= x 0)) (= x 1)))
    (check-it (mr-expmod a (- n 1) n)))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((mr-test n) (fast-prime? n (- times 1)))
        (else false)))

;; 1000 is arbitrary magic number of tests
(define (prime? n)
  (fast-prime? n 1000))

(define (report-prime n expected)
  (define (report-result n result expected)
    (newline)
    (display n)
    (display ": ")
    (display result)
    (display ": ")
    (display (if (eq? result expected) "OK" "FOOLED")))
  (report-result n (prime? n) expected))

(report-prime 2 true)
(report-prime 7 true)
(report-prime 13 true)
(report-prime 15 false)
(report-prime 37 true)
(report-prime 39 false)

;; Carmichael numbers:
(report-prime 561 false)
(report-prime 1105 false)
(report-prime 1729 false)
(report-prime 2465 false)
(report-prime 2821 false)
(report-prime 6601 false)
