;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname blood) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;(check-expect (can-donate-to/cond? 'O- 'O-) true)
;;(check-expect (can-donate-to/cond? 'A+ 'AB+) true)
;;(check-expect (can-donate-to/cond? 'O- 'B-) true)
;;(check-expect (can-donate-to/cond? 'A- 'A+) true)
;;(check-expect (can-donate-to/cond? 'O+ 'A+) true)
;;(check-expect (can-donate-to/cond? 'O+ 'B+) true)
;;(check-expect (can-donate-to/cond? 'AB+ 'O+) false)
;;(check-expect (can-donate-to/cond? 'A+ 'B-) false)

(define (can-donate-to/cond? donor-type recipient-type)
  (cond [(symbol=? donor-type recipient-type) true]   ;General patterns
        [(symbol=? recipient-type 'AB+) true]
        [(symbol=? donor-type 'O-) true]
        ;;Specific conditions
        [(symbol=? recipient-type 'A+) (cond [(symbol=? donor-type 'O+) true]  
                                             [(symbol=? donor-type 'A-) true]
                                             [else false])]
        [(symbol=? recipient-type 'B+) (cond [(symbol=? donor-type 'O+) true]
                                             [else false])]
        [(symbol=? donor-type 'B-) (cond [(symbol=? recipient-type 'B+) true]
                                         [(symbol=? recipient-type 'AB-) true]
                                             [else false])]
        [else false]))

;;(check-expect (can-donate-to/bool? 'O- 'O-) true)
;;(check-expect (can-donate-to/bool? 'A+ 'AB+) true)
;;(check-expect (can-donate-to/bool? 'O- 'B-) true)
;;(check-expect (can-donate-to/bool? 'A- 'A+) true)
;;(check-expect (can-donate-to/bool? 'O+ 'A+) true)
;;(check-expect (can-donate-to/bool? 'O+ 'B+) true)
;;(check-expect (can-donate-to/bool? 'AB+ 'O+) false)
;;(check-expect (can-donate-to/bool? 'A+ 'B-) false)

(define (can-donate-to/bool? donor-type recipient-type)
  (or (symbol=? donor-type recipient-type)   ;General patterns
      (symbol=? recipient-type 'AB+)
      (symbol=? donor-type 'O-)
      ;;Specific conditions
      (and (symbol=? recipient-type 'A+) (or (symbol=? donor-type 'O+) (symbol=? donor-type 'A-)))
      (and (symbol=? recipient-type 'B+) (symbol=? donor-type 'O+))
      (and (symbol=? donor-type 'B-) (or (symbol=? recipient-type 'B+) (symbol=? recipient-type 'AB-)))))