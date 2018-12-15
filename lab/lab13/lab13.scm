; Q1
(define (compose-all funcs)
  (lambda (x)
    (if (null? funcs) x ((compose-all (cdr funcs)) ((car funcs) x))))
)

; Q2
(define (tail-replicate x n)
  (define (iter x n lst)
    (if (= n 0) lst (iter x (- n 1) (cons x lst))))
  (iter x n ())
)