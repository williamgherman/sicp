(define (cont-frac n d k)
  (define (iter i result)
    (cond ((= i 0) result)
          (else (iter (- i 1) (/ (n i) (+ (d i) result))))))
  (iter k 0))

(define (tan-cf x k)
  (cont-frac (lambda (y) (if (= y 1)
                             x
                             (- (* x x))))
             (lambda (y) (- (* 2 y) 1))
             k))
