;; map
;; (1 2 3 4), unaryFunction $a -> $b, $list, increment
;; (map increment (1 2 3 4)) -> (2 3 4 5)
;; (map double (1 2 3 4)) -> (2 4 6 8)
;; (map double (1 2 3 4)) -> (2 4 6 8)

(= (map $function $list) ;; (2 3), (3), ()
   (if (== $list ())
       ()
       (let*
          (
            ;; ($first (car-atom $list))
            ;; ($rest (cdr-atom $list))
            (($first $rest) (decons-atom $list)) ;; 2
            ($newFirst ($function $first)) ;; 4
            ($newRest (map $function $rest)) ;; (3): (4)
          )
          (cons-atom $newFirst $newRest);; 4 -> () => (4), 3 -> (4) => (3 4)
       )
   )
)

;; [1, 2, 3, 4]
;;              |

(= (inc $a) (+ 1 $a))

(= (double $a) (* 2 $a))

(= (square $a) (* $a $a))

(= (double5 $a) (if (== (% $a 2) 0) (* 2 $a) $a))

(= (max $a $b) ...)

(= (doubleSquare $a) (square (double $a)))

;; !(doubleSquare 5)

;; !(map inc (1 2 3 4)) ;; 1 => (inc 1) -> 2
;; !(map double (1 2 3 4))
;; !(map doubleSquare (1 2 3 6 4 5 10))

;; !(get-type map-atom)
;; !(map-atom (1 2 3 4 5) $a (doubleSquare $a))
; ;!(map-atom (1 2 3 4 5) $a (square $a))

;; !(get-doc map-atom)

;; !(get-type foldl-atom)
;; !(get-doc foldl-atom)
!(foldl-atom (1 2 3 4 5) 1 $acc $first (* $acc $first)) ;; Sum
;; !(foldr-atom (1 2 3 4 5) 1 $acc $first (* $acc $first)) ;; Sum

;; (1 2 3 4 5) 1, (* 1 1)-> 1 => (2 3 4 5) 1, (* 1 2) -> 2 => (3 4 5) 2, (* 2 3) -> 6 => (4 5) 6, (* 6 4) -> 24 => (5) 24, (* 24 5) -> 120 => () 120
;; !(foldl-atom )

;; Challenges:
;;    - Implement count function that counts the number of occurrences of a specific element in an atom
;;        - Recursively
;;        - Using higher order functions
;;    - Implement a filter function
;;    - Implement a foldl function recursively
