from faker import Faker
import random
import string
fake = Faker()

# THIS IS THE INSERTION FOR PATIENTS
i = 0
email_domain_list = ['@gmail.com', '@yahoo.com', '@hotmail.com', '@aol.com']

users = []
emails = []

docusers = []
docemails = []


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
    docemail = lastname.lower() + str(i % 10000) + fake.word(ext_word_list=email_domain_list)
    address = fake.address()
    docemails.append(docemail)
    docusers.append(lastname.lower() + str(random.randint(11,99)))
    i += 1
    if i == 100000050:
        print("\t(" + str(i) + ", '" + firstname + "', '" + lastname + "', '" + dob + "', '" + docemail + "', '" + phoneNum + "');")
    else:
        print("\t(" + str(i) + ", '" + firstname + "', '" + lastname + "', '" + dob + "', '" + docemail + "', '" + phoneNum + "'),")
print("\n")

#TO GENERATE LIST OF DOCTOR LOGIN DATA
i = 100000000
print("INSERT INTO `DocUsers` (`DID`, `Email`, `Password`)")
print("VALUES ")
while i < 100000050:
    docemail = docemails[i-100000000]
    password = ''.join(random.choice(password_characters) for i in range(12))
    i += 1
    
    if i == 100000050:
        print("\t(" + str(i) + ", '" + docemail + "', '" + password + "');")
    else:
        print("\t(" + str(i) + ", '" + docemail + "', '" + password + "'),")
print("\n")

# THIS IS THE INSERTION FOR INSPLANS
i = 200000000
print("INSERT INTO `InsPlans` (`PlanID`, `AnnualDeductible`, `AnnualPremium`, `AnnualCoverage`, `LifetimeCoverage`)")
print("VALUES ")
while i < 200000050:
    i += 1
    if i == 200000050:
        print("\t(" + str(i) + ", '" + str(random.randint(1000,5000)) + "', '" + str(random.randint(3000,10000)) + "', '" + str(random.randint(11000,50000)) + "', '" + str(random.randint(100000,500000)) + "');")
    else:
        print("\t(" + str(i) + ", '" + str(random.randint(1000,5000)) + "', '" + str(random.randint(3000,10000)) + "', '" + str(random.randint(11000,50000)) + "', '" + str(random.randint(100000,500000)) + "'),")
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
        print("\t(" + str(i) + ", '" + company + "', '" + category + "', '" + address + "', '" + email + "', '" + phoneNum + "', " + str(j) + "),")
    
print("\n")

# THIS IS THE INSERTION FOR PHARMACIES
i = 400000000
print("INSERT INTO `Pharmacies` (`PharmacyID`, `PharmacyName`, `PhoneNum`, `Address`)")
print("VALUES ")
while i < 400000025:
    pharmacy = fake.company()
    phoneNum = fake.phone_number()
    address = fake.address()
    i += 1
    if i == 400000025:
        print("\t(" + str(i) + ", '" + pharmacy + "', '" + phoneNum + "', '" + address + "');")
    else:
        print("\t(" + str(i) + ", '" + pharmacy + "', '" + phoneNum + "', '" + address + "'),")
    
print("\n")

#################################################################################################

#Let's get some prescriptions in there

file1 = open('prescriptions.txt', 'r')
Lines = file1.readlines()
prescriptionList = []
 
#count = 0
# Strips the newline character
for line in Lines:
    #count += 1
    prescriptionList.append(line.strip())


# THIS IS THE INSERTION FOR PRODUCTS
i = 500000000
print("INSERT INTO `Products` (`PrescriptionID`, `PrescriptionName`, `Amount`, `Cost`)")
print("VALUES ")
while i < 500000116:
    amt = 10 * random.randint(2,6)
    cost = random.randint(25, 140)
    prescription = prescriptionList.pop(0)
    i += 1
    if i == 500000116:
        print("\t(" + str(i) + ", '" + prescription + "', " + str(amt) + ", '" + str(cost) + "');")
    else:
        print("\t(" + str(i) + ", '" + prescription + "', " + str(amt) + ", '" + str(cost) + "'),")
        
print("\n")