--database creation

CREATE TABLE Series (
 Series_ID VARCHAR(3) NOT NULL PRIMARY KEY,
 Series_Name VARCHAR(30) NOT NULL
);

CREATE TABLE Genre (
Genre_ID INT NOT NULL PRIMARY KEY,
 Genre_Name VARCHAR(30) NOT NULL
);

CREATE TABLE Purchase (
 Purchase_ID VARCHAR(4) NOT NULL PRIMARY KEY,
 Purchase_Name VARCHAR(50) NOT NULL,
 Purchase_Link VARCHAR(100) NOT NULL
);

CREATE TABLE Books (
 Book_ID INT NOT NULL PRIMARY KEY,
 Title VARCHAR(100) NOT NULL,
 Pub_Date DATE NOT NULL,
 Genre_ID INT NOT NULL,
 Series_ID VARCHAR(3) NOT NULL,
 Purchase_ID VARCHAR(4) NOT NULL,
 FOREIGN KEY (Genre_ID) REFERENCES genre(Genre_ID),
 FOREIGN KEY (Series_ID) REFERENCES series(Series_ID),
 FOREIGN KEY (Purchase_ID) REFERENCES purchase(Purchase_ID)
);

CREATE TABLE BookReviews (
 Review_ID VARCHAR(4) NOT NULL PRIMARY KEY,
 Book_ID INT NOT NULL,
 Rating DECIMAL(4,3) DEFAULT NULL,
 Comment VARCHAR(1000) DEFAULT NULL,
 FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID)
);

CREATE TABLE Achievements (
 Achievement_ID VARCHAR(4) NOT NULL PRIMARY KEY,
 Achievement_Name VARCHAR(100) NOT NULL,
 Year YEAR(4) DEFAULT NULL,
 Description VARCHAR(1000) DEFAULT NULL,
 Book_ID INT NOT NULL,
 FOREIGN KEY (book_ID) REFERENCES books(book_ID)
);

create table customerInfo(
 user_name varchar(15) NOT NULL,
 user_email varchar(30) NOT NULL PRIMARY KEY,
 favourite_series_ID varchar(3) NOT NULL,
 favourite_book_ID int(11) NOT NULL,
 user_password varchar(30) NOT NULL;
 FOREIGN KEY(favourite_series_ID) REFERENCES series(Series_ID),
 FOREIGN KEY(favourite_book_ID) REFERENCES books(Book_ID)
);
--data population

--GENRE TABLE
insert into genre values(001,'Science Fiction');
insert into genre values(002,'Thriller');
insert into genre values(003,'Suspense');
insert into genre values(004,'Dystopian Fiction');
insert into genre values(005,'Adventure Fiction');
insert into genre values(006,'War Story');
insert into genre values(007,'Romance');
insert into genre values(008,'Young Adult');
insert into genre values(009,'Apocalyptic fiction');
insert into genre values(010,'Fantasy');
insert into genre values(011,'Historical Fiction');
insert into genre values(012,'Mystery');
insert into genre values(013,'Urban Fantasy');
insert into genre values(014,'Non-Fiction');
insert into genre values(015,'Fiction');
insert into genre values(016,'Drama');
insert into genre values(017,'Autobiography');
insert into genre values(018,'Horror');
insert into genre values (019, 'Childrens Literature');
insert into genre value(20, 'Picture Book');
insert into genre value(21, 'FolkTale');

--SERIES TABLE:

Insert into series(Series_ID,Series_Name) values ('S01', 'Hunger Games');
Insert into series(Series_ID,Series_Name)  values ('S02', 'The Underland Chronicles');
Insert into series(Series_ID,Series_Name)  values ('S03', 'Standalone Books');
Insert into series(Series_ID,Series_Name)  values ('S04', 'Future series1');
Insert into series(Series_ID,Series_Name)  values ('S05', 'Future series2');

--Purchase table:

