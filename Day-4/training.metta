; py-atom
; bind!


! ((py-atom numpy.absolute) -5) ; 5

! ((py-atom "[1, 2, 3]"))

! ((py-atom numpy.array) (py-atom "[1, 2, 3]"))

! (bind! np-array (py-atom numpy.array))
! (np-array (py-atom "[1, 2, 3]"))

!(bind! np-mean (py-atom numpy.mean))
!(np-mean (py-atom "[1, 2, 3, 4, 5]"))

!(bind! np-rand (py-atom numpy.random.rand))
!(np-rand (py-atom 1))