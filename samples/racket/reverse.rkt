#lang racket

(define (reverse xs)
  (define (aux xs acc)
    (if (empty? xs)
        acc
        (aux (cdr xs)
             (cons (car xs) acc))))
  (aux xs '()))