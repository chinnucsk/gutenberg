;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; source https://github.com/cadar/trace-lfe ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun args
  ([[]]       '" ")
  ([[a . as]] (: lists concat (list '" " a '"=~p" (args as)))))

(defmacro print
  [name2 args2 res2]
  `(progn
     (: io format
       (: lists concat
         (list '"TRACE [" ,name2 '"," (args ',args2) '"=> " '"~p" '"]~n"))
       (: lists concat (list (list . ,args2) (list ,res2))))))

(defmacro trace
  ([('define . ((name . args) . body)) . '()]
   `(define (,name . ,args)
      (let ((res . ,body))
        (print ',name ,args res)
        res)))
  ([('defun . (name . (args . body))) . '()]
   `(define (,name . ,args)
      (let ((res . ,body))
        (print ',name ,args res)
        res))))
