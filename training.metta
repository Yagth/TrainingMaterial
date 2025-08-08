(City Nairobi 696000000) ;; 696 km²
(City Mombasa 219900000) ;; 219.9 km²
(City Kisumu 2085900001) ;; 2,085.9 km²
(City Mombasa 212500000) ;; Mombasa County: 212.5 km²
(City Eldoret 3345200000) ;; Uasin Gishu County (Eldoret): ~3,345.2 km²
(City Kitale 2495500000) ;; Trans-Nzoia County (Kitale): ~2,495.5 km²
(City Garissa 45720200000) ;; Garissa County: 45,720.2 km²
(City Marsabit 66923100000) ;; Marsabit County: 66,923.1 km²
(City Lodwar 77000000000) ;; Turkana County (Lodwar): ~77,000 km²

;; Graph Represetnation
(Nairobi to Nakuru)
(Nairobi to Kisumu)
(Nairobi to Mombasa)
(Nakuru to Eldoret)
(Eldoret to Kitale)
(Kitale to Garissa)
(Garissa to Marsabit)
(Marsabit to Lodwar)

(Nairobi 150 Nakuru)
(Nairobi 275 Kisumu)
(Nairobi 500 Mombasa)
(Nakuru 180 Eldoret)
(Eldoret 80 Kitale)
(Kitale 450 Garissa)
(Garissa 380 Marsabit)
(Marsabit 420 Lodwar)

;; Person Name, Age,  Female, Department
(Person Alice 19 Female ComputerScience)
(Person Bob 21 Male ComputerScience)
(Person Charlie 48 Male Driver)

(Father Charlie Bob) ;; Charlie is Bob's father

;; Pattern Matching
!(match &self ($city to Lodwar) $city)
!(match &self ($city to Lodwar) (match &self (City $city $area) $area))
!(match &self (, ($city to Lodwar) (City $city $area)) $area)

;; Space manipulation
!(add-atom &self (City AddisAbaba 527000000))
!(match &self (City AddisAbaba $x) (City AddisAbaba $x))

!(remove-atom &self (Person Charlie 48 Male Driver))
!(match &self (Person Charlie 48 Male Driver) (Person Charlie 48 Male Driver))

;; Builtin functions
!(+ 2 1)
!(% 5 1)
!(== A B)
;; !(/ 1 2 3 4 5)

!(match &self ($city to Lodwar) (match &self (City $city $area) ($city is (/ $area 1000000) Km Sq wide)  ))

;; Function definition
(= (foo $x) $x)
!(foo 1)

(= (getName (Person $name $age $gender $major)) $name)
!(getName (Person Alice 19 Female ComputerScience))

(= (getName (Cat $name $age)) $name)
(= (getName (Dog $name $age)) $name)

!(getName (Cat Luna 3))
!(getName (Dog Max 4))

(= (isEven $x) (== (% $x 2) 0))
(= (isOdd $x) (not (isEven $x)))

!(isEven 4)
!(isEven 5)

!(isOdd 4)
!(isOdd 5)

;; Control flow
;; !(if $bool $then $else)
(= (isDog ($animalType $name $age)) (if (== $animalType Dog) True False))

(= (isCat ($animalType $name $age)) (if (== $animalType Cat) True False))

(= (sound $animal)
   (if (isDog $animal)
       Bark
       (if (isCat $animal)
           Meow
           UnknownAnimalSound)))

!(sound (Dog Max 4))
!(sound (Cat Luna 3))

;; Recursion
(= (factorial $n)
   (if (== $n 0)
       1
       (* $n (factorial (- $n 1)))))

!(factorial 5)

;; Tasks
;;    Implement the family tree in slide number