insert into purchase values('P01','Hunger Games','https://rhea164.github.io/f27wd/hungergames.html');
insert into purchase values('P02','Catching Fire','https://rhea164.github.io/f27wd/catchingfire.html');
insert into purchase values('P03','Mockingjay','https://rhea164.github.io/f27wd/mockingjay.html');
insert into purchase values('P04','Ballards of songbirds and snakes','https://rhea164.github.io/f27wd/theballad.html');
insert into purchase values('P05','The Overlander','https://rhea164.github.io/f27wd/theoverlander.html');
insert into purchase values('P06','The Prophecy of Bane','https://rhea164.github.io/f27wd/theprophecyofbane.html');
insert into purchase values('P07','The Curse of the Warmbloods','https://rhea164.github.io/f27wd/thecurseofthewarmbloods.html');
insert into purchase values('P08','The Marks of Secret','https://rhea164.github.io/f27wd/themarksofsecrets.html');
insert into purchase values('P09','The Code of claw','https://rhea164.github.io/f27wd/thecodeofclaw.html');
insert into purchase values('P10','The Year of the Jungle','https://rhea164.github.io/f27wd/yearofthejungle.html');
insert into purchase values('P11','When Charlie McButton Lost Power','https://rhea164.github.io/f27wd/whencharliemcbuttonlostpower.html');




--Books Table
insert into books values(101,'Hunger games','2008/09/14',1,'S01','P01');
insert into books values(102,'Catching Fire','2009/09/01',2,'S01','P02');
insert into books values(103,'Mockingjay','2010/11/12',5,'S01','P03');
insert into books values(104,'Ballards of songbirds and snakes','2020/05/19',4,'S01','P04');
insert into books values(105,'The Overlander','2003/09/01',10,'S02','P05');
insert into books values(106,'The Prophecy of Bane','2003/09/01',15,'S02','P06');
insert into books values(107,'The Curse of the Warmbloods ','2004/09/01',9,'S02','P07');
insert into books values(108,'Marks of Secret','2006/05/01',6,'S02','P08');
insert into books values(109,'The Code of Claw ','2007/04/03',16,'S02','P09');
insert into books values(110,'Year of The Jungle','2013/08/17',20,'S03','P10');
insert into books values(111,'When Charlie McButton lost Power ','2005/09/01',19,'S03','P11');

--Reviews Table

