;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname functions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;manhattan distance
(define (manhattan-distance x1 y1 x2 y2)
  (+ (abs (- x1 x2)) (abs (- y1 y2))))

;;slugging average
(define (batter-slugging-average s d t hr ab)
  (/ (+ s (+ (* 2 d) (+ (* 3 t) (* 4 hr)))) ab))

;;surface area of a right circular cone
(define (cone-area r h)
  (* (* pi r) (+ r (sqrt (+ (sqr h) (sqr r))))))

;;escape speed
(define (escape M r)
  (sqrt (/ (* (* 2 6.674e-11) M) r)))

;;the partition function
(define (partition-size-approximation n )
  (* (/ 1 (* (* 4 n) (sqrt 3))) (expt e (* pi (sqrt (/ (* 2 n) 3))))))

;;Black-Scholes formula
(define (d1 maturity rate volatility spot-price strike-price)
  (* (/ 1 (* volatility (sqrt maturity))) (+  (log (/ spot-price strike-price)) (* (+ rate (/ (sqr volatility) 2)) maturity))))