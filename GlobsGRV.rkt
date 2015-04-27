#lang racket
;GLOBALS
;-------------------------------------------------
;to make updating options easier
(define funcbox-choices '("linear" "trig" "parabolic"))
(define trigbox-choices '("cos" "sin" "tan" "csc" "sec" "cot"))
;-------------------------------------------------
;GLOBALS

(define coords-3d (list "x" "y" "z"))
(define coords-2d (list "x" "y"))

;GLOBALS AllContClass
;-------------------------------------------------
;to make updating options easier
(define fbc funcbox-choices)
(define tbc trigbox-choices)
;-------------------------------------------------
;GLOBALS
(provide (all-defined-out))