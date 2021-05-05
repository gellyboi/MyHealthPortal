--THIS IS THE STRUCTURE FOR THE PATIENTS DATABASE.
--STRUCTURE MAY HAVE TO BE MODIFIED TO FIT CONSTRAINTS OF FUNCTIONALITY.
--MAY NEED TO INCLUDE LABS FOR PATIENTS AS WELL AS TEST RECORDS.


--storage of patient user data for login and basic profile desc.
--DESCRIBES PatientID, First name, Last name, SSN, DOB, Phone#, email, address
CREATE TABLE IF NOT EXISTS `Patients`(
	PatientID int NOT NULL,
	Name varchar(48),
	SSN varchar(11) NOT  NULL,
	DOB varchar(10),
	PhoneNum varchar(20),
	Email varchar(48),
	Address varchar(128),
	PRIMARY KEY (PatientID)
);

--table of notes listed by doctor at an appointment. Maybe every doctor should have this?
--DESCRIBES PatientID, DocID, Diagnoses, Recommendations, Prescriptions
CREATE TABLE IF NOT EXISTS `PatientNotes`(
	PatientID int,
	DocID int,
	Diagnoses varchar(255),
	Recommendations varchar(127),
	Prescriptions varchar(127),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (DocID) REFERENCES Doctors(DocID)
);

--holds record of patient data (appointments, diagnoses, statuses)
--DESCRIBES PatientID, PlanID (insPlans references providers), Date, Treatment, CostToins and patient.
--Lists payment by insurance and patient as well.
CREATE TABLE IF NOT EXISTS `PatientRecords`(
	PatientID int,
	PlanID int,
	RecDate varchar(10),
	Treatment varchar(255),
	CostToIns float(9,2),
	CostToPatient float(9,2),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (PlanID) REFERENCES InsPlans(PlanID)
);

--holds record of costs to patients and insurance providers
--DESCRIBES Treatment, AllowedCost(cost of treatment from table or something), InNetworkCoverage,
--OutNetworkCoverage, and deductible (probably want to add PlanID as well)
CREATE TABLE IF NOT EXISTS `Costs`(
	PlanID int,
	Treatment varchar(255),
	AllowedCost float(9,2),
	InNetworkCoverage float(9,2),
	OutNetworkCoverage float(9,2),
	Deductible float(9,2)
);

--table of doctors that are available for the patient to make appointment with
--DESCRIBES DocID, Name, DOB, PatientID, Email, Phone, (SSN?)
CREATE TABLE IF NOT EXISTS `Doctors`(
	DocID int,
	Name varchar(48),
	DOB varchar(10),
	--PatientID int,
	Email varchar(48),
	PhoneNum varchar(20),
	PRIMARY KEY (DocID)
	--CONSTRAINTS HERE: WHAT IS THE PRIMARY KEY??
);

--appointments made by the patient(s)
--Lists appointmentID, PatientID(Foreign), DocID(Foreign), Date, Time, Reason
CREATE TABLE IF NOT EXISTS `Appointments`(
	AppointmentID int,
	PatientID int,
	DocID int,
	AppDate varchar(10),
	AppTime varchar(5),
	Reason varchar(127),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (DocID) REFERENCES Doctors(DocID)
);

--table of insurance providers that the patient can view
--DESCRIBES Company, PlanID(Foreign), category, Address, Email, Phone
CREATE TABLE IF NOT EXISTS `InsProviders`(
	CompanyName varchar(32),
	PlanID int,
	Category varchar(32),
	Address varchar(127),
	Email varchar(48),
	PhoneNum varchar(20),
	FOREIGN KEY (PlanID) REFERENCES InsPlans(PlanID)
);

--table of insurance plans that are available for the patient
--DESCRIBES PlanID, AnnualDeductible, AnnualPremium, AnnualCoverageLimit, LifetimeCoverage, Network, Company
CREATE TABLE IF NOT EXISTS `InsPlans`(
	PlanID int,
	AnnualDeductible float(9,2),
	AnnualPremium float(9,2),
	AnnualCoverageLimit float(9,2),
	LifetimeCoverage float(9,2),
	InsCompany varchar(32),
	PRIMARY KEY(PlanID)
);

--table of prescriptions that are okayed for patients
--DESCRIBES PatientID(Foreign), DocID(Foreign), PrescriptionName, Date
--this should be okay to insert into database as empty
CREATE TABLE IF NOT EXISTS `Prescriptions`(
	PatientID int,
	DocID int,
	PrescriptionName varchar(32),
	ScripDate varchar(10),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (DocID) REFERENCES Doctors(DocID)
);

--table of available prescriptions

--table of pharmacies that patients can get prescriptions from
--DESCRIBES PharmacyID, PharmacyName, Phone#, PrescriptionName(From prescriptions)
CREATE TABLE IF NOT EXISTS `Pharmacies`(
	PharmacyID int,
	PharmacyName varchar(32),
	PhoneNum varchar(20)
	--Any more attributes?
);

--table of when patients have gotten their medication
--DESCRIBES patient id, pharmacy id, name of prescription, and date of acquisition
CREATE TABLE IF NOT EXISTS `PharmacyRecords`(
	PatientID int,
	PharmacyID int,
	PrescriptionName varchar(32),
	PurchaseDate varchar(10),
	Cost float(9,2),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(PharmacyID)
);

--table of user login data for patients
--DESCRIBES email, password, REFERENCES PatientID
CREATE TABLE IF NOT EXISTS `Users`(
	PID int,
	Email varchar(48),
	Password varchar(20),
	FOREIGN KEY (PID) REFERENCES Patients(PatientID)
);
