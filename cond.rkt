;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname cond) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;Q3a

;;(check-expect (q3a-simplified 5 true) 6)
;;(check-expect (q3a-simplified -4 true) -5)
;;(check-expect (q3a-simplified 17 false) 0)
;;(check-expect (q3a-simplified 0 true) 1)

(define (q3a-simplified n a?)
  (cond [(and a? (>= n 0)) (+ n 1)]
        [(and a? (< n 0)) (- n 1)]
        [else 0]))

;;Q3b

;;(check-expect (q3b-simplified true true true) 'elm)
;;(check-expect (q3b-simplified true false true) 'cedar)
;;(check-expect (q3b-simplified false true false) 'pine)
;;(check-expect (q3b-simplified false false false) 'birch)

(define (q3b-simplified a? b? c?)
  (cond [(and (not b?) (not c?)) 'birch]
        [(and a? b?) 'elm]
        [(and a? (or (not b?) c?)) 'cedar]
        [(and (not a?) b?) 'pine]
        [else 'cherry]))

;;Q3c

;;(check-expect (q3c-simplified true true true) 'spruce)
;;(check-expect (q3c-simplified true false false) 'hazel)
;;(check-expect (q3c-simplified false false false) 'larch)
;;(check-expect (q3c-simplified false true false) 'spruce)
;;(check-expect (q3c-simplified false false true) 'hickory)

(define (q3c-simplified a? b? c?) (cond
                                    [(and b? c?) 'spruce]
                                    [(and (not a?) b?) 'spruce]
                                    [(and (not a?) (not b?) c?) 'hickory]
                                    [(and (not a?) (not b?) (not c?)) 'larch]
                                    [else 'hazel]))
