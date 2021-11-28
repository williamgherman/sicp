(define (cont-frac n d k)
  (define (iter i result)
    (cond ((= i 0) result)
          (else (iter (- i 1) (/ (n i) (+ (d i) result))))))
  (iter k 0))


(define (euler k)
  (+ 2
     (cont-frac (lambda (x) 1)
                (lambda (x)
                  (if (not (= (remainder x 3) 2))
                      1
                      (* (+ (truncate (/ x 3)) 1) 2)))
                k)))
