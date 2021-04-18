from faker import Faker
import random
import string
fake = Faker()

# THIS IS THE INSERTION FOR PATIENTS
i = 0
email_domain_list = ['@gmail.com', '@yahoo.com', '@hotmail.com', '@aol.com']

users = []
emails = []

print("INSERT INTO `Patients` (`PatientID`, `FirstName`, `LastName`, `SSN`, `DOB`, `PhoneNum`, `Email`, `Address`)")
print("VALUES ")
while i < 50:
    i += 1
    firstname = fake.first_name()
    lastname = fake.last_name()
    ssn = fake.ssn()
    dob = fake.date_of_birth()
    phoneNum = fake.phone_number()
    email = lastname.lower() + str(i % 10000) + fake.word(ext_word_list=email_domain_list)
    emails.append(email)
    address = fake.address()
    users.append(lastname.lower() + str(random.randint(11,99)))
    if i == 50:
        print("\t(" + str(i) + ", '" + firstname + "', '" + lastname + "', '" + ssn + "', '" + str(dob) + "', '" + phoneNum + "', '" + email + "', '" + address + "');")
    else:
        print("\t(" + str(i) + ", '" + firstname + "', '" + lastname + "', '" + ssn + "', '" + str(dob) + "', '" + phoneNum + "', '" + email + "', '" + address + "'),")
print("\n")

#TO GENERATE RANDOM STRING FOR PASSWORDS
password_characters = string.ascii_letters + string.digits


i = 0
print("INSERT INTO `Users` (`PID`, `Email`, `Password`)")
print("VALUES ")
while i < 50:
    email = emails[i]
    password = ''.join(random.choice(password_characters) for i in range(12))
    i += 1
    
    if i == 50:
        print("\t(" + str(i) + ", '" + email + "', '" + password + "');")
    else:
        print("\t(" + str(i) + ", '" + email + "', '" + password + "'),")
print("\n")

# THIS IS THE INSERTION FOR DOCTORS
i = 100000000
print("INSERT INTO `Doctors` (`DocID`, `FirstName`, `LastName`, `DOB`, `Email`, `PhoneNum`)")
print("VALUES ")
while i < 100000050:
    firstname = fake.first_name()
    lastname = fake.last_name()
    dob = fake.date()
    phoneNum = fake.phone_number()
    email = lastname.lower() + str(i % 10000) + fake.word(ext_word_list=email_domain_list)
    address = fake.address()
    i += 1
    if i == 100000050:
        print("\t(" + str(i) + ", '" + firstname + "', '" + lastname + "', '" + dob + "', '" + email + "', '" + phoneNum + "');")
    else:
        print("\t(" + str(i) + ", '" + firstname + "', '" + lastname + "', '" + dob + "', '" + email + "', '" + phoneNum + "'),")
    
print("\n")

# THIS IS THE INSERTION FOR INSPLANS
i = 200000000
print("INSERT INTO `InsPlans` (`PlanID`, `AnnualDeductible`, `AnnualPremium`, `AnnualCoverage`, `LifetimeCoverage`)")
print("VALUES ")
while i < 200000050:
    i += 1
    if i == 200000050:
        print("\t(" + str(i) + ", '" + str(random.randint(1000,5000)) + "', '" + str(random.randint(4000,10000)) + "', '" + str(random.randint(1000,10000)) + "', '" + str(random.randint(100000,500000)) + "');")
    else:
        print("\t(" + str(i) + ", '" + str(random.randint(1000,5000)) + "', '" + str(random.randint(4000,10000)) + "', '" + str(random.randint(1000,10000)) + "', '" + str(random.randint(100000,500000)) + "'),")
print("\n")

# THIS IS THE INSERTION FOR INSPROVIDERS
cat_list = ['HMO', 'PPO', 'EPO', 'POS', 'HDHP', 'HSA']
i = 300000000
j = 200000000
print("INSERT INTO `InsProviders` (`CompanyID`, `CompanyName`, `Category`, `Address`, `Email`, `PhoneNum`, `PlanID`)")
print("VALUES ")
while i < 300000050:
    company = fake.company()
    phoneNum = fake.phone_number()
    email = fake.ascii_email()
    category = fake.word(ext_word_list=cat_list)
    address = fake.address()
    i += 1
    j += 1
    if i == 300000050:
        print("\t(" + str(i) + ", '" + company + "', '" + category + "', '" + address + "', '" + email + "', '" + phoneNum + "', " + str(j) + ");")
    else:
        print("\t(" + str(i) + ", '" + company + "', '" + category + "', '" + address + "', '" + email + "', '" + phoneNum + "', " + str(j) +"),")
    
print("\n")
