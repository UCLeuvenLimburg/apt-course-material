#lang racket

(let ((foo (call/cc (lambda (c) (c (cons 0 c))))))
  (print (car foo))
  (newline)
  (if (< (car foo) 10)
      ((cdr foo) (cons (+ 1 (car foo)) (cdr foo)))
      '()))