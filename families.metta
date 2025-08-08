(Person Mary 64 Female)
(Person John 62 Male)
(Person Smith 20 Male)
(Person Lisa 27 Female)
(Person Adam 30 Male)
(Person Lily 10 Female)

(Husband John Mary) ;; John is Mary's husband
(Wife Mary John) ;; John is Mary's husband
(Husband Adam Lisa) ;; John is Mary's husband
(Child Smith John) ;; Smith is John's child
(Child Smith Mary) ;; Smith is Mary's child
(Child Lisa John) ;; Lisa is John's child
(Child Lisa Mary) ;; Lisa is Mary's child
(Child Lily Adam) ;; Lily is Adam's child
(Child Lily Lisa) ;; Lily is Lisa's child

!(match &self (Child Lily $parent) (match &self (Person $parent $age Female) (Mother $parent Lily))) ;; Lily's mother
!(match &self (, (Child Lily $parent) (Person $parent $age Female)) (Mother $parent Lily)) ;; Lily's mother

!(match &self
        (, (Child Lisa $parent)
           ;; (Person $parent $ageP Male)
           (Child $x $parent)
           (Person $x $ageC Male))
        (Person $x $ageC Male))

(= (getMother $x)
   (match &self
          (, (Child $x $parent)
             (Person $parent $age Female)) 
          (Mother $parent Lily)))

(= (getBrother $x)
   (match &self
        (, (Child $x $parent)
           (Person $parent $ageP Male)
           (Child $y $parent)
           (Person $y $ageC Male))
        (Person $y $ageC Male)))

!(getMother Lisa)
!(getMother Lily)
!(getBrother Lisa)
