(define (square x) (* x x))

(define (expmod base ex m)
  (cond ((= ex 0) 1)
        ((even? ex)
         (remainder (square (expmod base (/ ex 2) m))
                    m))
        (else
          (remainder (* base (expmod base (- ex 1) m))
                     m))))

(define (fermat-prime? n)
  (define (iter a n)
    (if (= a n) true
        (if (= (expmod a n n) a) (iter (+ a 1) n) false)))
  (iter 1 n))

(define (test-fermat n expected)
  (define (report-result n result expected)
    (newline)
    (display n)
    (display ": ")
    (display result)
    (display ": ")
    (display (if (eq? result expected) "OK" "FOOLED")))
  (report-result n (fermat-prime? n) expected))

(test-fermat 2 true)
(test-fermat 17 true)
(test-fermat 22 false)

;; Carmichael numbers
(test-fermat 561 false)
(test-fermat 1105 false)
(test-fermat 1729 false)
(test-fermat 2465 false)
(test-fermat 2821 false)
(test-fermat 6601 false)
