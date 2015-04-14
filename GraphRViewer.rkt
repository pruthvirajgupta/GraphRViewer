;Authors: Jonathan Wydola Pruv Pabba
;Project: GraphRViewer
;
;About Project: This project is being constructed for 91.301 
;OPL at UML. This project is based on the idea of taking
;user input and generating a graph. The layout so far is plain
;and simple but hopefully it gets the message across of what the
;final product will be. a GUI that you will fill out to graph 2/3-d equations.
;
;About file: This file can be reffered to as main.

#lang racket
(require racket/gui)
(require plot)

;Global text constants
(define defaulttxt "none")
(define defaulttrig "none")

;-------------------------------------------------
;instantiates a class to holdall content
(define newclass (allcont defaulttrig defaulttxt))
;-----------------METHODS-------------------------
;for allcont class
;updates the text var
(define (updatetxt vartxt) ((newclass 'updatetxt) vartxt))
;updates the trig var
(define (updatet vart)((newclass 'updatet) vart))
(define (updatef varf)((newclass 'updatef) varf))
;-----------------METHODS-------------------------
;-------------------------------------------------

;-------------FRAMES----------------------------
; Make a frame by instantiating the frame% class
(define frame (new frame% [label "GraphRViewer"]
                   [width 350]
                   [height 350]
                   [style (list 'no-resize-border 
                             'fullscreen-button)]
                   [border 10]))
;-------------FRAMES----------------------------

;-------------DIALOGUE BOX----------------------
;Horizontal panelsfor formating they are in the 
;order top to bottom on the display
(define diaPanel (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel2 (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel3 (new horizontal-panel% [parent frame]
                       [alignment '(center center)]))
;-------------DIALOGUE BOX----------------------

;--------------COMBO-----------------------------
;This will be a personal modified class when i can figure that out
;(define my-combo-field% 
;  (class combo-field%
;    (define/override (text-field event)
;      (cond((not(eq? text-field "trig"))
;            (updatet null))
;    (define/override (text-field-enter event)
;      (cond((not(eq? text-field-enter "trig"))
;            (updatet null))
;    (super-new)))

;the combo boc that selects the type of function to graph
(define funcbox (new combo-field%
                    [parent diaPanel]
                    [label "Select a function type"]
                    [choices '("linear" "trig" "parabolic")]
                    [callback (lambda (text-field event)
                                (cond((not(eq? text-field "trig"))
                                      (updatet null)
                                      (updatef (send funcbox get-value)))
                                     (else
                                      (updatef (send funcbox get-value)))))]))

;the combo box for the trig values if its a trig function
;until i can figure out how to hide things
(define trigbox (new combo-field% 
                     [parent diaPanel]
                     [label "Select trig function"]
                     [choices '("cos" "sin" "tan" "csc" "sec" "cot")]
                     [callback (lambda (text-field event)
                                 (updatet (send trigbox get-value)))]))
;--------------COMBO----------------------------- 

;-------------BUTTONS---------------------------
;button that generates output of the input provided
;in the combo-boxes and text box
(define x (new button% [parent diaPanel] 
     [label "Get Equation"]
     [callback (lambda (button event)
                 (updatetxt (send ntxtf get-value))
                 (send alldata set-label 
                       (string-append "function type: " (newclass 'printfunc)))
                 (if(not(eq? "none" (newclass 'printtrig)))
                         (send alldata2 set-label 
                               (string append "trig function: " (newclass 'printtrig)))
                         (send alldata2 set-label " "))
                 (send alldata3 set-label 
                       (string-append "equation val: " (newclass 'printtxt))))]))
;-------------BUTTONS---------------------------

;-------------TEXT-FIELDS-----------------------
(define ntxtf(new text-field% [parent diaPanel2] 
     [label "Equation = "]
     [init-value defaulttxt]))
;-------------TEXT-FIELDS-----------------------

;last to keep orginzation of the layout readable
;-------------MESSAGES--------------------------
;(define msg2 (new message% [parent frame2]
;                  [label "Jonathan Wydola"]))
(define alldata (new message% [parent diaPanel3]
                     [label " "]
                     [auto-resize #t]))
(define alldata2 (new message% [parent diaPanel3]
                     [label " "]
                     [auto-resize #t]))
(define alldata3 (new message% [parent diaPanel3]
                     [label " "]
                     [auto-resize #t]))
;-------------MESSAGES--------------------------

;-------------MAIN------------------------------
; Show the frame by calling its show method
(send frame show #t)


;-------------MENUS-----------------------------
;For some added flavor
;creates a menu plane
;(define new_menu_1 (new menu-bar% [parent frame]))
;creates a menu button, unclickable
;(define new_menu_item1 (new menu% [label "help"]
;                            [parent new_menu_1]
;                            [help-string "helper"]))
;-------------MENUS-----------------------------