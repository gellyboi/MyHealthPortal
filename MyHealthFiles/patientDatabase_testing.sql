
CREATE TABLE IF NOT EXISTS `Patients`(
	PatientID int NOT NULL,
	Name varchar(48),
	SSN varchar(11) NOT  NULL,
	DOB varchar(10),
	PhoneNum varchar(30),
	Email varchar(48),
	Address varchar(128),
	PRIMARY KEY (PatientID)
);


CREATE TABLE IF NOT EXISTS `Doctors`(
	DocID int,
	Name varchar(48),
	DOB varchar(10),
	Email varchar(48),
	PhoneNum varchar(30),
	PRIMARY KEY (DocID)
);

CREATE TABLE IF NOT EXISTS `InsProviders`(
	PlanID int,
	CompanyName varchar(32),
	Category varchar(32),
	Address varchar(127),
	email varchar(48),
	PhoneNum varchar(20),
	FOREIGN KEY (PlanID) REFERENCES InsPlans(PlanID)
);

CREATE TABLE IF NOT EXISTS `InsPlans`(
	PlanID int,
	AnnualDeductible float(9,2),
	AnnualPremium float(9,2),
	AnnualCoverageLimit float(9,2),
	LifetimeCoverage float(9,2),
	InsCompany varchar(32),
	PRIMARY KEY(PlanID)
);


