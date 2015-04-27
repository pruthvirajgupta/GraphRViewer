#lang racket

(require plot)

(parameterize ([plot-width 150]
               [plot-height 150]
               [plot-x-label #f]
               [plot-y-label #f])
  (list (plot (function (lambda(x) (sqr 2)) (- pi) pi))))
;;set true for every instance
(plot-new-window? #t)


(define (process cont)
  (let((ploteq '()))
    (cond((equal? (cont 'printfunc) "sin")
          (plot (function sin 
    