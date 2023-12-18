;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname median) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;(check-expect (median-of-3 2 6 8) 6)
;;(check-expect (median-of-3 7 -4 9000) 7)
;;(check-expect (median-of-3 -17 446 445) 445)
;;(check-expect (median-of-3 1 2 3) 2)
;;(check-expect (median-of-3 2 1 3) 2)

;;(define (median-of-3 a b c)
;;  (cond
;;   [(or (and (<= b a) (<= a c)) (and (<= c a) (<= a b))) a]
;;   [(or (and (<= a b) (<= b c)) (and (<= c b) (<= b a))) b]
;;    [else c]))


(define (median-of-3-simple a b c)
  (cond
    [(<= b a) (cond [(<= a c) a]
                    [else b])]
    [(<= a b) (cond [(<= c a) a]
                    [(>= b c) c]
                    [else b])]
    [else c]))
                    