insert into BookReviews values('R001',101,4.34,'"...a superb tale of physical adventure, political suspense, and romance." -Booklist, STARRED REVIEW');
insert into BookReviews values('R002',101,4.33,'"...brilliantly plotted and perfectly paced...a futuristic novel every bit as good and as allegorically rich as Scott Westerfeld''s ''Uglies'' books."-The New York Times, John Green');
insert into BookReviews values('R003',102,4.08,'"...every bit as original and thought provoking, as The Hunger Games. Wow."
-Los Angeles Times');
insert into BookReviews values('R004',102,4.05,'"Suspenseful... Collins'' fans, grown-ups included, will race to the end."
--USA Today' );
insert into BookReviews values('R005',103,4.11,'“...doesn’t disappoint when it segues into the pulse-pounding action readers have come to expect.”
--Publishers Weekly, STARRED REVIEW' );
insert into BookReviews values('R006',103,4.02 ,'"Collins has done that rare thing. She has written a sequel that improves upon the first book."
--The New York Times, Gabrielle Zevin');
insert into BookReviews values('R007',104,3.95 ,'"...a cautionary tale...The twists and heartbreaks captivate despite tragic inevitabilities."
--Kirkus Reviews, STARRED REVIEW');
insert into BookReviews values('R008',104,3.85 ,'"The Ballad of Songbirds and Snakes...confirms Collins as a master of dystopian YA, able to spin engaging tales around deeply flawed characters and societies."
--New York Journal of Books' );
insert into BookReviews values('R009',105,4.49,'“...readers will likely find [the Underland] to be a fantastically engaging place.”
--Publishers Weekly, STARRED REVIEW' );
insert into BookReviews values('R010',105,4.37 ,'"This is an engrossing adventure for fantasy fans and for those new to the genre."
--School Library Journal');
insert into BookReviews values('R011',106,4.21,'"Along with many Underlanders [rats notwithstanding], Gregor''s fans will cheer the promise of future visits."
--The Horn Book Magazine' );
insert into BookReviews values('R012',106,4.19,'"...fans will not be disappointed with this exciting, action-packed sequel, whose ending suggests more adventures to come."--Booklist');
insert into BookReviews values('R013',107,4.23,'“...immensely readable installment..."
--The Horn Book Magazine ' );
insert into BookReviews values('R014',107,4.17,'"The addition of the mother adds a fresh dynamic to the fast-paced, suspenseful story. Fans of the series will enjoy this latest, skillfully told adventure."
--Booklist');
insert into BookReviews values('R015',108,4.01,'"...will leave readers gasping..."
--Kirkus Reviews, STARRED REVIEW' );
insert into BookReviews values('R016',108,4.10 ,'"Fans will be panting for this next installment that follows Gregor and the Curse of the Warm Bloods."
--VOYA' );
insert into BookReviews values('R017',109,3.89,'"...excellent acquisition for any library."
--VOYA' );  
insert into BookReviews values('R018',109,4.00,'“...outstanding, riveting Gregor fantasy."
--Midwest Book Review' );
insert into BookReviews values('R019',110,4.95,'"Important and necessary."
--Kirkus Reviews, STARRED REVIEW');
insert into BookReviews values('R020',110,4.65 ,'"...a haunting autobiographical children''s book about having a loved one go off to war."
--The Boston Globe');
insert into BookReviews values('R021',111,3.7,'"A clever, humorous story in rhyme."
--School Library Journal' );
insert into BookReviews values('R022',111,3.9 ,'“Deftly written by Suzanne Collins and nicely illustrated by Mike Lester, When Charlie McButton Lost Power is refreshingly original and moving!"
--Midwest Book Review');

--query to display the table in clean format ; SELECT Review_ID, Book_ID, Rating, LEFT(comment, 10) AS truncated_comment FROM BookReviews;

--Achievements table

insert into Achievements values('A01','BARNES & NOBLE',2020,'BEST YA SCIENCE FICTION AND FANTASY BOOK',104);
insert into Achievements values('A02','AMAZON',2020,'BEST SCIENCE FICTION AND FANTASY BOOK',104);
insert into Achievements values('A03','NEW YORK TIMES EDITORS'' CHOICE',NULL, NULL,104);
insert into Achievements values('A04','WATERSTONES BEST BOOKS',2020,'SCIENCE FICTION & FANTASY',104);
insert into Achievements values('A05','COSMOPOLITAN''S 20 BEST YA BOOKS',2020,NULL,104);
insert into Achievements values('A06','TODAY''S BEST YA BOOKS',2020, NULL,104);
insert into Achievements values('A07','KIDS'' BOOK CHOICE AWARDS FINALIST',2021,'BEST FANTASY WORLD BUILDER',104);
insert into Achievements values('A08','Andre Norton Award-finalist',2011,'Scholastic Press; Scholastic UK',103);
insert into Achievements values('A09','Bram Stoker Awards',13,'by Gary Ross,SC & Billy Ray',101);
insert into Achievements values('A10','Ray Bradbury Award',2013,'by GaryRoss, director; Gary Ross, SC & Billy Ray, writers',101);
insert into Achievements values('A11','Geffen Awards',2021,'winner',104);
insert into Achievements values('A12','Geffen Awards',2013,'Young Adult Science Fiction or fantasy book — winner',103);
insert into Achievements values('A13','Geffen Awards',12,'Science Fiction book - winner',102);
insert into Achievements values('A14','Geffen Awards',11,'Science Fiction book - winner',101);

--customerInfo table

insert into customerInfo values('matthew','matthew1@gmail.com','S01',102,'mat1234');
insert into customerInfo values('john','john123@gmail.com','S01',103,'johncool');
insert into customerInfo values('mridul','m55@gmail.com','S02',104,'mridulbye');

--2.2 queries

SELECT * from books ORDER BY Pub_Date ASC;
SELECT * from achievements ORDER BY Year;
SELECT * from genre LIMIT 5;
SELECT * from series LIMIT 3;
SELECT B.Book_ID, B.Title, A.Achievement_Name FROM books B JOIN achievements A ON B.Book_ID = A.Book_ID;
SELECT B.Book_ID, B.Title, AVG(Rating) FROM books B, bookreviews WHERE B.Book_ID=bookreviews.Book_ID GROUP BY B.Title;
SELECT Title from Books WHERE Book_ID IN (select DISTINCT(Book_ID) from Achievements);
SELECT Book_ID, COUNT(Book_ID) AS 'No. of Awards', Achievement_Name from achievements GROUP BY Book_ID;
SELECT AVG(Rating) from bookreviews;
SELECT AVG(r.Rating), b.Book_ID, b.Title FROM bookreviews AS r JOIN Books AS b ON r.Book_ID = b.Book_ID GROUP BY b.Book_ID HAVING AVG(r.Rating) >= 4;
SELECT Rating, Book_ID from bookreviews HAVING Rating<4;















 