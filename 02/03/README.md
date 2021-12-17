### Exercise 2.03

Implement a representation for rectangles in a plane. (Hint: You may want to
make use of Exercise 2.2.) In terms of your constructors and selectors, create
procedures that compute the perimeter and the area of a given rectangle. Now
implement a different representation for rectangles. Can you design your system
with suitable abstraction barriers, so that the same perimeter and area
procedures will work using either representation?

### Solution

```scheme
(define (make-rect bottom-left top-right)
  (cons bottom-left top-right))

; alternative implementation using origin, length and height

(define (make-rect o l h)
  (cons o (make-point (+ (x-point o) l)
                      (+ (y-point o) h))))

(define rect-bl car)
(define rect-tr cdr)
(define (rect-br rect)
  (make-point (x-point (rect-tr rect)) (y-point (rect-bl rect))))
(define (rect-tl rect)
  (make-point (x-point (rect-bl rect)) (y-point (rect-tr rect))))

(define (rect-length rect)
  (- (x-point (rect-br rect)) (x-point (rect-bl rect))))
(define (rect-height rect)
  (- (y-point (rect-tl rect)) (y-point (rect-bl rect))))

(define (rect-perim rect)
  (+ (* (rect-length rect) 2) (* (rect-height rect) 2)))
(define (rect-area rect)
  (* (rect-length rect) (rect-height rect)))
```

Possibility for refactor: redefine the system without caring about the exact
placement of the rectangle. Origin, width and height are enough to calculate
perimeter and area. However, this design keeps the structure of having four
points to select in case of some other implementation that requires it.
