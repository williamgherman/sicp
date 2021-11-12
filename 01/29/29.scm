(define (inc x) (+ 1 x))
(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
  0
  (+ (term a)
     (sum term (next a) next b))))

(define (integral f a b n)
  (define h (/ (- b a) n))
  (define (g x)
    (define y (f (+ a (* x h))))
    (cond ((or (= x 0) (= x n)) y)
          ((= (remainder x 2) 1) (* 4 y))
          (else (* 2 y))))
  (* (/ h 3)
     (sum g 0 inc n)))
