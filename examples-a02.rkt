;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname examples-a02) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;Question 2
(check-expect (median-of-3 2 6 8) 6)
(check-expect (median-of-3 7 -4 9000) 7)
(check-expect (median-of-3 -17 446 445) 445)

;;Question 4a
(check-expect (can-donate-to/cond O- A+) true)
(check-expect (can-donate-to/cond AB+ B-) false)
(check-expect (can-donate-to/cond A+ B+) false)
(check-expect (can-donate-to/cond O+ A-) false)

;;Question 5
(check-expect (triad-type 'c 'e 'g) 'Major)
(check-expect (triad-type 'c 'd# 'g) 'Minor)
(check-expect (triad-type 'c 'd# 'f#) 'Diminished)
(check-expect (triad-type 'c 'e 'g#) 'Augmented)