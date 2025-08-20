;; Further into Stdlib

!(union-atom (A B C) (D E F))
!(union-atom (A B C) (A E F))
!(unique-atom (A A C D E C D F))
!(intersection-atom (A A B C D) (A C E G H))
!(intersection-atom (A A B C D) (A A C E G H))
!(intersection-atom (A B C D) (E G H))
!(subtraction-atom (A B C) (B C))
!(subtraction-atom (B C) (A B C))
!(subtraction-atom (A B C) (A B C))
!(subtraction-atom (D E F) (A B C))


(Person Mary 64 Female)
;; (Person John 62 Male)
(Person Smith 20 Male)
(Person Lisa 27 Female)
(Person Adam 30 Male)
(Person Lily 10 Female)

(= (getPerson $name)
   (match &self (Person $name $age $gender) (Person $name $age $gender)))

(= (getAge (Person $name $age $gender)) $age)

(= (isMale (Person $name $age $gender)) (== $gender Male))

!(let $person (getPerson Mary) $person)

!(let $person (getPerson Mary) (isMale $person))

!(let (Person $name $age $gender) (getPerson Mary) (== $gender Male))

!(let (Person $name $age $gender) (getPerson Mary) (isMale (Person $name $age $gender)))

!(let $person (getPerson Mary)
      (let $isMale (isMale $person)
          (if $isMale
              (Mary is Male)
              (Mary is Female))))

!(let $person (getPerson Mary)
    (let $age (getAge $person)
       (let $isMale (isMale $person)
          (if $isMale
               (if (< $age 18)
                   (Mary is a Boy)
                   (Mary is a Man)
               )
               (if (< $age 18)
                   (Mary is a Girl)
                   (Mary is a Woman)
               )
           )
        )
     )
)

;; Question:
;;   - Rewrite this using and & or.
;;   - Rewrite the above let using pattern matching instead of the function.

!(let*
     (
       ($person (getPerson Mary))
       ($age (getAge $person))
       ($isMale (isMale $person))
     )
     (if $isMale
         (if (< $age 18)
            (Mary is a Boy)
            (Mary is a Man)
         )
         (if (< $age 18)
            (Mary is a Girl)
            (Mary is a Woman)
         )
     )
 )


(= (getFather $name) (Person Alex 39 Male))


;; Use Higher order function to remove this
;; (= (getChildren $name) ((Person Olivia 18 Female) (Person Ethan 16 Male) (Person Sophia 14 Female)))

(= (getChildren $name) ((Person Orion 18 Male) (Person Ethan 16 Male) (Person Siphen 14 Male)))


;; (= (getBrothers (Person $name $age $gender))
;;    (subtraction-atom (getChildren $name) ((Person $name $age $gender))))

(= (getBrothers (Person $name $age $gender))
   (let $children (getChildren $name)
        (subtraction-atom $children ((Person $name $age $gender))))
)

;; !(getBrothers (Person Ethan 16 Male))

;; Question: Set operation equivalent union-atom

(= (getParents Maya) ((Person Alex 39 Male) (Person Sarah 40 Female)))
(= (getParents Adam) ((Person John 45 Male) (Person Emma 42 Female)))
(= (getParents Eve) ((Person Mark 50 Male) (Person Lucy 48 Female)))
(= (getParents Noah) ((Person David 35 Male) (Person Sophia 33 Female)))
(= (getParents Abel) ((Person James 60 Male) (Person Olivia 58 Female)))
(= (getParents Abel) ((Person James 60 Male) (Person Olivia 58 Female)))
(= (getParents Leah) ((Person Alex 39 Male) (Person Sarah 40 Female)))

(= (areSiblings $name1 $name2)
   (let*
      (
        ($parents1 (getParents $name1))
        ($parents2 (getParents $name2))
        ($commonParents (intersection-atom $parents1 $parents2))
      )
      (not (== $commonParents ()))
   )
)

;; !(areSiblings Maya Leah)

(= (lendMoney ($rel $_ $recieverName))
   (case $rel
         (
           (Friend 1000)
           (Colleague 500)
           (Family 2000)
           ($someOne 0)
         )
   )
)

(= (lendMoneyTo $rel)
   (case $rel
         (
           ((Friend $name $person) 1000)
           ((Colleague $name $person) 500)
           ((Family $name $person) 2000)
           (($someOne $name $person) 0)
         )
   )
)

;; !(lendMoney (Family Alice Maya))
;; !(lendMoney (Friend Alice Alex))
;; !(lendMoney (Colleague Alice James))
;; !(lendMoney (Neighbor Alice James))

;; Question:
;;    - Write the above getParents function with an else case.

;; !(car-atom (A B C D))
;; !(car-atom ())
;; !(cdr-atom (A B C D))
;; !(cdr-atom (A))
;; !(cdr-atom ())

;; !(cons-atom A ())
;; !(cons-atom A (B C))
;; !(cons-atom (A B) (B C))

;; !(decons-atom (A))
;; !(decons-atom (A B C))
;; !(decons-atom ((A B) B C))

;; !(index-atom (A B) 1)
;; !(index-atom (A B) 2)

;; !(size-atom (A B))
;; !(size-atom ())


;; (= (sum $list)
;;    (if (== $list ())
;;        0
;;        (let*
;;           (
;;             ($head (car-atom $list))
;;             ($tail (cdr-atom $list))
;;           )
;;           (+ $head (sum $tail))
;;        )
;;    )
;; )

;; (= (sum $list)
;;    (if (== $list ())
;;        0
;;        (+ (car-atom $list) (sum (cdr-atom $list)))
;;    )
;; )

;; !(sum (1 2 3 4 5))
;; !(sum (1 2 3 4 5) 0)

;; Today's challenges:
;; Implement product function that takes a list and returns the product of all elemtns in the list.
;; Implement both sum and the above product function without using car-atom, cdr-atom and decons-atom.
