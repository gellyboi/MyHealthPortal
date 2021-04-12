from faker import Faker
fake = Faker()

# THIS IS THE INSERTION FOR PATIENTS
i = 1

print("INSERT INTO `Patients` (`PatientID`, `Name`, `SSN`, `DOB`, `PhoneNum`, `Email`, `Address`)")
print("VALUES ")
while i < 50:
    name = fake.name()
    ssn = fake.ssn()
    dob = fake.date_of_birth()
    phoneNum = fake.phone_number()
    email = fake.ascii_email()
    address = fake.address()
    i += 1
    if i == 50:
        print("\t(" + str(i) + ", '" + name + "', '" + ssn + "', '" + str(dob) + "', '" + phoneNum + "', '" + email + "', '" + address + "');")
    else:
        print("\t(" + str(i) + ", '" + name + "', '" + ssn + "', '" + str(dob) + "', '" + phoneNum + "', '" + email + "', '" + address + "'),")
print("\n")

# THIS IS THE INSERTION FOR DOCTORS
i = 100000000
print("INSERT INTO `Doctors` (`DocID`, `Name`, `DOB`, `Email`, `PhoneNum`)")
print("VALUES ")
while i < 100000050:
    name = fake.name()
    dob = fake.date()
    phoneNum = fake.phone_number()
    email = fake.ascii_email()
    address = fake.address()
    i += 1
    if i == 100000050:
        print("\t(" + str(i) + ", '" + name + "', '" + dob + "', '" + email + "', '" + phoneNum + "');")
    else:
        print("\t(" + str(i) + ", '" + name + "', '" + dob + "', '" + email + "', '" + phoneNum + "'),")
    
print("\n")

# THIS IS THE INSERTION FOR INSPLANS
# i = 1147483647
# print("INSERT INTO `InsPlans` (`PlanID`, `AnnualDeductible`, `AnnualPremium`, `AnnualCoverage`, `LifetimeCoverage`, `InsCompany`)")
# print("VALUES ")
# while i > 1147483597:
#     name = fake.company()
#     i -= 1
#     if i == 1147483597:
#         print("\t(" + str(i) + ", '" + str(random.randint(1000,5000)) + "', '" + str(random.randint(4000,10000)) + "', '" + str(random.randint(1000,10000)) + "', '" + str(random.randint(100000,500000)) + ", '" + name + "');")
#     else:
#         print("\t(" + str(i) + ", '" + name + "', '" + dob + "', '" + email + "', '" + phoneNum + "'),")
    
# print("\n")

# THIS IS THE INSERTION FOR INSPROVIDERS
cat_list = ['HMO', 'PPO', 'EPO', 'POS', 'HDHP', 'HSA']
i = 200000000
print("INSERT INTO `InsProviders` (`PlanID`, `CompanyName`, `Category`, `Address`, `Email`, `PhoneNum`)")
print("VALUES ")
while i < 200000050:
    company = fake.company()
    phoneNum = fake.phone_number()
    email = fake.ascii_email()
    category = fake.word(ext_word_list=cat_list)
    address = fake.address()
    i += 1
    if i == 200000050:
        print("\t(" + str(i) + ", '" + company + "', '" + category + "', '" + address + "', '" + email + "', '" + phoneNum + "');")
    else:
        print("\t(" + str(i) + ", '" + company + "', '" + category + "', '" + address + "', '" + email + "', '" + phoneNum + "'),")
    
print("\n")
