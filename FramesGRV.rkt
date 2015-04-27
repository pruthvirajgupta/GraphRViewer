;Author: Jonathan Wydola
;Project: GraphRViewer

;This file is for all frames that are used in this project.
;It also contains all formating for the frames as well as
;dialog panels so place buttons and text at ordered locations


#lang racket
(require racket/gui)
(require "AllContClass.rkt")
(require "GlobsGRV.rkt")


;instantiates a class to holdall content
(define newclass (allcont ""))
;-----------------METHODS-------------------------
;updates the text var
(define (updatetxt vartxt) ((newclass 'updatetxt) vartxt))
;updates the trig var
(define (updatet vart)((newclass 'updatet) vart))
(define (updatef varf)((newclass 'updatef) varf))
;-----------------METHODS-------------------------


;-------------FRAMES----------------------------
; Make a frame by instantiating the frame% class
(define frame (new frame% [label "GraphRViewer"]
                   [width 350]
                   [height 350]
                   [style (list 'no-resize-border 
                             'fullscreen-button)]
                   [border 10]))

(define function-input-frame 
  (new frame%
       [label "Function options"]
       [width 250]
       [height 250]
       [style (list 'no-resize-border
                    'fullscreen-button)]
       [border 10]))
;-------------FRAMES----------------------------

;-------------DIALOGUE BOX----------------------
;Horizontal panelsfor formating they are in the 
;order top to bottom on the display

;Dbox for frame(*************************************
(define diaPanel (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel2 (new horizontal-panel% [parent frame]
                      [alignment '(center center)]))
(define diaPanel3 (new horizontal-panel% [parent frame]
                       [alignment '(center center)]))
;Dbox for frame**************************************

;Dbox for function-frame*****************************
(define funcPanel (new vertical-panel% 
                       [parent function-input-frame]
                       [alignment '(left top)]))
(define funcPanel2 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(center top)]))
(define funcPanel3 (new vertical-panel%
                        [parent function-input-frame]
                        [alignment '(right top)]))
;Dbox for function-frame*****************************

;-------------DIALOGUE BOX----------------------

;-------------RADIO BOX-------------------------
(define bool-3d (new radio-box%
                     [label "Dimensions"]
                     [choices '("2d" "3d")]
                     [parent diaPanel] ;funcpanel
                     [callback 
                      (lambda (radio-box event)
                        (cond((not(eq? 
                               (send bool-3d get-selection)
                               #f))
                        ((newclass 'updatedimension) 
                         (send bool-3d get-selection)))))]))
                              
;-------------RADIO BOX-------------------------

;-------------TEXTBOX---------------------------
(define ntxtf (new text-field%
                   [label "Enter Equation"]
                   [parent diaPanel2]))

;--------------COMBO-----------------------------
;This will be a personal modified class when i can figure that out
;idea inherited from http://lists.racket-lang.org/users/archive/2012-October/054246.html
(define my-combo-field 
  (new (class combo-field%
         (super-new)
         (inherit get-menu append)
         (define/public (update-choices choicelst)
           (map (lambda (old)
                  (send old delete))
                (send (get-menu) get-items))
           (map (lambda (choice)
                  (append choice))
                choicelst)
           (void)))
  [parent function-input-frame]
  [label "combo-field%"]
  [choices '()]))
;http://lists.racket-lang.org/users/archive/2012-October/054246.html-----------------

;    (define/override (text-field event)
;      (cond((not(eq? text-field "trig"))
;            (updatet null))
;    (define/override (text-field-enter event)
;      (cond((not(eq? text-field-enter "trig"))
;            (updatet null))
;    (super-new)))

;the combo boc that selects the type of function to graph
(define funcbox (new combo-field%
                    [parent funcPanel2]
                    [label "Select a function type"]
                    [choices funcbox-choices]
                    [callback (lambda (text-field event)
                                (cond((not(eq? text-field "trig"))
                                      (updatet "")
                                      (updatef (send funcbox get-value)))
                                     (else
                                      (updatef (send funcbox get-value)))))]))
;the combo box for the trig values if its a trig function
;until i can figure out how to hide things
(define trigbox (new combo-field% 
                     [parent funcPanel]
                     [label "Select trig function"]
                     [choices trigbox-choices]
                     [callback (lambda (text-field event)
                                 (updatet (send trigbox get-value)))]))


;GetEquation
;---------------BUTTONS--------------------------------
(define functiondisplay (new button%
                       [parent diaPanel]
                       [label "Change function"]
                       [callback (lambda (button event)
                                   (send function-input-frame show #t))]))
(define get-eq (new button% [parent diaPanel] 
     [label "Get Equation"]
     [callback (lambda (button event)
                 (updatetxt (send ntxtf get-value))
                 (send alldata set-label 
                       (string-append "function type: " (newclass 'printfunc)))
                 (if(not(eq? "none" (newclass 'printtrig)))
                         (send alldata2 set-label 
                               (string-append "trig function: " (newclass 'printtrig)))
                         (send alldata2 set-label " "))
                 (send alldata3 set-label 
                       (string-append "equation val: " (newclass 'printtxt))))]))
;-------------BUTTONS---------------------------



;-------------MENUS-----------------------------
;For some added flavor
;creates a menu plane
;(define new_menu_1 (new menu-bar% [parent frame]))
;creates a menu button, unclickable
;(define new_menu_item1 (new menu% [label "help"]
;                            [parent new_menu_1]
;                            [help-string "helper"]))

;-------------MENUS-----------------------------


;-------------POP-UP-MENU-----------------------
;(define function-values (new popup-menu%
;                             [title
;-------------POP-UP-MENU-----------------------

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


;-------------PROVIDE---------------------------
(provide (all-defined-out))
;-------------PROVIDE---------------------------