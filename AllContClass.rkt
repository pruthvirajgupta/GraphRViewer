;Authors: Jonathan Wydola Pruv Pabba
;Project: GraphRViewer
;
;About Project: This project is being constructed for 91.301 
;OPL at UML. This project is based on the idea of taking
;user input and generating a graph. The layout so far is plain
;and simple but hopefully it gets the message across of what the
;final product will be. a GUI that you will fill out to graph 2/3-d equations.
;
;About file: This file can be reffered to as the class file forall the data
;stored

#lang racket

;basic class structure to hold information
;---------CLASS-TO-HOLD-ALL-CONTENT-------------------
(define (allcont trigval txtval) 
  (let((func "none")
       (listfunc (string->list "none"))
       (trig trigval)
       (listtrig (string->list trigval))
       (txt txtval)
       (listtxt (string->list txtval)))
    (lambda(mess)
      (cond((eq? mess 'printall) (list trig txt func))
           ((eq? mess 'printfunc) func)
           ((eq? mess 'printfunclist) listfunc)
           ((eq? mess 'printtrig) trig)
           ((eq? mess 'printtriglist) listtrig)
           ((eq? mess 'printtxt) txt)
           ((eq? mess 'printtxtlist) listtxt)
           ((eq? mess 'updatet)
            (lambda (newtrig)
              (cond((eq? newtrig '())
                    (set! trig "")
                    (set! listtrig (string->list "")))
                   (else(set! trig newtrig)
                        (set! listtrig (string->list newtrig))))))
           ((eq? mess 'updatef)
            (lambda (newfunc)
              (cond((eq? newfunc '())
                    (set! func "")
                    (set! listfunc (string->list "")))
                   (else(set! func newfunc)
                        (set! listfunc (string->list newfunc))))))           
           ((eq? mess 'updatetxt) 
            (lambda(newtxt)
              (set! txt newtxt)
              (set! listtxt (string->list newtxt))))))))
;---------CLASS-TO-HOLD-ALL-CONTENT-------------------

