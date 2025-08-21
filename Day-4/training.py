# metta.run
# metta.parse_single()
# metta.parse_all()
# metta.space().add_atom()
# metta.space().remove_atom(atom)
# merra.space().query(pattern)


from hyperon import MeTTa

metta = MeTTa()


print(metta.run("!(Hello)"))

result = metta.run("!(MeTTa inside Python)")
print(result)


metta.run("""
	(Parent Tom Bob)
	(Parent Pam Bob)
	(Parent Tom Liz)
	(Parent Bob Ann)
""")
print(metta.run("!(match &self (Parent Tom $x) $x)"))  # [[Liz, Bob]]
print(metta.run("!(match &self (Parent $x Bob) $x)"))  # [[Tom, Pam]]


atom = metta.parse_single("(A B)")
print(atom)

atom1 = metta.parse_single("(A B)")
atom2 = metta.parse_single("(A B) (C D)")
print(atom1)  # (A B)
print(atom2)  # (A B)


program = metta.parse_all("(A B) (C D)")
print(program)  # [(A B), (C D)]


metta.space().add_atom(atom1)

atom = metta.parse_single("(A B)")
metta.space().add_atom(atom)
print(metta.run("!(match &self (A $x) $x)"))  # [[B]


## Querying space

metta.run("""
	(Parent Tom Bob)
	(Parent Pam Bob)
	(Parent Tom Liz)
	(Parent Bob Ann)
""")
pattern = metta.parse_single("(Parent $x Bob)")
print(metta.space().query(pattern))  # [{ $x <- Pam }, { $x <- Tom }]

# Challenges: A terminal application that has the following functionalities.
#                - Add new family relationships
#                - Add new family members
#                - Retrieve family relationships