INSERT INTO `Patients` (`PatientID`, `Name`, `SSN`, `DOB`, `PhoneNum`, `Email`, `Address`)
VALUES 
	(1, 'Monique Landry', '616-44-3940', '1952-08-13', '(617)230-5045', 'ljensen@merritt.com', '1422 Cynthia Isle Apt. 505
West Judithbury, NY 83343'),
	(2, 'Paula Mitchell', '176-97-9547', '1932-10-03', '001-484-019-1447x7142', 'williamsonkristi@yahoo.com', '3394 James Way
North Jennifer, NY 67589'),
	(3, 'Linda Ryan', '365-34-3899', '2020-04-05', '0256880348', 'ejacobson@sawyer.biz', '6212 Mitchell Meadows
Elliottfurt, NE 32232'),
	(4, 'Lauren Smith', '209-39-0536', '1994-11-18', '+1-313-486-7452x3760', 'mooneystacie@gmail.com', '0919 Benjamin Shore Apt. 944
South Jennifer, IL 15283'),
	(5, 'Linda Smith', '043-78-5174', '1910-11-06', '(145)556-1498', 'williamsnicholas@grant-martinez.com', 'Unit 5523 Box 3502
DPO AP 41261'),
	(6, 'Charles Klein', '853-54-6386', '1939-04-04', '+1-501-068-7973x814', 'riley94@gmail.com', '0596 Jenna Run Apt. 776
New Wesley, OK 40891'),
	(7, 'Joseph Deleon', '007-31-8235', '1938-11-23', '595.279.4894', 'jeffreycohen@gmail.com', '9242 Zachary Shore Apt. 062
Patelmouth, NV 65930'),
	(8, 'Julia Tapia', '560-66-6478', '1941-05-27', '542.686.9246', 'santossarah@gmail.com', '017 Katherine Plaza Suite 422
Lake David, TN 48764'),
	(9, 'Charles Patel', '433-11-3933', '1926-06-28', '780-528-8993', 'wolfelauren@gmail.com', '286 Watts Streets Suite 864
Rebeccatown, ME 14992'),
	(10, 'Dr. Melissa Meadows', '472-67-1271', '1906-10-04', '(497)696-7094x4969', 'nhicks@yahoo.com', '837 Hughes Mountain
North Jesse, NC 61751'),
	(11, 'Michelle Johnston', '782-28-8862', '2017-08-16', '679.503.2150x8174', 'josephdean@hudson.com', '717 Webb Station
Pughstad, FL 31761'),
	(12, 'Amy Wilson', '156-79-9723', '1934-09-14', '829.045.9093', 'michael71@yahoo.com', '9376 Craig Forest
West Jessicachester, CT 28192'),
	(13, 'Jessica Bauer', '002-98-7173', '1932-12-23', '(762)394-2566x94022', 'brownphilip@gmail.com', '145 Brian Spurs Apt. 214
Lake Edward, NV 28888'),
	(14, 'Scott Rice', '311-36-5549', '1914-12-25', '950-923-5868', 'wpowell@west.com', 'Unit 8127 Box 9702
DPO AA 24601'),
	(15, 'Emma Williams', '294-08-3090', '1936-02-17', '001-866-812-7186x75681', 'robin45@yahoo.com', '698 Karen Courts Suite 433
New Edwardville, KY 80088'),
	(16, 'Nicole Allen', '244-64-4731', '1949-05-03', '+1-572-530-9130x3870', 'jbass@yahoo.com', '280 Barbara Canyon
Woodsport, TX 09709'),
	(17, 'Tonya Anderson', '792-17-0234', '1912-06-20', '(838)971-6965x7679', 'brobbins@hotmail.com', '9721 Rios Turnpike Apt. 186
East Raymond, ND 44034'),
	(18, 'Amy Gray', '792-85-4768', '1932-01-17', '050.999.4586', 'amanda51@phillips-simmons.com', '4973 Coleman Landing Suite 320
Lake Michelle, MN 66003'),
	(19, 'Tracy Simpson', '594-32-8993', '1924-08-30', '208-667-3016x5870', 'ethan72@wyatt.com', '870 Joseph Expressway Suite 028
South Jesus, NY 21653'),
	(20, 'Daniel Frederick', '019-06-2087', '2013-07-14', '(403)097-9439', 'wallertanner@yahoo.com', '08920 Hughes Plain Suite 964
West Kaylaview, NV 00595'),
	(21, 'William Austin', '717-18-7351', '2003-05-14', '001-077-692-6919x374', 'maynardpaul@brown.com', '918 Julie Drives
Kevinville, TN 92794'),
	(22, 'Danielle Larson', '391-65-3323', '1987-10-02', '318-109-0540x593', 'felicia24@hotmail.com', 'Unit 9564 Box 8648
DPO AP 60056'),
	(23, 'Mrs. Kim Barber', '338-02-0192', '1996-10-20', '077-581-9800', 'dmurphy@benson-shepherd.info', '10775 Matthew Place
East Tonymouth, IN 95748'),
	(24, 'Jamie Kennedy', '152-84-0545', '1933-06-23', '001-409-645-8945x827', 'diazdeborah@perez-cox.com', '237 Kelsey Greens
North Tyler, SD 36952'),
	(25, 'Kristen Byrd', '162-59-5531', '1957-11-30', '001-954-890-0040', 'coxlisa@yahoo.com', '0022 Matthews Route
East Robinmouth, WV 39458'),
	(26, 'Stephanie Clarke', '152-97-9091', '1935-06-03', '463.485.0396', 'qrodriguez@hall-hart.net', '44837 Mark Terrace
South Jason, NC 09268'),
	(27, 'Stacy Foster', '787-58-6665', '1994-07-13', '(567)884-8816', 'sherrihampton@yahoo.com', '70569 Tiffany Lock Suite 948
Klinestad, DC 00912'),
	(28, 'William Williams', '626-48-6459', '1970-03-11', '723.850.8377x02245', 'morganmartha@harmon-beck.com', '0400 Payne Mill
Deborahville, NE 52193'),
	(29, 'Beth Hardy', '546-86-5736', '1970-07-15', '(911)239-4808', 'gabrieljackson@yahoo.com', '1395 Fletcher Street
North Markborough, AZ 03276'),
	(30, 'Ronald Long', '424-96-1439', '1906-11-16', '(021)644-4930x395', 'mileskevin@romero-leach.com', '53247 Olivia Islands
Adamshaven, OH 43097'),
	(31, 'Vanessa Cruz', '202-58-1354', '1945-10-09', '581-456-5877x1620', 'qsmith@webb.com', '332 Heather Valleys Suite 655
Port Elizabeth, WY 24959'),
	(32, 'Carolyn Mcfarland', '583-54-8441', '1935-03-28', '+1-985-349-4213x1374', 'brianmarshall@ferguson.com', '5373 Fuentes Landing
Crawfordside, LA 72236'),
	(33, 'Amanda Williams', '091-94-1893', '1982-08-30', '+1-652-557-5517x614', 'torreslaura@ferguson.com', '167 Fred Rest
Joneschester, OH 34219'),
	(34, 'Mark Smith', '408-95-5012', '1940-07-18', '(546)075-3699', 'ashleystark@yahoo.com', '67942 Lopez Hill
Sarahland, WY 62877'),
	(35, 'Paula Lynn', '107-19-7171', '1959-06-23', '001-748-547-3295x8018', 'victor48@maxwell-stephens.org', '1510 Aaron Street Suite 373
East Evelyn, WA 73661'),
	(36, 'Leslie Johnson', '031-18-0236', '1992-11-28', '+1-170-225-5618x07290', 'brooksmichelle@hotmail.com', '219 Rivas Expressway Suite 484
South Christinaside, AR 52905'),
	(37, 'Jaime Mosley', '376-57-8957', '1906-05-02', '(581)052-6936x9851', 'mcdanielryan@yahoo.com', '508 Arnold Ramp
Lake Wesley, MN 40383'),
	(38, 'Christopher Robinson', '431-42-6991', '1942-12-28', '729-684-7013x839', 'orrwilliam@bailey-elliott.com', '091 Patterson Via
Port Andrewside, RI 72511'),
	(39, 'Glenn Russell', '179-96-2387', '2006-12-26', '840-009-8215x097', 'jennifermeza@barnes-lang.info', 'USNS Salazar
FPO AE 16838'),
	(40, 'Alexander Stevens', '188-23-8150', '1965-12-15', '440-145-1303x7380', 'deantiffany@hotmail.com', '77424 Horn Track
Lake Darrell, NJ 27711'),
	(41, 'Martin Jones', '008-29-0829', '1992-11-18', '(891)195-4143x3942', 'mcdanielrebecca@robinson.com', '01660 Dodson Spring
Cynthiafurt, NM 82355'),
	(42, 'Mallory Henry', '408-18-9307', '1967-10-13', '358-849-3195x368', 'jonathan99@hotmail.com', '6222 Salazar Way
West Danielside, NC 71234'),
	(43, 'David Johnson', '639-44-3138', '1984-01-06', '(755)412-9371x3810', 'brenda94@hotmail.com', 'USS Chapman
FPO AA 50431'),
	(44, 'Christopher Reese', '154-66-6525', '1918-05-24', '001-495-551-3537', 'simpsonnatalie@bennett.com', 'Unit 7847 Box 8899
DPO AA 96929'),
	(45, 'Gabriel Harrison', '020-06-3426', '1960-09-20', '001-269-308-3900x592', 'jamesallen@yahoo.com', '6883 Leah Stream
Juliemouth, NY 20219'),
	(46, 'John Cooper', '737-75-5159', '1966-11-04', '0108295688', 'michaelvincent@gmail.com', '2122 Melissa Expressway Apt. 883
Markville, OH 74022'),
	(47, 'Aaron Reyes', '551-82-5746', '2019-05-20', '667.918.4903x5391', 'liantonio@hubbard-hernandez.com', '355 Garcia Hollow Suite 748
Kellymouth, VT 85150'),
	(48, 'Alexandria Sanchez', '326-80-2275', '1957-04-06', '762-143-9981x4113', 'msoto@hotmail.com', '325 Moody Bridge
Jonestown, CO 41589'),
	(49, 'Catherine Shaw', '169-24-3256', '1915-10-10', '001-600-984-5073x728', 'mpaul@davis-shannon.org', '4911 Torres Island Suite 518
Claymouth, IA 16205'),
	(50, 'Darryl Forbes', '342-54-1535', '1933-09-19', '+1-814-631-5121x074', 'sheilaarmstrong@smith.org', '878 Gordon Forge
Mannmouth, AL 32679');


INSERT INTO `Doctors` (`DocID`, `Name`, `DOB`, `Email`, `PhoneNum`)
VALUES 
	(1147483646, 'Janice Rice', '2015-11-23', 'owang@gmail.com', '901.487.3888x6080'),
	(1147483645, 'Joseph Brown', '1978-06-18', 'melissa64@soto.com', '(667)028-5463x96836'),
	(1147483644, 'Phillip Nguyen', '1991-08-16', 'lucasdaisy@nolan-love.org', '078-287-4898x6074'),
	(1147483643, 'Christopher Russell', '2004-08-18', 'hobbscarolyn@yahoo.com', '001-638-733-5246x5521'),
	(1147483642, 'Jose Jones', '1984-12-12', 'ramirezsteven@hotmail.com', '0434482374'),
	(1147483641, 'Eric Mills', '2002-06-09', 'amanda69@waters.com', '643.551.4694'),
	(1147483640, 'Janet Henderson', '1974-06-28', 'daniel09@wise-martin.com', '+1-129-612-4718x8112'),
	(1147483639, 'Anita Turner', '1983-03-03', 'kevin51@hotmail.com', '(252)316-7911'),
	(1147483638, 'Kimberly Wilson MD', '2021-02-08', 'christopherlin@jenkins.info', '717-097-6446x5033'),
	(1147483637, 'Laura Palmer', '1998-01-25', 'thomas09@cooper-davis.com', '(659)926-7796x15478'),
	(1147483636, 'Heather Gomez', '1980-12-02', 'yolandacontreras@gmail.com', '001-383-118-1888x36594'),
	(1147483635, 'Brian Patterson', '2018-09-16', 'meyerschristopher@hotmail.com', '282-852-4009x46767'),
	(1147483634, 'Vanessa Hall', '1980-02-21', 'carrie16@yahoo.com', '173.248.9957x0628'),
	(1147483633, 'Mark Wilson', '1975-09-28', 'brittany76@sexton-ford.org', '(505)786-1870x46798'),
	(1147483632, 'Erik Lowe', '1976-02-09', 'hernandezlaura@hamilton-gardner.com', '001-933-537-6371x25765'),
	(1147483631, 'Renee Mccall', '2016-07-27', 'pamelagomez@gmail.com', '787.136.4005x85514'),
	(1147483630, 'Mark Parker', '2007-05-15', 'pamela92@shields-sherman.com', '6605711924'),
	(1147483629, 'Emily Bridges', '2007-09-15', 'williammcdonald@cunningham.com', '281.018.4002'),
	(1147483628, 'Melissa Hudson', '1988-10-22', 'sean60@yahoo.com', '462.979.8030'),
	(1147483627, 'Melissa Huang', '2015-07-28', 'smithjohn@elliott.com', '001-133-688-0913x7724'),
	(1147483626, 'Shari Wilson', '1993-03-15', 'christopher86@mitchell.com', '4548735857'),
	(1147483625, 'Austin Green', '1978-11-02', 'rodriguezshirley@white-velasquez.info', '6684870346'),
	(1147483624, 'Ann Banks', '1987-10-22', 'ruizwilliam@hotmail.com', '388.382.9712x9079'),
	(1147483623, 'Keith Carter', '2011-12-02', 'robertbrown@yahoo.com', '001-802-230-4645'),
	(1147483622, 'Mary Hoffman', '1983-05-12', 'sanchezjeffrey@hotmail.com', '333-093-8837x594'),
	(1147483621, 'Rachel Castillo', '1985-08-02', 'rebecca75@hotmail.com', '529-629-6204x12148'),
	(1147483620, 'Seth Ellis', '1972-05-08', 'angela29@smith-lewis.biz', '001-416-412-5529x3042'),
	(1147483619, 'Mr. Charles Carter', '1983-07-02', 'jesse49@riggs.com', '437.626.5672x5065'),
	(1147483618, 'Paul Wallace', '2010-03-26', 'sullivansteven@hotmail.com', '+1-153-512-9317x49807'),
	(1147483617, 'Nicholas Hill', '1975-02-14', 'fpatterson@yahoo.com', '001-610-141-0578x006'),
	(1147483616, 'Steven Miller', '2014-04-30', 'rollinsamanda@gmail.com', '(915)525-2267x89695'),
	(1147483615, 'Gloria Lin', '1989-06-01', 'wbrown@clark.com', '+1-248-815-7631x3133'),
	(1147483614, 'Vanessa Perez', '2018-12-03', 'comptonkaitlin@hotmail.com', '113.316.5318x3957'),
	(1147483613, 'Sarah Robinson', '2003-10-09', 'wardsarah@erickson-adams.com', '(393)539-1775x81340'),
	(1147483612, 'Joyce Matthews', '1978-02-10', 'joshuashaw@garrett.com', '036.706.1976x0144'),
	(1147483611, 'Jeffrey Rojas', '1980-11-08', 'tkelly@yahoo.com', '040.840.6536'),
	(1147483610, 'Johnathan Bowers', '2017-04-17', 'hchang@hotmail.com', '324.949.9983'),
	(1147483609, 'Lindsey Byrd', '1989-02-10', 'fcrane@yahoo.com', '001-073-339-7423x928'),
	(1147483608, 'Heather Taylor', '1973-11-02', 'nmckinney@sanchez.info', '864-126-7827'),
	(1147483607, 'Alicia Gordon', '2008-05-24', 'robert25@yahoo.com', '+1-387-010-3971x24381'),
	(1147483606, 'Bobby Willis', '2011-01-13', 'eblankenship@hotmail.com', '246.929.9311'),
	(1147483605, 'Eric Bennett', '1992-04-03', 'richard12@peterson.com', '9964789116'),
	(1147483604, 'Jane Johnson', '1992-04-20', 'kristenthomas@rogers.org', '(240)296-1633'),
	(1147483603, 'Jessica Dunn', '1978-03-15', 'william91@gmail.com', '(872)491-8407'),
	(1147483602, 'Donald Cohen', '2000-05-19', 'snewman@yahoo.com', '078-247-0213x3929'),
	(1147483601, 'Andrea Carr', '2007-12-01', 'jacquelinecastillo@hotmail.com', '(044)975-1573'),
	(1147483600, 'Shannon Dawson', '1994-02-19', 'qhuffman@robles.com', '(225)723-9940'),
	(1147483599, 'Gregory Conway', '1976-05-19', 'micheal57@yahoo.com', '+1-347-754-0402'),
	(1147483598, 'Amy Jackson', '2005-11-25', 'lbaker@mitchell.com', '+1-806-897-4453x6588'),
	(1147483597, 'Danielle Powell', '2017-10-04', 'callahanstephen@santana.com', '001-967-864-4014x0551');