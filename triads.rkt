;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname triads) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor mixed-fraction #f #t none #f () #t)))
;;Q5
;;(check-expect (triad-type 'a 'c# 'e) 'Major)
;;(check-expect (triad-type 'c 'e 'g) 'Major)
;;(check-expect (triad-type 'c 'd# 'g) 'Minor)
;;(check-expect (triad-type 'c 'd# 'f#) 'Diminished)
;;(check-expect (triad-type 'c 'e 'g#) 'Augmented)
;;(check-expect (triad-type 'e 'g# 'c) 'Augmented)
;;(check-expect (triad-type 'd 'f 'a) 'Minor)
;;(check-expect (triad-type 'c 'f 'a) 'none)
;;(check-expect (triad-type 'e 'g 'a#) 'Diminished)
;;(check-expect (triad-type 'd# 'g 'b) 'Augmented)
;;(check-expect (triad-type 'b 'd 'f#) 'Minor)
;;(check-expect (triad-type 'e 'g 'b) 'Minor)

(define different-octave-adjustment 12)

(define (triad-type a b c)
  (cond [(< (value-of-note b) (value-of-note a))  ;2nd and 3rd note are in a different octave
         (cond [(= (- (+ (value-of-note b) different-octave-adjustment) (value-of-note a)) 4)
                (cond [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 7) 'Major]
                      [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 8) 'Augmented]
                      [else 'none])]
               [(= (- (+ (value-of-note b) different-octave-adjustment) (value-of-note a)) 3)
                (cond [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 7) 'Minor]
                      [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 6) 'Diminished]
                      [else 'none])]
               [else 'none])]
        [(< (value-of-note c) (value-of-note a))  ;3rd note is in a different octave
         (cond [(= (- (value-of-note b) (value-of-note a)) 4)
                (cond [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 7) 'Major]
                      [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 8) 'Augmented]
                      [else 'none])]
               [(= (- (value-of-note b) (value-of-note a)) 3)
                (cond [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 7) 'Minor]
                      [(= (- (+ (value-of-note c) different-octave-adjustment)
                             (value-of-note a)) 6) 'Diminished]
                      [else 'none])]
               [else 'none])]
        [else (cond [(= (- (value-of-note b) (value-of-note a)) 4)
                     ;;all notes are in the same octave
                     (cond [(= (- (value-of-note c) (value-of-note a)) 7) 'Major]
                           [(= (- (value-of-note c) (value-of-note a)) 8) 'Augmented]
                           [else 'none])]
                    [(= (- (value-of-note b) (value-of-note a)) 3)
                     (cond [(= (- (value-of-note c) (value-of-note a)) 7) 'Minor]
                           [(= (- (value-of-note c) (value-of-note a)) 6) 'Diminished]
                           [else 'none])]
                    [else 'none])]))

(define (value-of-note a)    ;assigns a value to every note
  (cond [(symbol=? a 'c) 1]
        [(symbol=? a 'c#) 2]
        [(symbol=? a 'd) 3]
        [(symbol=? a 'd#) 4]
        [(symbol=? a 'e) 5]
        [(symbol=? a 'f) 6]
        [(symbol=? a 'f#) 7]
        [(symbol=? a 'g) 8]
        [(symbol=? a 'g#) 9]
        [(symbol=? a 'a) 10]
        [(symbol=? a 'a#) 11]
        [(symbol=? a 'b) 12]))