
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

CREATE TABLE IF NOT EXISTS `InsPlans`(
	PlanID int,
	AnnualDeductible float(9,2),
	AnnualPremium float(9,2),
	AnnualCoverageLimit float(9,2),
	LifetimeCoverage float(9,2),
	PRIMARY KEY(PlanID)
);

CREATE TABLE IF NOT EXISTS `InsProviders`(
	CompanyID int,
	CompanyName varchar(32),
	Category varchar(32),
	Address varchar(127),
	email varchar(48),
	PhoneNum varchar(20),
	PlanID int,
	PRIMARY KEY (CompanyID),
	FOREIGN KEY (PlanID) REFERENCES InsPlans(PlanID)
);

CREATE TABLE IF NOT EXISTS `Users`(
	PID int,
	Username varchar(20),
	Userpass varchar(20),
	FOREIGN KEY (PID) REFERENCES Patients(PatientID)
);


INSERT INTO `Patients` (`PatientID`, `FirstName`, `LastName`, `SSN`, `DOB`, `PhoneNum`, `Email`, `Address`)
VALUES 
	(1, 'Adam', 'Henry', '139-94-1739', '1954-01-04', '001-074-876-0854x867', 'henry1@gmail.com', '8516 Stephanie Keys Suite 438
South Gary, MA 90694'),
	(2, 'Andrew', 'Cook', '703-92-9025', '1968-10-21', '(282)722-2625x3029', 'cook2@gmail.com', '7357 Collins Corners Suite 232
Wolfchester, ID 04437'),
	(3, 'Laurie', 'Jenkins', '747-92-3863', '1937-01-22', '+1-493-646-0995x60323', 'jenkins3@yahoo.com', '728 Galloway Park
Kimshire, LA 34207'),
	(4, 'Raymond', 'Black', '247-34-2903', '1973-01-02', '887.083.3979', 'black4@aol.com', '4209 Ferguson Shoals Suite 366
Melissaberg, MS 53776'),
	(5, 'Jessica', 'Pace', '023-58-2633', '1919-03-10', '137-017-0348x46215', 'pace5@gmail.com', '79222 Morrison Parks
North Rachel, DE 15247'),
	(6, 'James', 'Morris', '854-57-9473', '2017-02-01', '357-391-3589', 'morris6@aol.com', 'Unit 3592 Box 6854
DPO AE 12933'),
	(7, 'Kelly', 'Daniels', '372-83-6977', '2009-01-24', '+1-803-540-4572x44597', 'daniels7@yahoo.com', '9066 Javier Cove
Port Victoria, AL 00880'),
	(8, 'Mark', 'Wright', '472-09-1693', '2015-01-06', '(932)207-2281x657', 'wright8@hotmail.com', '940 Thomas Cove Suite 107
Hannahville, WI 81961'),
	(9, 'Ashley', 'Shannon', '111-89-4798', '1909-03-21', '001-950-143-0165x856', 'shannon9@yahoo.com', '83713 Brianna Fort
Mendozaport, AZ 15063'),
	(10, 'Tony', 'Ruiz', '397-18-0078', '2010-04-22', '201.953.0085x526', 'ruiz10@hotmail.com', 'PSC 0826, Box 0624
APO AP 85798'),
	(11, 'Matthew', 'Dixon', '476-33-4848', '1905-04-24', '8582892389', 'dixon11@yahoo.com', '68847 Cain Loop Apt. 591
North Susan, TN 93443'),
	(12, 'Eric', 'Cain', '698-44-8478', '1935-05-07', '(532)011-3959x328', 'cain12@hotmail.com', '12923 Ford Tunnel Apt. 084
Jamestown, DE 62785'),
	(13, 'Cheyenne', 'Rios', '378-05-9440', '1948-09-23', '001-781-566-3516x4705', 'rios13@aol.com', '72337 William Roads Suite 884
Lake Nathanielside, OR 38574'),
	(14, 'Amanda', 'Bell', '280-18-3296', '1988-06-28', '006-705-1750', 'bell14@yahoo.com', 'Unit 2958 Box 3220
DPO AE 07770'),
	(15, 'Misty', 'Smith', '218-38-4311', '2002-11-14', '358.670.9956', 'smith15@aol.com', '2412 Boyd Knoll
Williammouth, NY 33858'),
	(16, 'David', 'Henson', '308-33-2463', '1949-08-21', '(031)251-1974x508', 'henson16@aol.com', '57904 Harold Ramp
East Katrina, AZ 40877'),
	(17, 'David', 'Schwartz', '355-60-8464', '2005-08-21', '(319)660-9599x05684', 'schwartz17@yahoo.com', '012 Stone Port Suite 592
Ashleyhaven, WY 88134'),
	(18, 'Kenneth', 'Garcia', '508-18-2751', '1958-11-18', '687.065.7354', 'garcia18@gmail.com', 'Unit 6533 Box 5596
DPO AA 41491'),
	(19, 'Jennifer', 'Bauer', '086-61-9549', '1959-02-02', '892.372.0592x54382', 'bauer19@yahoo.com', '18655 Joseph Ferry
New Jon, AL 82455'),
	(20, 'Derrick', 'Mendoza', '535-02-1182', '1941-10-06', '(645)812-2016x8149', 'mendoza20@yahoo.com', '09118 Melanie Inlet
Joannaport, NE 29547'),
	(21, 'Nicholas', 'Gregory', '686-86-6922', '2000-12-12', '590.854.1745x0834', 'gregory21@gmail.com', '459 Charles Dam
Ronaldstad, AK 91363'),
	(22, 'Kaitlyn', 'Salazar', '214-11-7342', '2001-05-01', '5304708859', 'salazar22@yahoo.com', '8190 Albert Street Apt. 806
Staceytown, AZ 73334'),
	(23, 'Linda', 'Mckee', '004-55-9894', '1963-05-19', '001-220-533-6645x69229', 'mckee23@gmail.com', '2745 Grant Mountains Suite 102
Lake Maryside, CO 30982'),
	(24, 'Elizabeth', 'Bell', '481-12-9988', '1918-05-17', '602.379.0914x9335', 'bell24@gmail.com', '41722 Ronald Plaza
Martinezton, SD 63385'),
	(25, 'Kyle', 'Rodriguez', '270-38-5171', '1984-02-22', '+1-978-434-9684', 'rodriguez25@gmail.com', '0574 Tyler Gardens Apt. 896
Amybury, PA 21595'),
	(26, 'Walter', 'Kelly', '870-80-5140', '1943-07-15', '(057)901-0910x6672', 'kelly26@gmail.com', '330 Misty Crossroad Suite 823
Fitzgeraldfort, TX 75141'),
	(27, 'Bryan', 'Tran', '512-51-6402', '1964-07-08', '931-698-9660x347', 'tran27@gmail.com', '3907 Anderson Ranch Suite 708
New Antoniobury, IA 24293'),
	(28, 'Jonathan', 'Rasmussen', '595-71-2086', '1988-05-11', '(923)650-6219', 'rasmussen28@gmail.com', '13901 Kathryn Stream Apt. 323
Clarkton, FL 92781'),
	(29, 'Shannon', 'Hayes', '071-09-4874', '1921-08-19', '269.917.1878x25499', 'hayes29@yahoo.com', '52075 Wendy Lake Apt. 708
Lake Spencer, OH 49913'),
	(30, 'Patricia', 'Mitchell', '014-09-3670', '1909-10-07', '670-919-9897', 'mitchell30@aol.com', '3923 Laura Road Suite 339
Sierraton, CO 01167'),
	(31, 'Valerie', 'Nguyen', '727-08-7957', '1993-04-20', '616.756.4111x5892', 'nguyen31@aol.com', '797 Robinson Crossing Apt. 702
West Karenton, CA 67046'),
	(32, 'Rebecca', 'Ward', '779-86-6424', '1940-06-27', '001-493-788-5211', 'ward32@hotmail.com', '3302 Hicks Prairie
Robbinsborough, LA 33129'),
	(33, 'Kevin', 'Shepard', '434-92-5236', '1926-05-21', '001-863-846-8092', 'shepard33@aol.com', '89715 Hannah Shore Apt. 859
New Ashleymouth, MO 30760'),
	(34, 'Shane', 'Reed', '414-07-8049', '1979-07-04', '001-715-871-4720', 'reed34@aol.com', '0620 Salazar Locks Suite 086
East Roseborough, NH 14388'),
	(35, 'Scott', 'Pollard', '524-46-0379', '1990-09-20', '340-583-3944', 'pollard35@yahoo.com', '696 Cody Fort
New Cassidy, IA 25795'),
	(36, 'Spencer', 'Ford', '811-01-2058', '1963-01-14', '817.810.0947x5614', 'ford36@gmail.com', '07784 Alexander Estate
East Steven, WV 65405'),
	(37, 'Kimberly', 'Le', '694-78-3903', '1905-12-20', '001-910-558-9918x638', 'le37@aol.com', '704 Oliver Walk
New Jodi, OH 26136'),
	(38, 'Cindy', 'Tucker', '172-10-4850', '1943-07-31', '001-248-322-6923', 'tucker38@aol.com', '8002 Amber Bridge
New Dawn, MA 14845'),
	(39, 'Donald', 'Osborne', '425-84-5275', '2010-01-22', '680.820.2527x100', 'osborne39@aol.com', '9143 Jenkins Point Suite 570
Port Brendachester, IA 39944'),
	(40, 'Derek', 'Neal', '339-17-8170', '1914-05-29', '001-542-617-0969x33355', 'neal40@aol.com', '88477 Kathryn Avenue Suite 089
Mistyport, DE 85331'),
	(41, 'Kathryn', 'Clark', '158-94-9369', '1941-06-06', '979.797.6445x979', 'clark41@aol.com', '0662 Dawson Ferry Apt. 117
Flemingland, WI 72131'),
	(42, 'Jacob', 'Anderson', '461-40-5241', '2019-12-31', '001-670-591-5193', 'anderson42@hotmail.com', 'PSC 8322, Box 5207
APO AP 17424'),
	(43, 'Shannon', 'Bentley', '130-47-7189', '1934-12-31', '001-937-368-5632x8025', 'bentley43@aol.com', '8785 Shawn Junction Suite 740
Monroefurt, UT 97957'),
	(44, 'James', 'Brock', '158-57-9811', '2015-04-27', '263.258.1280', 'brock44@aol.com', 'PSC 9282, Box 4449
APO AP 24405'),
	(45, 'Alicia', 'Pham', '122-23-6245', '1963-03-14', '(250)802-1397x86485', 'pham45@yahoo.com', '1615 Graves Roads Suite 115
Hansenmouth, GA 38887'),
	(46, 'Jeffrey', 'Ryan', '060-84-7040', '1962-08-06', '765.779.1773x52313', 'ryan46@hotmail.com', 'Unit 7619 Box 6457
DPO AP 44204'),
	(47, 'Michael', 'Parker', '177-74-1534', '1923-01-08', '263.695.8796x73210', 'parker47@hotmail.com', 'PSC 3679, Box 9381
APO AA 30812'),
	(48, 'Nathan', 'Carlson', '145-15-7887', '1915-05-12', '090.554.5420', 'carlson48@hotmail.com', '5667 Rice Court
Susanland, DC 92900'),
	(49, 'Bernard', 'Baldwin', '271-64-9720', '1946-12-29', '001-675-443-2406', 'baldwin49@gmail.com', '920 David Causeway Suite 419
Nguyenshire, AR 80841'),
	(50, 'Micheal', 'Hebert', '740-16-2558', '1916-08-10', '(691)012-2099', 'hebert50@yahoo.com', '074 Tamara Roads
Ryanberg, VT 73484');


INSERT INTO `Users` (`PID`, `Username`, `Userpass`)
VALUES 
	(1, 'henry75', 'bPc6I0IUJ6zh'),
	(2, 'cook36', 'IELQzLGOKPVN'),
	(3, 'jenkins81', 'LtmISPEQyFSc'),
	(4, 'black71', 'ylk6JfiNfSSP'),
	(5, 'pace95', 'gvWtMciJUfC3'),
	(6, 'morris81', 'lwqYbC1eLxAi'),
	(7, 'daniels67', 'JaNVytkNES9C'),
	(8, 'wright44', 'vL84tm0gAawg'),
	(9, 'shannon78', '8wINMjihLTcw'),
	(10, 'ruiz62', 'S1tJMTAeicIY'),
	(11, 'dixon88', 'ZMbdnlbd3VEo'),
	(12, 'cain46', '9SikOQdM9Tlv'),
	(13, 'rios68', 'ezG3I2k8zEJZ'),
	(14, 'bell85', '6WtJqKWLjcdI'),
	(15, 'smith47', '4VbeNugJWiN0'),
	(16, 'henson49', 'ZH49OgijYkMX'),
	(17, 'schwartz65', 'F7qKklwkUDly'),
	(18, 'garcia35', 'D6wY2lK47azX'),
	(19, 'bauer21', 'BQXSitrt56aa'),
	(20, 'mendoza42', 'bbsGZX75PzdM'),
	(21, 'gregory21', 'pDS2PcTMCqrY'),
	(22, 'salazar44', 'LejdzT6SlQJE'),
	(23, 'mckee89', 'MmlKmR3BYy9L'),
	(24, 'bell58', 'C9Mm9FVuTSzo'),
	(25, 'rodriguez29', 'eW1dV8AMncro'),
	(26, 'kelly29', '078GBU3H3h4p'),
	(27, 'tran93', '9jwUcYQ7Kfvx'),
	(28, 'rasmussen28', 'QkKaGu77sfDI'),
	(29, 'hayes69', 'tcJxRmlD05Tg'),
	(30, 'mitchell77', 'rs81xJAEkz9Y'),
	(31, 'nguyen73', 'tRcyaHuAHBwG'),
	(32, 'ward87', 'Y22Ke1EVry7A'),
	(33, 'shepard54', 'qX6biIzvkN8J'),
	(34, 'reed71', 'f8N7bVPYT5uN'),
	(35, 'pollard30', 'B5ATIRI9nT91'),
	(36, 'ford50', 'xnbTgtS02HOe'),
	(37, 'le59', 'oqzj2850Hhn0'),
	(38, 'tucker81', 'Xa0iS4IFhGq8'),
	(39, 'osborne19', '6jtbtPCzeWJt'),
	(40, 'neal32', 'bhXpeklzOsTC'),
	(41, 'clark48', 'uLBWOeKibtzR'),
	(42, 'anderson69', '2ioQTeyE0yyB'),
	(43, 'bentley82', 'xsaFuqMnbdmZ'),
	(44, 'brock38', 'XEGTBWw3ZgqS'),
	(45, 'pham53', 'sTVMI7iCjRTi'),
	(46, 'ryan40', 'fD3xqUk39Q2s'),
	(47, 'parker58', 'Lygs7cMYqVHA'),
	(48, 'carlson39', 'maNWRedIWLpT'),
	(49, 'baldwin96', '5irEoWvIcn4c'),
	(50, 'hebert83', 'yPABOxqNQC45');


INSERT INTO `Doctors` (`DocID`, `FirstName`, `LastName`, `DOB`, `Email`, `PhoneNum`)
VALUES 
	(100000001, 'Christina', 'Jensen', '1986-09-02', 'jensen0@aol.com', '638.370.6670'),
	(100000002, 'John', 'Walker', '2006-02-10', 'walker1@gmail.com', '960.809.8653'),
	(100000003, 'Jennifer', 'Bowers', '1998-02-15', 'bowers2@hotmail.com', '001-056-448-7857'),
	(100000004, 'Kathryn', 'Gallegos', '1979-03-07', 'gallegos3@yahoo.com', '674-650-0373x45626'),
	(100000005, 'Garrett', 'Prince', '2014-10-24', 'prince4@yahoo.com', '+1-581-232-5770x5170'),
	(100000006, 'Tiffany', 'Vargas', '2010-01-14', 'vargas5@yahoo.com', '8352407759'),
	(100000007, 'Harry', 'Hester', '1986-05-24', 'hester6@gmail.com', '647.506.6758'),
	(100000008, 'Brian', 'Morris', '2019-10-29', 'morris7@aol.com', '(150)520-1865x6499'),
	(100000009, 'Shirley', 'Schwartz', '2017-07-25', 'schwartz8@hotmail.com', '001-576-471-0180x77181'),
	(100000010, 'Tyler', 'Scott', '2016-09-17', 'scott9@hotmail.com', '208-218-0191x6863'),
	(100000011, 'Matthew', 'Hernandez', '2002-10-28', 'hernandez10@hotmail.com', '626-445-5975x9607'),
	(100000012, 'Angela', 'Henderson', '2014-09-25', 'henderson11@gmail.com', '(238)278-0142x5442'),
	(100000013, 'Cindy', 'Rodriguez', '1984-10-28', 'rodriguez12@aol.com', '154-135-9511'),
	(100000014, 'Gregory', 'Hood', '2020-11-06', 'hood13@aol.com', '001-781-919-5731x305'),
	(100000015, 'Robert', 'Nixon', '1989-06-29', 'nixon14@hotmail.com', '(832)749-7828x4835'),
	(100000016, 'Cody', 'Lee', '1979-08-08', 'lee15@yahoo.com', '0699855129'),
	(100000017, 'Edwin', 'Underwood', '1975-08-30', 'underwood16@gmail.com', '001-582-329-2649x08837'),
	(100000018, 'Wendy', 'Williams', '1981-01-14', 'williams17@gmail.com', '641.221.9943'),
	(100000019, 'Thomas', 'Gray', '2016-05-23', 'gray18@gmail.com', '(867)095-7855'),
	(100000020, 'Laura', 'Rivera', '2016-07-16', 'rivera19@aol.com', '(961)123-3438x1330'),
	(100000021, 'Gary', 'Jones', '2004-12-13', 'jones20@gmail.com', '(974)704-9427'),
	(100000022, 'Shawn', 'Collins', '1992-10-23', 'collins21@aol.com', '2295826348'),
	(100000023, 'Karen', 'Walker', '1985-04-13', 'walker22@yahoo.com', '+1-579-259-0232x705'),
	(100000024, 'Dana', 'Hunter', '1989-05-03', 'hunter23@yahoo.com', '001-769-193-7389x989'),
	(100000025, 'Joshua', 'Cooper', '1994-12-05', 'cooper24@yahoo.com', '393.800.2258'),
	(100000026, 'Suzanne', 'Moran', '2002-01-20', 'moran25@yahoo.com', '(745)458-8077x244'),
	(100000027, 'Michael', 'Edwards', '1991-09-17', 'edwards26@yahoo.com', '(968)925-8608x180'),
	(100000028, 'Shannon', 'Simmons', '1990-02-11', 'simmons27@gmail.com', '085.265.4061x25061'),
	(100000029, 'Sylvia', 'Kim', '2020-10-22', 'kim28@aol.com', '529-213-7804'),
	(100000030, 'Hunter', 'Carter', '2019-12-10', 'carter29@gmail.com', '001-262-036-3366x0987'),
	(100000031, 'Wendy', 'Taylor', '1989-12-22', 'taylor30@aol.com', '+1-367-568-5097x641'),
	(100000032, 'Robert', 'Hill', '2000-10-10', 'hill31@yahoo.com', '112-482-7787x1000'),
	(100000033, 'Robin', 'Thomas', '1981-11-08', 'thomas32@gmail.com', '062-128-4214x26769'),
	(100000034, 'Christopher', 'Holden', '1993-11-18', 'holden33@aol.com', '+1-416-210-8689x0508'),
	(100000035, 'Dawn', 'Nguyen', '2017-09-14', 'nguyen34@gmail.com', '190-057-6497'),
	(100000036, 'Edward', 'James', '2019-06-13', 'james35@gmail.com', '7601528745'),
	(100000037, 'Amanda', 'Gomez', '1981-07-29', 'gomez36@hotmail.com', '001-328-918-6304x0477'),
	(100000038, 'Samantha', 'Castillo', '1972-03-18', 'castillo37@aol.com', '155-981-8985'),
	(100000039, 'Tammy', 'Perez', '1973-12-25', 'perez38@hotmail.com', '(137)852-5269x4908'),
	(100000040, 'Julia', 'Clarke', '2012-06-10', 'clarke39@gmail.com', '(903)050-7104'),
	(100000041, 'Justin', 'Johnson', '1974-01-24', 'johnson40@aol.com', '738.397.6140x133'),
	(100000042, 'Bobby', 'Perez', '2019-12-26', 'perez41@aol.com', '743-909-7240x5342'),
	(100000043, 'Michelle', 'Carter', '1997-02-17', 'carter42@yahoo.com', '009.676.8614'),
	(100000044, 'Alexander', 'Turner', '1989-06-24', 'turner43@aol.com', '(346)110-8677x76461'),
	(100000045, 'Kelly', 'White', '1999-07-28', 'white44@gmail.com', '590.125.0539'),
	(100000046, 'Timothy', 'Coleman', '1981-08-28', 'coleman45@yahoo.com', '+1-693-457-8847x6439'),
	(100000047, 'Emily', 'Marsh', '2012-12-07', 'marsh46@yahoo.com', '001-480-968-4109x3938'),
	(100000048, 'Amanda', 'Mendoza', '2014-11-03', 'mendoza47@yahoo.com', '695-798-7372x71031'),
	(100000049, 'Melissa', 'Hoffman', '2004-07-04', 'hoffman48@yahoo.com', '220.709.4008x547'),
	(100000050, 'Kevin', 'Hall', '2012-12-04', 'hall49@yahoo.com', '(776)069-8055x528');


INSERT INTO `InsPlans` (`PlanID`, `AnnualDeductible`, `AnnualPremium`, `AnnualCoverageLimit`, `LifetimeCoverage`)
VALUES 
	(200000001, '2645', '6899', '7026', '369018'),
	(200000002, '2436', '7154', '9434', '273333'),
	(200000003, '2169', '4013', '7206', '353338'),
	(200000004, '3620', '5277', '6636', '407684'),
	(200000005, '4127', '4139', '2825', '295175'),
	(200000006, '2918', '5684', '5204', '457927'),
	(200000007, '2023', '4171', '7823', '234140'),
	(200000008, '4395', '9384', '5179', '108399'),
	(200000009, '4610', '7576', '1434', '437931'),
	(200000010, '1136', '5028', '3207', '300707'),
	(200000011, '3511', '7561', '2630', '496114'),
	(200000012, '4676', '7359', '1273', '353228'),
	(200000013, '1792', '8028', '5436', '114473'),
	(200000014, '1267', '6758', '7472', '455415'),
	(200000015, '4841', '9600', '9277', '258327'),
	(200000016, '2177', '9174', '4005', '280548'),
	(200000017, '4593', '5674', '5327', '183209'),
	(200000018, '3500', '6142', '7260', '490074'),
	(200000019, '3404', '5879', '7639', '312206'),
	(200000020, '4993', '6311', '3056', '466744'),
	(200000021, '4719', '8437', '1130', '178376'),
	(200000022, '2015', '7812', '4689', '432541'),
	(200000023, '3009', '8336', '9937', '118257'),
	(200000024, '3191', '9213', '8197', '137434'),
	(200000025, '1242', '6681', '1328', '313007'),
	(200000026, '3934', '7935', '1879', '107637'),
	(200000027, '2679', '4099', '4600', '314590'),
	(200000028, '4687', '6615', '5881', '376472'),
	(200000029, '1525', '7864', '8474', '301763'),
	(200000030, '4740', '9271', '9315', '215910'),
	(200000031, '4122', '9320', '8683', '434899'),
	(200000032, '3534', '7888', '2020', '481999'),
	(200000033, '2275', '8262', '6471', '238562'),
	(200000034, '4574', '8595', '3286', '406082'),
	(200000035, '1511', '9220', '5691', '364941'),
	(200000036, '1229', '6361', '8165', '410446'),
	(200000037, '3722', '9395', '7287', '140324'),
	(200000038, '3059', '5878', '3944', '274484'),
	(200000039, '3759', '6550', '5689', '363003'),
	(200000040, '1300', '5579', '8343', '194395'),
	(200000041, '4977', '8137', '6723', '222661'),
	(200000042, '3095', '8593', '8475', '285191'),
	(200000043, '2014', '5619', '7639', '471579'),
	(200000044, '4826', '9408', '6532', '239090'),
	(200000045, '3698', '8790', '9318', '398537'),
	(200000046, '3131', '8222', '9630', '240003'),
	(200000047, '3735', '6021', '5517', '252078'),
	(200000048, '1383', '6686', '3785', '369945'),
	(200000049, '1564', '6399', '5320', '214935'),
	(200000050, '2190', '4239', '9372', '218981');


INSERT INTO `InsProviders` (`CompanyID`, `CompanyName`, `Category`, `Address`, `Email`, `PhoneNum`, `PlanID`)
VALUES 
	(300000001, 'Harrell-Morrison', 'HDHP', '968 Jennifer Trail Suite 114
Harrischester, AZ 71840', 'gail91@gmail.com', '+1-327-116-9782x28463', 200000001),
	(300000002, 'Fisher-Kelly', 'HMO', '4185 Megan Ridge Apt. 885
South Jonathan, WI 56606', 'amywashington@obrien-hartman.com', '(442)435-0037', 200000002),
	(300000003, 'Thomas, Huff and Murray', 'POS', '7104 Laura Ridge
Marioside, LA 26979', 'bwood@hotmail.com', '+1-708-827-5639x796', 200000003),
	(300000004, 'Kim-Alvarado', 'POS', '295 Robert River
Wheelerhaven, MO 92572', 'michaelking@yahoo.com', '176-296-3235', 200000004),
	(300000005, 'Flores-Fisher', 'POS', '91824 Vance Inlet
Serranobury, WY 80566', 'rebecca44@gmail.com', '220-904-6208', 200000005),
	(300000006, 'King, Walters and Saunders', 'PPO', 'Unit 4454 Box 9694
DPO AE 04633', 'amanda66@yahoo.com', '(989)124-1610x209', 200000006),
	(300000007, 'Cervantes, Ward and Wheeler', 'HDHP', '036 Tanya Rue Suite 882
East Timothyfort, RI 32187', 'richardsonisaac@franklin.com', '953-519-9218', 200000007),
	(300000008, 'Hernandez Ltd', 'EPO', '236 Christopher Groves
North Vanessaton, AL 85590', 'jsimmons@martinez-andersen.com', '263-910-5984', 200000008),
	(300000009, 'Eaton Inc', 'EPO', '0260 Rachel Causeway Suite 369
Riverachester, MN 71672', 'kgould@murphy.info', '338.871.3169x8429', 200000009),
	(300000010, 'Cruz-Larson', 'POS', '95633 Davis Hills
New Kimshire, AR 27470', 'walkertimothy@gmail.com', '320.401.4510x691', 200000010),
	(300000011, 'Stevens-Marshall', 'EPO', 'Unit 4825 Box 6576
DPO AP 15742', 'osutton@yahoo.com', '(966)869-5724x25189', 200000011),
	(300000012, 'Rodriguez, Brandt and Miller', 'HSA', '71758 Robert Extension Suite 326
East Brianfurt, MO 93601', 'ckelly@orozco.com', '589-106-1986x323', 200000012),
	(300000013, 'Anderson, Garcia and Solis', 'EPO', '150 Hale Manors
Bryanton, VT 66123', 'canturichard@gmail.com', '(522)295-9164', 200000013),
	(300000014, 'Miller, Pace and Johnson', 'PPO', '5034 Johnson Pass Apt. 124
Wattsmouth, MS 89987', 'michaelwatkins@hotmail.com', '001-358-737-2576x326', 200000014),
	(300000015, 'Black, Hatfield and Castro', 'POS', '77861 Richard Terrace
South Brianna, IL 58181', 'ochoajason@phillips-clark.com', '603.029.4767', 200000015),
	(300000016, 'Contreras Group', 'HDHP', '7397 Lisa Summit Apt. 140
Johnbury, SD 15401', 'emma96@hotmail.com', '909-806-9719x95939', 200000016),
	(300000017, 'Green Inc', 'EPO', '74120 Flores Views Apt. 908
Port Kyle, FL 82674', 'sgrant@gmail.com', '+1-226-463-5537x620', 200000017),
	(300000018, 'Smith-Cole', 'HDHP', '8851 Adam Lodge Suite 712
Lake Michael, RI 78197', 'pittmancatherine@smith.org', '4992083261', 200000018),
	(300000019, 'Miller Group', 'HDHP', '6734 Anthony Hills
Tylerport, SD 36131', 'stephanie66@garcia-anderson.info', '631-541-9454x435', 200000019),
	(300000020, 'Martinez-Grant', 'HDHP', '64055 Clay View Suite 067
Nicoleshire, NE 08816', 'matthew32@yahoo.com', '842.672.9680', 200000020),
	(300000021, 'Cooley, Payne and Wilson', 'HMO', 'PSC 8326, Box 4822
APO AA 48110', 'margaret52@edwards.com', '362-993-9645', 200000021),
	(300000022, 'Walsh, Johnson and Rogers', 'EPO', '73109 Steele Plaza Suite 787
Davisshire, IN 71827', 'lesliewright@stewart.com', '909.134.7102', 200000022),
	(300000023, 'Holt and Sons', 'HMO', 'PSC 8500, Box 4718
APO AA 97963', 'brian40@gomez.com', '+1-178-912-2273x06524', 200000023),
	(300000024, 'Johnson, Chase and Grimes', 'PPO', '8973 Molly Stravenue Apt. 162
South Charlesbury, DE 69085', 'sgonzalez@yahoo.com', '(866)026-0173x834', 200000024),
	(300000025, 'Hogan-Gonzales', 'EPO', '239 George Way
Staceyview, MS 78996', 'kellybass@gmail.com', '029-599-3987', 200000025),
	(300000026, 'Smith LLC', 'EPO', '2982 Walker Prairie
Dennisborough, LA 70131', 'yolandasmith@snyder-love.net', '989.873.9018', 200000026),
	(300000027, 'Moore Group', 'PPO', '473 Rojas Bridge Suite 142
Vickietown, CA 49918', 'scott23@west.com', '001-289-387-3227', 200000027),
	(300000028, 'Adams Ltd', 'HDHP', '4504 Carrillo Ranch Suite 423
Cherylchester, AK 47339', 'bmartin@smith.biz', '+1-368-905-4917x30084', 200000028),
	(300000029, 'Gomez, Miles and Mendoza', 'HSA', '95645 Tracy Throughway Suite 515
Rileymouth, MA 33207', 'barnettbrandi@riley-smith.net', '001-830-070-1028x117', 200000029),
	(300000030, 'Graves Inc', 'HMO', '00217 Huber Parkway Apt. 676
Tranmouth, IL 31797', 'kimmartinez@hotmail.com', '+1-777-516-1855', 200000030),
	(300000031, 'Fisher LLC', 'POS', '7887 Reynolds Terrace
Port Michaelland, NE 42531', 'webermonica@yahoo.com', '+1-229-450-6165x354', 200000031),
	(300000032, 'Graham Inc', 'HSA', '5843 Carey Garden
Brooksland, AL 53750', 'xfisher@gmail.com', '2481540697', 200000032),
	(300000033, 'Mcdaniel, Padilla and Hicks', 'PPO', '506 Williams Roads Suite 387
Gloriabury, VT 69639', 'dreynolds@yahoo.com', '7003974583', 200000033),
	(300000034, 'Merritt-Johnson', 'HMO', '6206 Jason Points
Lake Kimberly, WV 87366', 'ramosmichael@hotmail.com', '810-454-4414', 200000034),
	(300000035, 'Cobb, Cook and Hill', 'HMO', '3478 Jackson Station
Jordanstad, ID 91142', 'michael12@yahoo.com', '001-721-776-2993x2123', 200000035),
	(300000036, 'Cooper Inc', 'EPO', 'Unit 0140 Box 0956
DPO AE 03927', 'tylermurray@hotmail.com', '+1-353-677-6607x84739', 200000036),
	(300000037, 'Harris, Montgomery and Dickerson', 'HMO', '34706 Stephanie Dam
Lucerofort, AL 67732', 'guerrerorebecca@hotmail.com', '031-073-1051x09209', 200000037),
	(300000038, 'Silva-Martin', 'HMO', '886 Tiffany Fort Suite 427
Antoniotown, MI 30833', 'katie39@yahoo.com', '(075)503-6378', 200000038),
	(300000039, 'Rodriguez-Harris', 'HDHP', '60617 Page Wells Suite 640
Petersonmouth, AR 32688', 'jeffrey03@yahoo.com', '827-001-1415x623', 200000039),
	(300000040, 'Montgomery, Boyd and Campbell', 'PPO', 'Unit 3050 Box 6292
DPO AA 18355', 'mosesharry@arias-jones.net', '427.653.8797', 200000040),
	(300000041, 'Contreras, Gamble and Edwards', 'HDHP', '493 Jose Junction
Roberthaven, AK 54919', 'leah20@yahoo.com', '766-043-5147x236', 200000041),
	(300000042, 'Tran and Sons', 'EPO', '89379 Jeffery Harbor Suite 508
Gregoryhaven, CT 69501', 'savagejodi@price-thomas.com', '819-702-6123x2442', 200000042),
	(300000043, 'Herring-Henderson', 'PPO', '20725 Richards Valley Apt. 645
Lake Haley, OH 01626', 'anadavis@gmail.com', '976.188.1339x62563', 200000043),
	(300000044, 'Allen-Wolf', 'POS', '51772 Tran Port
Elliottport, PA 74458', 'rebecca95@yahoo.com', '001-082-322-0608x6794', 200000044),
	(300000045, 'Contreras, Smith and Castro', 'HMO', 'USNV Schneider
FPO AP 13349', 'donald37@williams-hughes.info', '+1-044-673-8871x8618', 200000045),
	(300000046, 'Ellis, Phillips and Martinez', 'HDHP', '1369 Bobby Neck
South Natasha, HI 63922', 'hspencer@lopez-green.com', '087.111.7928', 200000046),
	(300000047, 'Taylor, King and Alvarez', 'HDHP', '956 Long Keys Suite 960
Michaelmouth, UT 98580', 'christinewolfe@gmail.com', '+1-781-846-9121x36053', 200000047),
	(300000048, 'Miller-Mcdonald', 'HMO', '267 Melissa Skyway Suite 849
Michaelmouth, WI 08605', 'peterthomas@medina-ferrell.biz', '001-625-611-2682x363', 200000048),
	(300000049, 'Zamora-Morris', 'PPO', '322 Tiffany Crescent Apt. 018
Lake Elizabethfurt, PA 16146', 'christophersmith@hunter.com', '042-770-1936', 200000049),
	(300000050, 'Baker-Thomas', 'PPO', '5291 Elizabeth Locks
New Oscarport, OH 10669', 'warrenconnor@gmail.com', '808-233-1157', 200000050);
