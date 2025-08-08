from hyperon import MeTTa

metta = MeTTa()

with open("families.metta") as db:
    metta.run(db.read())

output1 = metta.run("!(getBrother Lisa)")
output2 = metta.run("!(getBrother Lily)")
print(output1[0])
print(output2[0])

metta.run("(Person Bob 0 Male)")
metta.run("(Child Bob Lisa)")
metta.run("(Child Bob Adam)")

output = metta.run("!(getBrother Lily)")
print(output[0])
