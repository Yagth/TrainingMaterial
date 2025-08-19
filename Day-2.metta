;; Further into Stdlib
!(union [Smith, Lisa, Adam] [Smith, Lisa, Adam]) ;; [Smith, Lisa, Adam]

!(union-atom (Smith Lisa Adam) (Mary John))
!(union-atom (Smith Lisa Adam) (Smith Mary John))
!(union-atom () (Smith Mary John))
!(unique-atom (Smith Lisa Adam Smith Mary John))

!(intersection-atom (Smith Smith Lisa Adam) (Smith Smith Mary John))
!(union-atom  (Smith Mary John) (Smith Lisa Adam))
!(subtraction-atom (Smith Smith Lisa Adam) (Smith Smith Mary John))
!(subtraction-atom (Smith Smith Mary John) (Smith Smith Lisa Adam))
!(subtraction-atom (Mary John) (Lisa Adam))
!(subtraction-atom (Lisa Adam) ())

(union-atom (Smith Lisa Adam) (Smith Mary John)) ;; [Smith, Lisa] => (Smith Lisa)

(Person Mary 64 Female)
(Person Smith 20 Male)
(Person Lisa 27 Female)
(Person Adam 30 Male)
(Person Lily 10 Female)

;; getAge
!(getAge (Person Mary 64))

;; isMale
(= (~= $a $b) (not (== $a $b)))

!(if (~= (getAge (Person Mary 64 Female)) 98) (Really Old) (Not that old))

(= (isMale (Person $n $a $g))
   (if (== $g Male)
       True
       False
   )
)

(Parent Mary Lisa)
(Parent Mary Smith)
(Parent Mary Adam)

!(let $siblings (collapse (match &self 
        (, 
           (Parent $parent Lisa)
           (Parent $parent $sibling)
           (Person $sibling $age $gender)
        ) 
        (Person $sibling $age $gender)))
     (subtraction-atom $siblings ((Person Lisa 27 Female)))
)

(= (getSiblings (Person $name $age $gender))
    (let $siblings (collapse (match &self
            (, 
              (Parent $parent $name)
              (Parent $parent $sibling)
              (Person $sibling $sibAge $sibGender)
            ) 
            (Person $sibling $sibAge $sibGender)))
        (subtraction-atom $siblings ((Person $name $age $gender)))
    )
)

!(getSiblings (Person Lisa 27 Female))

;; !(collapse (match &self (Person $name $age $gender) $name))

;; intersection-atom -> contains function -> (1 2 3 4 5) 1
;; union-atom -> equivalent to set union function
;; areSiblings

















;; ;; getPerson
;; (= (getPerson $name)
;;    (match &self
;;           (Person $name $age $gender)
;;           (Person $name $age $gender)
;;    )
;; )
;;
;; (= (getAge (Person $name $age $gender)) $age)
;; ;; (= (getAge $name) (match &self (Person $name $age $gender) $age))
;; (= (isMale (Person $n $a $g)) (== $g Male))
;;
;; ;; !(isMale (Person Mary 64 Male))
;;
;; ;; If a boy, girl, man or woman
;; !(let $person (getPerson Adam)
;;     (let $age (getAge $person)
;;           (let $isMale (isMale $person)
;;               (if $isMale
;;                   (if (< $age 18)
;;                       (This person is a boy)
;;                       (This person is a man)
;;                   )
;;                   (if (< $age 18)
;;                       (This person is a girl)
;;                       (This person is a woman)
;;                   )
;;               )
;;           )
;;     )
;; )
;; ;
;; ; !(let ($a $b) (A B) ($a $b))
;; ; !(let ($a $b) (A B C) ($a $b))
;; !(let ($person $age) ((getPerson Adam) (getAge (getPerson Adam)))  ($person $age))
;;
;;  !(let $person (getPerson Adam)
;;      (let $age (getAge $person)
;;            (let $isMale (isMale $person)
;;                (if (and $isMale (< $age 18))
;;                    (This person is a boy)
;;                    (if (and $isMale (>= $age 18))
;;                        (This person is a Man)
;;                        (if (and (not $isMale) (< $age 18)) 
;;                            (This person is a girl)
;;                            (This person is a woman)
;;                        )
;;                    )
;;                )
;;            )
;;      )
;;  )
;;
;;  !(let (Person $name $age $gender) (getPerson Adam) ;; (Person Adam 30 Male)
;;        (if (isMale (Person $name $age $gender))
;;            (if (< $age 18) 
;;                (This person is a boy)
;;                (This person is a man)
;;            )
;;            (if (< $age 18)
;;                (This person is a girl)
;;                (This person is a woman)
;;            )
;;        )
;;  )
;;
;;  !(let $person (getPerson Adam)
;;      (let $age (getAge $person)
;;            (let $isMale (isMale $person)
;;                (if $isMale
;;                    (if (< $age 18)
;;                        (This person is a boy)
;;                        (This person is a man)
;;                    )
;;                    (if (< $age 18)
;;                        (This person is a girl)
;;                        (This person is a woman)
;;                    )
;;                )
;;            )
;;      )
;;  )
;;
;;  !(let*
;;      (
;;        ((Person $name $age $gender) (getPerson Adam)) ;; (Person Adam 30 Male)
;;        ($age1 (getAge $person))
;;        ($isMale (isMale $person))
;;        ($newVar (4))
;;      )
;;      (if $isMale
;;          (if (< $age 18)
;;              (This person is a boy)
;;              (This person is a man)
;;          )
;;          (if (< $age 18) 
;;              (This person is a girl)
;;              (This person is a woman)
;;          )
;;      )
;;   )
;;
;;
;;  ;; !(let ($a $b) (A B C) ($a $b))
;;  ;; !(let $tuple (A B) $tuple)
;;
;;  ;; !(not (let $person (getPerson Adam) (< (getAge $person) 18)))
;;  ;; !(not True)
;;
;;  ;; !(and False (and True False))
;;  ;; !(or False True)
;;
;;  ;; Question:
;;  ;;   - Rewrite this using and & or.
;;  ;;   - Rewrite the above let using pattern matching instead of the function.
