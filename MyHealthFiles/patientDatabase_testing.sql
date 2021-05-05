
CREATE TABLE IF NOT EXISTS `Patients`(
	PatientID int NOT NULL,
	FirstName varchar(24),
	LastName varchar(24),
	SSN varchar(11) NOT  NULL,
	DOB varchar(10),
	PhoneNum varchar(30),
	Email varchar(48),
	Address varchar(128),
	PRIMARY KEY (PatientID)
);


CREATE TABLE IF NOT EXISTS `Doctors`(
	DocID int,
	FirstName varchar(24),
	LastName varchar(24),
	DOB varchar(10),
	Email varchar(48),
	PhoneNum varchar(30),
	PRIMARY KEY (DocID)
);

CREATE TABLE IF NOT EXISTS `Appointments`(
	AppointmentID int,
	PatientID int,
	DocID int,
	AppDate varchar(10),
	AppTime varchar(8),
	Reason varchar(127),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (DocID) REFERENCES Doctors(DocID)
);

CREATE TABLE IF NOT EXISTS `InsPlans`(
	PlanID int,
	AnnualDeductible float(9,2),
	AnnualPremium float(9,2),
	AnnualCoverage float(9,2),
	LifetimeCoverage float(9,2),
	PRIMARY KEY(PlanID)
);

CREATE TABLE IF NOT EXISTS `InsProviders`(
	CompanyID int,
	CompanyName varchar(32),
	Category varchar(32),
	Address varchar(127),
	Email varchar(48),
	PhoneNum varchar(20),
	PlanID int,
	PRIMARY KEY (CompanyID),
	FOREIGN KEY (PlanID) REFERENCES InsPlans(PlanID)
);

CREATE TABLE IF NOT EXISTS `Users`(
	PID int,
	Email varchar(48),
	Password varchar(20),
	FOREIGN KEY (PID) REFERENCES Patients(PatientID)
);

