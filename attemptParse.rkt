;Authors: Jonathan Wydola Pruv Pabba
;Project: GraphRViewer
;
;About Project: This project is being constructed for 91.301 
;OPL at UML. This project is based on the idea of taking
;user input and generating a graph. The layout so far is plain
;and simple but hopefully it gets the message across of what the
;final product will be. a GUI that you will fill out to graph 2/3-d equations.
;
;About file: This file is a attempt to build a string parser
;I dont think this will be implemented but better not scrap it

#lang racket

;-------------------Parser----------------------
(define (parser string) (let((preToken "")
                            (curToken "")
                            (posToken "")
                            (parenToken "")
                            (totalToekn "")
                            (lofc (list ))
                            (index 0))
                         (lambda (mess)
                           ;initial setup
                           (cond((eq? mess 'init)
                                 ;sets initial pretoken to null
                                 (set! preToken null)
                                 ;sets the current tokent to first char
                                 (set! curToken (string-ref string index))
                                 ;sets index to 0
                                 (set! index 0)
                                 ;sets the list of char to the list plus the curToken
                                 ;(set! lofc (append lofc curToken))
                                 ;sets the post token if the index does not exceed string length
                                 ;then returns the parsed expression for 1 value entered
                                 (set! posToken 
                                       (cond((eq? (string-length string) 
                                               (+ index 1))
                                             (list->string curToken))
                                            (else(strin-ref string (+ index 1)))))
                                 ;continue to parse the string
                                 ((parser string) 'running))
                                ;running then do things to parse
                                ((eq? mess 'running)
                                 ;once running it sets the current token first
                                 (set! curToken (string-ref string index))
                                 ;sets the pretoken
                                 (set! preToken (string-ref string (- index 1)))
                                 (if(eq? (string-length string)
                                         (+ index 1))
                                    (list->string (
                                 ;checks to see if the string index is at the end, if so we parsed it and we should return the list of c as a string
                                 (cond(or(or(eq? curToken #\()(eq? curToken #\[)) (eq? curToken #\{))
                                      (set! parenToken (list->string '(curToken)))
                                      (set! 
                                      ((parser string) 'running))
                                 ;(cond((eq? (string-length string)
                                  ;       (+ index 1))
                                   ; (list->string lofc)))
                                 
;---------------------------Parser--------------------------------