CREATE TABLE IF NOT EXISTS `RegisteredPlans`(
	PlanID int,
	PatientID int,
	FOREIGN KEY (PlanID) REFERENCES InsPlans(PlanID),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

CREATE TABLE IF NOT EXISTS `Pharmacies`(
	PharmacyID int,
	PharmacyName varchar(32),
	PhoneNum varchar(20),
	Address varchar(127)
	--Any more attributes?
	PRIMARY KEY(PharmacyID)
);

CREATE TABLE IF NOT EXISTS `PharmacyRecords`(
	PatientID int,
	PharmacyID int,
	PrescriptionName varchar(32),
	PurchaseDate varchar(10),
	Cost float(9,2),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(PharmacyID)
);

CREATE TABLE IF NOT EXISTS `Prescriptions`(
	PatientID int,
	DocID int,
	PharmacyID int,
	PrescriptionName varchar(32),
	ScripDate varchar(10),
	FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
	FOREIGN KEY (DocID) REFERENCES Doctors(DocID),
	FOREIGN KEY (PharmacyID) REFERENCES Pharmacies(PharmacyID)
);

INSERT INTO `Patients` (`PatientID`, `FirstName`, `LastName`, `SSN`, `DOB`, `PhoneNum`, `Email`, `Address`)
VALUES 
	(1, 'Jerome', 'Herrera', '261-78-3231', '1952-04-19', '240.465.8127x978', 'herrera1@yahoo.com', '523 William Radial
South Michael, WY 76367'),
	(2, 'Mary', 'Branch', '525-98-0147', '1923-01-09', '+1-513-114-1386x48569', 'branch2@aol.com', '8303 Stanley Corner Suite 591
Gonzalezbury, AL 73986'),
	(3, 'Michael', 'Mcdaniel', '516-44-7399', '1928-01-14', '434.537.7848', 'mcdaniel3@gmail.com', '5302 Jensen Port
North Margaret, RI 02694'),
	(4, 'Nicholas', 'Johnson', '763-01-9998', '1986-08-28', '676.724.2667x39646', 'johnson4@yahoo.com', '165 Clinton Ways Apt. 351
East Jamesburgh, FL 74529'),
	(5, 'Joseph', 'Williams', '447-58-9721', '1933-01-07', '739.057.8856', 'williams5@yahoo.com', '0408 Rachel Canyon Apt. 561
Matthewtown, OK 65577'),
	(6, 'Angela', 'Harris', '163-02-2525', '1963-06-03', '+1-055-440-8665x158', 'harris6@aol.com', 'USNV Anderson
FPO AA 19706'),
	(7, 'Peter', 'White', '697-39-2498', '1982-07-17', '233.353.9557x5153', 'white7@yahoo.com', '947 Scott Ridges Apt. 286
Lake Sara, SD 35201'),
	(8, 'James', 'Rodriguez', '535-65-2475', '1991-02-23', '(908)909-4866x41890', 'rodriguez8@gmail.com', 'Unit 7720 Box 3831
DPO AP 18120'),
	(9, 'Andrew', 'Chase', '184-10-3912', '2002-06-29', '001-372-613-5193x1501', 'chase9@hotmail.com', '7996 Becky Road Apt. 010
North Margaret, MD 17326'),
	(10, 'Donna', 'Martin', '423-07-9990', '1971-02-28', '(766)506-9936', 'martin10@hotmail.com', '640 Carmen Square
Ronaldmouth, NJ 46427'),
	(11, 'Melanie', 'Foster', '565-90-4252', '2004-11-05', '031.037.9592', 'foster11@hotmail.com', '0753 Andrew Branch Apt. 719
South Heathertown, NE 33629'),
	(12, 'Kiara', 'Mathis', '828-91-9784', '1906-05-18', '(599)033-8406', 'mathis12@gmail.com', 'Unit 9599 Box 4648
DPO AA 86468'),
	(13, 'Laura', 'Ortiz', '097-66-1143', '1988-09-30', '322.572.5626x75084', 'ortiz13@hotmail.com', '420 Alexis Haven Apt. 647
South Christinechester, RI 14139'),
	(14, 'Melissa', 'Ray', '819-92-4565', '2002-02-28', '(694)138-6322x981', 'ray14@yahoo.com', '141 Willis Garden
Doyleland, VT 87324'),
	(15, 'James', 'Ruiz', '861-38-4636', '1959-02-12', '(126)699-9105', 'ruiz15@hotmail.com', '244 Robin Island Suite 124
East Stephaniechester, KY 78722'),
	(16, 'Jeffrey', 'Kelly', '510-03-1803', '2019-05-13', '+1-991-727-2637x050', 'kelly16@gmail.com', '6798 Reid Parkways Suite 561
Blackport, AL 48372'),
	(17, 'Eric', 'Mann', '244-12-2831', '1982-07-19', '+1-460-109-6353x40248', 'mann17@yahoo.com', '04024 James Orchard Apt. 541
North Brian, NY 78974'),
	(18, 'Martha', 'Reynolds', '127-34-6431', '1939-04-05', '(841)717-0512x9915', 'reynolds18@hotmail.com', '595 Andrea Vista
Wendyville, FL 11683'),
	(19, 'Erica', 'Watts', '173-38-6106', '1941-04-12', '703-391-0960x8047', 'watts19@yahoo.com', '559 Daniel Mission
West Oscar, ID 28945'),
	(20, 'Michael', 'Bryant', '420-53-3216', '1973-03-19', '231-937-3275x134', 'bryant20@yahoo.com', '8096 Sandoval Villages Apt. 616
New Masonton, DE 26373'),
	(21, 'Ashley', 'Jones', '229-19-7846', '1928-08-19', '(349)521-2296x7992', 'jones21@yahoo.com', '2183 Jason Squares
Munozfort, WI 02189'),
	(22, 'Mary', 'Poole', '783-29-9654', '1931-01-02', '+1-750-968-4037x70175', 'poole22@aol.com', '1578 Sanders Crossroad
Turnertown, MT 94759'),
	(23, 'Jonathan', 'Owen', '433-90-9127', '1907-09-25', '+1-687-040-9643x8846', 'owen23@yahoo.com', 'PSC 7143, Box 1761
APO AP 67837'),
	(24, 'Kevin', 'Clark', '749-25-2139', '1918-10-04', '(532)810-4738x586', 'clark24@aol.com', '15979 Sharon Squares Suite 945
North Tylermouth, ME 53151'),
	(25, 'Thomas', 'Ramirez', '034-31-6930', '1912-06-22', '(337)760-9564', 'ramirez25@gmail.com', '505 Michael Station
Lake Steve, AK 76323'),
	(26, 'Michael', 'Cowan', '265-63-6100', '1995-01-01', '944.900.6560x00421', 'cowan26@gmail.com', '8979 Lowery Plaza
Markshire, SC 24206'),
	(27, 'Patricia', 'Freeman', '837-03-4591', '1977-10-15', '001-411-438-7272x5708', 'freeman27@aol.com', '073 Gilbert Camp Suite 567
Kennethtown, NJ 59054'),
	(28, 'Matthew', 'Martin', '043-16-3769', '1986-01-05', '587.250.2787', 'martin28@aol.com', '0585 Becker Village Suite 407
Jodyhaven, IA 82999'),
	(29, 'Jessica', 'Hamilton', '551-04-1608', '1995-05-11', '832-831-2629x33044', 'hamilton29@yahoo.com', '8123 Cruz Crossroad Suite 636
Veronicaburgh, MN 43624'),
	(30, 'Chelsea', 'Guerra', '867-60-3945', '1949-11-09', '239.291.1519x76815', 'guerra30@yahoo.com', '2923 Joyce Crest Suite 115
North Ryan, SC 25930'),
	(31, 'Kelly', 'Berger', '528-92-8711', '1925-03-13', '(055)107-9392', 'berger31@yahoo.com', '5155 Philip Land Suite 461
East Henry, WV 08272'),
	(32, 'Jennifer', 'Hodges', '809-08-0209', '1913-11-04', '(659)537-0787x402', 'hodges32@hotmail.com', '80839 Cunningham Square Apt. 395
New Jacob, KY 97757'),
	(33, 'Christine', 'Schmidt', '798-63-7861', '1937-04-25', '(099)685-4690', 'schmidt33@hotmail.com', '9984 Riley Extensions Apt. 171
North Robert, NC 30021'),
	(34, 'Nathan', 'Fitzgerald', '667-74-8494', '1937-08-19', '(803)028-5848x52981', 'fitzgerald34@gmail.com', '62243 Howard Falls Suite 013
Cathyberg, CT 60903'),
	(35, 'Tommy', 'Torres', '593-62-9985', '1999-02-21', '(969)867-7627x60993', 'torres35@yahoo.com', 'USS Ellison
FPO AE 21546'),
	(36, 'Meredith', 'Cook', '645-41-9808', '1972-07-17', '(131)587-2061', 'cook36@gmail.com', '6520 Zimmerman Club Suite 227
Colleenside, OR 33920'),
	(37, 'Brian', 'Brooks', '001-28-8082', '1962-05-24', '001-551-583-3753x6278', 'brooks37@hotmail.com', '1902 Jessica Extension
Lake Judybury, AK 73128'),
	(38, 'Sabrina', 'Edwards', '503-09-2698', '1998-10-18', '4563086164', 'edwards38@aol.com', '38971 Munoz Cove
West David, MS 78957'),
	(39, 'Larry', 'Schroeder', '364-80-0845', '1949-02-06', '001-457-234-4273x03787', 'schroeder39@yahoo.com', '20027 Donald Prairie Apt. 324
Jamesburgh, PA 35443'),
	(40, 'William', 'Cowan', '795-41-4105', '1988-07-31', '+1-895-548-3171', 'cowan40@hotmail.com', '841 Meghan Cliff
New Kristina, DE 72182'),
	(41, 'Elizabeth', 'Carlson', '011-58-3620', '1975-04-13', '+1-390-791-8872x25658', 'carlson41@gmail.com', '5615 Benton Mountains
Clarkmouth, UT 00791'),
	(42, 'Marcia', 'Curtis', '788-28-2072', '2005-11-27', '7919639181', 'curtis42@hotmail.com', '8774 Nunez Rest
North Jonathantown, UT 03857'),
	(43, 'Joseph', 'Holloway', '088-63-3637', '1989-12-11', '817-869-1599x332', 'holloway43@yahoo.com', '262 Angela Locks
South Michelle, ME 63462'),
	(44, 'Patrick', 'Martin', '628-39-5804', '1984-01-24', '541-062-9779x4913', 'martin44@gmail.com', '526 Elliott Street
Melindafort, ID 28814'),
	(45, 'Sarah', 'Sanders', '432-24-9499', '1984-05-15', '+1-671-725-6474x93457', 'sanders45@hotmail.com', '0967 Moody Isle Suite 425
Autumnmouth, TX 60192'),
	(46, 'Danielle', 'Kelly', '705-82-3429', '1923-04-03', '+1-385-631-9934', 'kelly46@yahoo.com', '76427 Cobb Stream Apt. 709
Lake Garyton, ME 28141'),
	(47, 'Paul', 'Conner', '696-91-8445', '1937-08-28', '861.575.3165', 'conner47@gmail.com', 'USNV Johnson
FPO AA 30212'),
	(48, 'Brandon', 'Frye', '430-03-2948', '1918-10-29', '899.254.9852x212', 'frye48@hotmail.com', '0230 Jenna Forest
Nobleland, MD 33165'),
	(49, 'Edwin', 'Miller', '596-48-7952', '1922-06-20', '8052453512', 'miller49@hotmail.com', '204 Jessica Port
Port Ashleeview, UT 08704'),
	(50, 'Nicholas', 'Olsen', '870-81-5530', '1998-12-24', '001-441-015-9153x476', 'olsen50@gmail.com', '1056 Madison Pine Apt. 204
East Kenneth, OH 30432');


INSERT INTO `Users` (`PID`, `Email`, `Password`)
VALUES 
	(1, 'herrera1@yahoo.com', 'b7Rj70lyosdq'),
	(2, 'branch2@aol.com', 'DeGDfL8rDDpF'),
	(3, 'mcdaniel3@gmail.com', 'BTICJhDkfC9f'),
	(4, 'johnson4@yahoo.com', 'LeK4ASUzvbpf'),
	(5, 'williams5@yahoo.com', 'vFumcpyM22s6'),
	(6, 'harris6@aol.com', 'xPfiaE8b5mIl'),
	(7, 'white7@yahoo.com', 'c1w4FxE7f1mW'),
	(8, 'rodriguez8@gmail.com', 'ETJKl9o48rZQ'),
	(9, 'chase9@hotmail.com', 'nHVFz97rRUIG'),
	(10, 'martin10@hotmail.com', 'jM9quzQSwWc4'),
	(11, 'foster11@hotmail.com', 'TVO95EqUaNP5'),
	(12, 'mathis12@gmail.com', 'EkLOtQ725F6r'),
	(13, 'ortiz13@hotmail.com', '2bOBD6or9INh'),
	(14, 'ray14@yahoo.com', 'M5sZvShp6WG9'),
	(15, 'ruiz15@hotmail.com', 'JX53x78VxrEs'),
	(16, 'kelly16@gmail.com', '1eccU5GOvzx0'),
	(17, 'mann17@yahoo.com', 'jFeWfZ7LmZbY'),
	(18, 'reynolds18@hotmail.com', 'UerM98eKeoMx'),
	(19, 'watts19@yahoo.com', '8h5B3TeCQV4L'),
	(20, 'bryant20@yahoo.com', 'uj1oUiknnrhl'),
	(21, 'jones21@yahoo.com', 'hnVUkbWVjWIG'),
	(22, 'poole22@aol.com', 'TKUcMaPziOUE'),
	(23, 'owen23@yahoo.com', 'YVLVclE6YU8I'),
	(24, 'clark24@aol.com', 'GAnH8NeXGyDv'),
	(25, 'ramirez25@gmail.com', 't7Kb2RxACM4U'),
	(26, 'cowan26@gmail.com', 'mP1qz5dGU5EC'),
	(27, 'freeman27@aol.com', '8JmwNcxIhQet'),
	(28, 'martin28@aol.com', 'bgE8tUqwZyr1'),
	(29, 'hamilton29@yahoo.com', 'AtZuA4gdkf7Z'),
	(30, 'guerra30@yahoo.com', 'LAXfTG8kHnez'),
	(31, 'berger31@yahoo.com', 'C4DfqE54CaF2'),
	(32, 'hodges32@hotmail.com', 'O0DB0aDa9Pbn'),
	(33, 'schmidt33@hotmail.com', 'uIsIRfi7z6Si'),
	(34, 'fitzgerald34@gmail.com', 'eixRonqIylG3'),
	(35, 'torres35@yahoo.com', 'SElDgtJuKmYe'),
	(36, 'cook36@gmail.com', 'j46ASqoQxTve'),
	(37, 'brooks37@hotmail.com', 'sHE0wXqfo9Oe'),
	(38, 'edwards38@aol.com', 'MPL93byGwsb8'),
	(39, 'schroeder39@yahoo.com', 'OgAGlpBLZUqR'),
	(40, 'cowan40@hotmail.com', 'jY6XK2sysC8V'),
	(41, 'carlson41@gmail.com', 'GTp6AWCOobPA'),
	(42, 'curtis42@hotmail.com', '5uBfEivyBTun'),
	(43, 'holloway43@yahoo.com', '98PgmPX1Mnei'),
	(44, 'martin44@gmail.com', 'kUdr4pw4znjp'),
	(45, 'sanders45@hotmail.com', '4CTKVDgJ2qdl'),
	(46, 'kelly46@yahoo.com', 'hA96NsFYRIKq'),
	(47, 'conner47@gmail.com', '83LwiR7m4IK6'),
	(48, 'frye48@hotmail.com', 'iQpwKBvhAUXh'),
	(49, 'miller49@hotmail.com', '1v7b9EsCXSTu'),
	(50, 'olsen50@gmail.com', 'wAoUKuxkdkX5');


INSERT INTO `Doctors` (`DocID`, `FirstName`, `LastName`, `DOB`, `Email`, `PhoneNum`)
VALUES 
	(100000001, 'David', 'Dunn', '1970-10-08', 'dunn0@aol.com', '893.212.2992'),
	(100000002, 'Sherri', 'Vazquez', '1992-11-24', 'vazquez1@aol.com', '001-324-310-7370x855'),
	(100000003, 'John', 'Brown', '2010-10-04', 'brown2@gmail.com', '411.199.8626x59265'),
	(100000004, 'Brian', 'Aguilar', '1983-05-05', 'aguilar3@yahoo.com', '877-443-4386x04454'),
	(100000005, 'Kevin', 'Hudson', '1989-09-23', 'hudson4@aol.com', '707-820-5798'),
	(100000006, 'Marcus', 'Atkins', '1974-07-25', 'atkins5@aol.com', '669.467.3229'),
	(100000007, 'Oscar', 'Cruz', '2002-06-14', 'cruz6@yahoo.com', '(729)064-7979'),
	(100000008, 'Debbie', 'Perez', '1987-07-02', 'perez7@aol.com', '071-284-9313'),
	(100000009, 'Eugene', 'Olson', '1975-12-28', 'olson8@aol.com', '562.486.5842'),
	(100000010, 'Heather', 'Reese', '1997-11-03', 'reese9@gmail.com', '495-370-8073'),
	(100000011, 'Ian', 'King', '2000-03-08', 'king10@aol.com', '+1-516-438-5587x80100'),
	(100000012, 'Sandra', 'Johnson', '2009-05-10', 'johnson11@hotmail.com', '+1-144-578-6533'),
	(100000013, 'Robert', 'Nolan', '2010-01-23', 'nolan12@yahoo.com', '001-306-264-9491'),
	(100000014, 'Amber', 'Phillips', '1999-06-20', 'phillips13@hotmail.com', '638-601-0030x46577'),
	(100000015, 'Lauren', 'Richardson', '1984-11-30', 'richardson14@gmail.com', '001-803-976-6380'),
	(100000016, 'Sandra', 'Lowe', '2017-08-19', 'lowe15@gmail.com', '293-525-0670'),
	(100000017, 'Matthew', 'Hahn', '1973-04-10', 'hahn16@hotmail.com', '4142025946'),
	(100000018, 'Kimberly', 'Mclaughlin', '2019-10-25', 'mclaughlin17@hotmail.com', '815.456.0990x431'),
	(100000019, 'Robert', 'Padilla', '1993-02-23', 'padilla18@gmail.com', '001-397-104-4411x02722'),
	(100000020, 'Cindy', 'Martinez', '2011-01-21', 'martinez19@yahoo.com', '+1-141-975-6968x4139'),
	(100000021, 'Lawrence', 'Hale', '1976-02-27', 'hale20@aol.com', '269.372.7173x658'),
	(100000022, 'Bryan', 'Webb', '1970-12-30', 'webb21@yahoo.com', '+1-547-082-0422'),
	(100000023, 'Michael', 'Estes', '1973-01-24', 'estes22@yahoo.com', '931-888-2424x3989'),
	(100000024, 'Michelle', 'Haney', '1994-02-18', 'haney23@aol.com', '(130)081-6250x68026'),
	(100000025, 'Spencer', 'Jackson', '1995-06-12', 'jackson24@gmail.com', '+1-128-318-2898x48633'),
	(100000026, 'Andre', 'Joseph', '2019-05-17', 'joseph25@aol.com', '797.497.2309x37069'),
	(100000027, 'Elizabeth', 'Griffith', '1977-07-26', 'griffith26@gmail.com', '048.254.5520x681'),
	(100000028, 'Todd', 'Gonzales', '2016-09-20', 'gonzales27@aol.com', '(267)543-8741x158'),
	(100000029, 'Kyle', 'Jones', '1970-12-07', 'jones28@hotmail.com', '001-278-978-5249'),
	(100000030, 'Angela', 'Lane', '1980-03-31', 'lane29@aol.com', '268-572-7565x6822'),
	(100000031, 'Danielle', 'Archer', '1973-03-13', 'archer30@gmail.com', '+1-145-976-7159x560'),
	(100000032, 'Jonathan', 'Mahoney', '2008-05-20', 'mahoney31@hotmail.com', '+1-601-718-8675x8900'),
	(100000033, 'Gregory', 'Small', '2002-08-25', 'small32@aol.com', '9354990289'),
	(100000034, 'Kathy', 'Blake', '2003-04-12', 'blake33@gmail.com', '248-379-5641x896'),
	(100000035, 'Kevin', 'Forbes', '1995-12-22', 'forbes34@yahoo.com', '052-678-0389x2625'),
	(100000036, 'Tim', 'Boyd', '1981-07-03', 'boyd35@gmail.com', '586-205-3681x67222'),
	(100000037, 'Tiffany', 'Hernandez', '2000-09-19', 'hernandez36@aol.com', '(553)196-4617x6299'),
	(100000038, 'Alexander', 'Figueroa', '2005-08-22', 'figueroa37@yahoo.com', '001-139-278-9819x104'),
	(100000039, 'Jacob', 'Martinez', '1986-03-29', 'martinez38@gmail.com', '001-600-632-6772x09174'),
	(100000040, 'James', 'Fox', '2010-05-25', 'fox39@hotmail.com', '(885)857-8246x802'),
	(100000041, 'Michelle', 'Brown', '1985-02-01', 'brown40@aol.com', '5039721846'),
	(100000042, 'Danielle', 'Ellis', '2017-03-10', 'ellis41@hotmail.com', '001-679-193-6646x073'),
	(100000043, 'Thomas', 'Barrett', '1979-02-17', 'barrett42@aol.com', '001-122-860-5889x18964'),
	(100000044, 'Adrienne', 'Davidson', '1996-04-29', 'davidson43@aol.com', '(263)366-1939'),
	(100000045, 'Daniel', 'Williams', '1993-10-22', 'williams44@gmail.com', '001-670-346-0299x713'),
	(100000046, 'Lisa', 'Camacho', '2021-04-14', 'camacho45@hotmail.com', '920-333-2534'),
	(100000047, 'Taylor', 'Hahn', '1970-07-03', 'hahn46@gmail.com', '001-941-999-2811x685'),
	(100000048, 'Jamie', 'Smith', '2005-03-30', 'smith47@hotmail.com', '178-239-5746x351'),
	(100000049, 'Cathy', 'Perez', '1993-05-23', 'perez48@hotmail.com', '9834246390'),
	(100000050, 'Thomas', 'Hickman', '1981-03-01', 'hickman49@yahoo.com', '001-874-150-7352x32502');


INSERT INTO `InsPlans` (`PlanID`, `AnnualDeductible`, `AnnualPremium`, `AnnualCoverage`, `LifetimeCoverage`)
VALUES 
	(200000001, '4507', '6826', '8825', '431791'),
	(200000002, '2201', '7551', '1062', '469276'),
	(200000003, '2874', '6265', '9457', '131826'),
	(200000004, '4389', '4770', '5506', '275285'),
	(200000005, '3780', '5261', '6855', '335290'),
	(200000006, '2656', '8909', '1317', '495026'),
	(200000007, '1467', '8597', '7523', '234878'),
	(200000008, '3299', '6044', '9298', '263789'),
	(200000009, '4512', '5009', '8070', '414741'),
	(200000010, '1763', '7205', '4898', '139834'),
	(200000011, '2287', '5536', '6396', '365549'),
	(200000012, '3499', '8787', '1538', '485792'),
	(200000013, '4827', '4942', '9004', '422557'),
	(200000014, '3904', '5633', '9007', '306144'),
	(200000015, '2001', '6937', '1619', '346944'),
	(200000016, '3110', '9085', '2118', '217110'),
	(200000017, '1021', '6601', '5181', '249087'),
	(200000018, '2030', '5553', '4002', '119202'),
	(200000019, '2812', '5329', '4186', '192083'),
	(200000020, '3879', '5544', '6313', '369764'),
	(200000021, '3390', '5852', '8874', '444184'),
	(200000022, '1307', '9380', '9121', '285268'),
	(200000023, '1684', '4960', '1018', '449452'),
	(200000024, '3049', '4488', '2350', '418438'),
	(200000025, '3207', '5986', '5546', '498784'),
	(200000026, '3972', '7087', '5538', '166556'),
	(200000027, '2092', '6706', '3649', '315991'),
	(200000028, '1643', '9992', '2207', '106493'),
	(200000029, '3838', '8911', '1367', '360255'),
	(200000030, '2087', '4477', '7888', '248349'),
	(200000031, '2217', '7817', '7687', '367359'),
	(200000032, '2599', '9114', '9729', '270705'),
	(200000033, '3940', '7939', '9695', '495711'),
	(200000034, '1148', '7849', '1218', '283944'),
	(200000035, '4121', '8634', '7792', '237366'),
	(200000036, '3202', '7228', '6420', '296270'),
	(200000037, '3622', '8923', '5264', '476850'),
	(200000038, '4262', '7983', '3156', '457482'),
	(200000039, '3148', '5029', '6869', '378229'),
	(200000040, '2827', '6832', '9732', '402350'),
	(200000041, '4631', '6610', '2214', '134345'),
	(200000042, '2580', '9253', '1589', '136315'),
	(200000043, '4187', '4931', '7829', '346253'),
	(200000044, '1935', '6074', '7149', '416713'),
	(200000045, '1876', '4610', '9172', '117682'),
	(200000046, '2010', '6678', '5170', '324295'),
	(200000047, '1843', '7987', '5350', '409943'),
	(200000048, '2540', '6137', '3841', '177567'),
	(200000049, '4735', '9775', '6060', '268874'),
	(200000050, '4886', '6364', '7967', '108320');


INSERT INTO `InsProviders` (`CompanyID`, `CompanyName`, `Category`, `Address`, `Email`, `PhoneNum`, `PlanID`)
VALUES 
	(300000001, 'Coleman Group', 'EPO', '7743 Kimberly Causeway
Susanport, IN 30517', 'andrew72@hotmail.com', '001-554-371-7512x395', 200000001),
	(300000002, 'Boyd, Wilson and Benjamin', 'PPO', 'Unit 1325 Box 4014
DPO AE 02964', 'deborah28@gmail.com', '001-355-027-8934', 200000002),
	(300000003, 'French Inc', 'PPO', '9721 Mendez Cliff Apt. 412
Brittanyburgh, WV 71604', 'tammy92@yahoo.com', '224-868-9407x2147', 200000003),
	(300000004, 'Walsh-Casey', 'POS', 'Unit 7518 Box 4392
DPO AA 09889', 'tiffany76@gmail.com', '001-945-880-9395x78881', 200000004),
	(300000005, 'Williams Group', 'HSA', '66652 Clark Burg
Pughhaven, IL 95153', 'bernardfigueroa@blackwell.org', '+1-337-611-6029', 200000005),
	(300000006, 'Gonzalez Inc', 'EPO', '4870 Carter Valley
Port Markborough, UT 88691', 'matthewmartin@baker-willis.com', '096-796-7320x437', 200000006),
	(300000007, 'Guerra Group', 'POS', '59197 Javier Radial Apt. 304
Homouth, UT 20958', 'craigcooper@gmail.com', '108-756-9408x9432', 200000007),
	(300000008, 'Jones Inc', 'HMO', '89372 Mullen Stream Suite 399
Collinsburgh, AL 82538', 'michaelcrawford@mueller-morris.com', '(931)374-5740x824', 200000008),
	(300000009, 'Lewis, Landry and Weaver', 'EPO', '0888 Peterson Cliff Suite 090
Melissaville, OK 71440', 'michaelmorales@avila.com', '001-369-489-8617x609', 200000009),
	(300000010, 'Willis, Neal and Davidson', 'PPO', '3309 Morgan Field Apt. 384
South Jeffrey, IN 46432', 'katherine36@gmail.com', '+1-164-232-2579', 200000010),
	(300000011, 'Lawrence-Cooper', 'EPO', '65527 Davis Divide Suite 795
East Annette, LA 71338', 'vmurray@watson-rodriguez.net', '002-739-5623x514', 200000011),
	(300000012, 'Peterson-Williams', 'EPO', '66681 Jennifer Ports Apt. 119
Paulburgh, AZ 44494', 'gcoleman@yahoo.com', '5875767983', 200000012),
	(300000013, 'Cruz-Sanchez', 'HDHP', '22752 Scott Ferry Apt. 740
Brittanyshire, MN 55515', 'hansonnathan@hotmail.com', '001-143-682-7407x2160', 200000013),
	(300000014, 'Jenkins-Jackson', 'PPO', 'PSC 5236, Box 7374
APO AE 62870', 'david72@yahoo.com', '001-326-969-4564x583', 200000014),
	(300000015, 'Stone Ltd', 'POS', '48123 Meghan Rapids Apt. 338
New Emilyburgh, OK 27705', 'brendachoi@gmail.com', '307.293.7627x199', 200000015),
	(300000016, 'Patterson, Johnson and Cherry', 'POS', 'Unit 9661 Box 8936
DPO AE 14085', 'bjones@sanchez.biz', '2934169285', 200000016),
	(300000017, 'Ryan, Ballard and Mcdonald', 'EPO', '516 Christopher Plain Apt. 126
Bergmouth, NM 85370', 'gomezcristian@hotmail.com', '001-370-083-6084x639', 200000017),
	(300000018, 'Goodman, Delgado and Mills', 'POS', '568 Santos Lake
North Barbara, MN 73290', 'fwilcox@gmail.com', '+1-576-062-3566', 200000018),
	(300000019, 'Smith and Sons', 'POS', '052 Cummings Groves Apt. 023
East Jennifershire, WI 99786', 'brittanybutler@yahoo.com', '180.636.4877', 200000019),
	(300000020, 'Vega, Pearson and Ryan', 'EPO', '4796 Marshall Canyon
South Jenniferland, WA 86220', 'tiffany96@reed.com', '001-060-599-1984x7781', 200000020),
	(300000021, 'Hernandez-Robinson', 'PPO', '520 Jacob Ways
South Donna, AL 71766', 'lisa10@yahoo.com', '4436766730', 200000021),
	(300000022, 'Rivera-Brooks', 'HSA', 'PSC 4001, Box 8382
APO AE 47869', 'mwilliams@hotmail.com', '001-278-377-8085', 200000022),
	(300000023, 'Hansen, Atkins and Irwin', 'HMO', '4359 Madison Terrace Suite 148
South Wendy, VT 43244', 'traci83@yahoo.com', '(584)920-8204', 200000023),
	(300000024, 'Nguyen-Moore', 'PPO', '4355 Brandon Path
Louisfort, ND 67522', 'hesskathryn@taylor.com', '(787)515-4426x5305', 200000024),
	(300000025, 'Smith Group', 'EPO', '77607 Gould Drives
Port Michelle, CO 85346', 'wardscott@yahoo.com', '333-878-9740x42237', 200000025),
	(300000026, 'Mayo PLC', 'HMO', '6930 Timothy Ports Suite 703
East Reneeside, MI 82573', 'josesanchez@gmail.com', '176.340.8561', 200000026),
	(300000027, 'Friedman-Ramirez', 'HDHP', '354 Hailey Branch Apt. 666
Michaelton, SD 13590', 'ortizlouis@gmail.com', '588.734.3780x22635', 200000027),
	(300000028, 'Cross Inc', 'HSA', '0074 Moss Springs Apt. 217
West Matthewbury, ID 88903', 'gregorymichael@reed.com', '070-235-2572x26032', 200000028),
	(300000029, 'Jacobson, Brown and Edwards', 'EPO', '014 Ellis Locks
Port Makayla, AR 51098', 'adamsjustin@hotmail.com', '7097317156', 200000029),
	(300000030, 'Rogers-Mcdonald', 'POS', 'Unit 9591 Box 8146
DPO AE 51240', 'greenbrandon@yahoo.com', '600.589.1739x43770', 200000030),
	(300000031, 'Johnson, Adams and Ramos', 'HSA', '964 Daniel Shores
East Brian, IL 61771', 'ashleymartinez@finley.com', '586.525.0505', 200000031),
	(300000032, 'Parker Inc', 'PPO', '4075 Teresa Park
Andrewburgh, WY 96557', 'donnahanson@jones.com', '720.091.7629', 200000032),
	(300000033, 'Arroyo LLC', 'PPO', '9785 Michael Mews Suite 620
Jasonhaven, TX 20573', 'timothybaxter@hotmail.com', '646.762.0630x124', 200000033),
	(300000034, 'Taylor-Mckee', 'EPO', '7563 Wilson Curve
Port Margaret, SC 22583', 'gainespatrick@mooney.net', '(008)298-8131', 200000034),
	(300000035, 'Warren, Rubio and Garcia', 'PPO', 'USNS Scott
FPO AE 59012', 'yfigueroa@gmail.com', '627.609.7669', 200000035),
	(300000036, 'Martin, Clark and Jones', 'HDHP', '36886 Glenda Causeway Suite 614
Ewingville, UT 67165', 'michael34@butler.info', '001-642-316-6056x77264', 200000036),
	(300000037, 'Gregory-Kennedy', 'EPO', '65276 Victoria Hills
North Sandrafort, OR 43731', 'npaul@hotmail.com', '001-341-652-4031', 200000037),
	(300000038, 'Parks-Bowman', 'HMO', '729 Mclaughlin Brook
West Rossland, ND 22058', 'andrew05@gmail.com', '+1-302-560-7632x911', 200000038),
	(300000039, 'Peters Ltd', 'HMO', 'Unit 8162 Box 2032
DPO AA 53351', 'kimberlylindsey@gmail.com', '001-821-616-1024x8478', 200000039),
	(300000040, 'Myers-Alvarado', 'PPO', '559 Adkins Forge
Arnoldton, MD 28433', 'kyliesmith@gonzalez.com', '301-990-5982', 200000040),
	(300000041, 'Morales-Duarte', 'HSA', '86735 Beasley Garden
Lake Crystalburgh, NY 66653', 'elizabeth10@mccormick.com', '561-237-6431x902', 200000041),
	(300000042, 'Gilbert, Brown and Scott', 'HMO', '9329 Nathan Flats Suite 873
South Amy, AL 20712', 'fjohnson@wells.biz', '206.079.5404x161', 200000042),
	(300000043, 'Hernandez PLC', 'PPO', '381 Barry Fall Apt. 364
West Brianton, FL 26800', 'qbowman@brown.info', '001-502-408-2162x03485', 200000043),
	(300000044, 'Bell-Lewis', 'EPO', 'Unit 8296 Box 1830
DPO AE 20126', 'mmoore@gmail.com', '744-114-4282', 200000044),
	(300000045, 'Russell-Smith', 'PPO', '510 Thompson Trail Suite 542
New Sharon, NE 11275', 'sheilagutierrez@hotmail.com', '1697314683', 200000045),
	(300000046, 'Patton Inc', 'HDHP', '35846 Kimberly Drive Apt. 292
Dixonfort, KY 96350', 'ellisleslie@gmail.com', '+1-715-201-4749x7699', 200000046),
	(300000047, 'Andrade, Long and Carpenter', 'HSA', '75570 Harrison Cliffs
Juliestad, WV 07456', 'xlambert@taylor-warren.com', '001-267-382-3174', 200000047),
	(300000048, 'Mcgee PLC', 'HDHP', '369 West Neck Suite 529
Johnview, NH 21019', 'latoyaromero@hotmail.com', '9304277804', 200000048),
	(300000049, 'Swanson-Carter', 'POS', '124 Watson Meadows
Jenniferburgh, NY 39529', 'gpotter@parker.com', '001-421-859-9300x3908', 200000049),
	(300000050, 'Murphy, Bishop and Chang', 'HMO', '72236 Gomez Vista
Thomasmouth, VA 85565', 'tlarson@daniels-delgado.com', '4119731393', 200000050);

INSERT INTO `Pharmacies` (`PharmacyID`, `PharmacyName`, `PhoneNum`, `Address`)
VALUES
        (400000001, 'Taylor Ltd', '001-134-984-5608x411', '723 Dillon Island Suite 462
Port Benjamin, NC 27923),
        (400000002, 'Long Ltd', '062-573-2283x16304', '921 Boyd Grove Suite 315
Samanthatown, CA 36974),
        (400000003, 'Torres PLC', '(260)742-7090', '52335 Shawn Stream Suite 997
North Andrew, HI 45527),
        (400000004, 'Lee LLC', '468-667-3280x9201', '81982 Sandra Circles Apt. 488
Ramirezfort, MA 50535),
        (400000005, 'Moon, Green and Weber', '753.046.6843', '42812 Robinson Estate
Mollytown, CA 62103),
        (400000006, 'Smith, Johnston and Douglas', '(186)117-1695x86528', '1402 Bridget Village
Lake Dannymouth, WI 36718),
        (400000007, 'Ball Group', '475.504.8870x7482', '207 Clinton Curve
Petersenborough, OH 38468),
        (400000008, 'Martin Group', '222.404.5635x0723', '708 Brown Heights Apt. 087
Mitchellport, MA 09710),
        (400000009, 'Summers-Harrison', '996.159.6667x38899', '85795 Jeffery Prairie
Nicolehaven, TX 72553),
        (400000010, 'Mack, Ellis and Tucker', '982-910-9748x34405', '9717 Acevedo Path
South Katherine, OR 54188),
        (400000011, 'Bray, Harris and Garcia', '+1-004-923-5968x80740', '789 Soto Parkways
West Melissa, ME 59271),
        (400000012, 'Parrish, Brown and Rodriguez', '239-629-7229x104', '275 Eddie Flats
North Erikaberg, CO 34328),
        (400000013, 'Martinez Inc', '+1-419-078-0926x42075', '778 Michelle Valleys Suite 443
Jameschester, UT 98177),
        (400000014, 'Torres-Brock', '(762)261-9325x900', '614 Johnny Mount
Jacquelineborough, CT 57008),
        (400000015, 'Allen-Adams', '+1-727-965-6414x877', '4688 Barnes Lodge Suite 597
New Mary, KS 86365),
        (400000016, 'Walton, Harvey and Lopez', '7615290912', '826 Robinson Plains Apt. 304
Angelafurt, NV 02645),
        (400000017, 'Brown, Bates and Davis', '001-246-971-3854x92671', 'PSC 4139, Box 8116
APO AP 69618),
        (400000018, 'Hall Ltd', '(081)281-4310x6438', '865 Jones Streets Suite 888
Mariatown, PA 33343),
        (400000019, 'Davis, Ellison and Perry', '758-936-6336', '01511 Laura Vista
Marissaview, AK 44386),
        (400000020, 'Smith PLC', '+1-503-066-2060x58661', '0243 Richard Well
East Melissa, AR 11889),
        (400000021, 'Snyder-Bradford', '(587)759-6875x30893', '1184 Kyle Row
Wilsonside, VA 75423),
        (400000022, 'Clark LLC', '(332)352-7111x3185', '76182 Julie Trace Suite 777
Jessicaland, SD 10636),
        (400000023, 'Reynolds, Taylor and Orr', '(601)048-2634', '315 Beltran Mountains Suite 557
Seanport, WI 98814),
        (400000024, 'Turner-Willis', '462.587.2004x9899', '892 Leach Tunnel Apt. 193
Williammouth, OR 21847),
        (400000025, 'Browning Inc', '+1-639-598-0752x5084', '280 Melendez Vista Apt. 286
New Arthur, MA 15520);
