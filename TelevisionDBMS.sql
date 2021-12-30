drop database if exists TelevisionStations_65012023;

create database TelevisionStations_65012023;

use TelevisionStations_65012023;

-- Strong entities

create table television_stations(
tvstation_id int auto_increment,
tvstation_name varchar(30),
founding_year year,
location varchar(20),
ownership_type enum('private ','public'),
viewtype enum('Pay to view','Free to view'),
ceo_name  varchar(40),
email varchar(30),
contact varchar(15),
primary key(tvstation_id)

);

-- index
create  index tv on television_stations(tvstation_name);

insert into television_stations (tvstation_name,founding_year,location,ownership_type,viewtype,ceo_name,email,contact )
values
("Atinka Tv",'2005', "Kumasi", "Private", "Pay to view", "Linda Arthur","atinkatv@gmail,com","0241111111"),
("United Television",'2001', "Accra", "Private", "Free to view", "Cynthia Prempeh","Utv@gmail,com","0242222222"),
("Wontumi Tv",'2013', "Kumasi", "Private", "Pay to view", "Eric Gazdi","wontumitv@gmail,com","0243333333"),
("GTV", '1957',"Accra", "Public", "Free to view", "Ghana Broadcasting coperation","gtv@gmail,com","0244444444"),
("Sagani TV",'1999', "Tamale", "Public", "Free to view", "Ghana Broadcasting coperation","sagani@gmail,com","0245555555"),
("Mighty TV",'2014', "Tamale", "Private", "Free to view", "Ernest Kwame Obeng","mighty@gmail,com","0246666666");


create table Persons(
person_id varchar(20),
fname varchar(20),
lname varchar(20),
contact varchar(15),
email   varchar(40),
primary key(person_id)

);
create  index namesindex on Persons(fname,lname,contact);
insert into Persons
values
-- caller
("P1","Raymond","Essuman","0242953261","raymondessuman1@gmail.com"),
("P2","Sebastian","Owusu","0241111161","sebastian45@gmail.com"),
("P3","Briendel","Wool","0241153261","woolbreindel5@gmail.com"),
("P4","Rory","Baaba","0242951161","rorybaaba8@gmail.com"),
("P5","Celestine","Asamoah","0242953211","Celestineasamoah45@gmail.com"),

-- Producer
("P6","Angela","Osei","0242223261","OeiAngella@gmail.com"),
("P7","Fadda","Dickson","0242222261","fadda1@gmail.com"),
("P8","Kwame","Nkrumah","0242333361","snkrumahkwame3@gmail.com"),
("P9","Oswald","Arthur","0244444261","owaldarthur5@gmail.com"),
("P10","Nana Aba","Anamoah","0242555561","nanaabaanamoah45@gmail.com"),
("P11","Anderline","Nzube","0242923221","Nzubeanderline66@gmail.com"),

-- Presenter
("P12","Natalie","Forts","0242953221","fort206@gmail.com"),
("P13","Serwaa","Armnihere","0242222221","armnihere15serwaa@gmail.com"),
("P14","Kwame","Nyamkye","0242954441","Kwamenyame44@gmail.com"),
("P15","Ama","Mcbrown","0242953556","mcbrowname55@gmail.com"),
("P16","Abeiku","Santana","0542953556","satanaA55@gmail.com"),
("P17","Besty","Malm","0242922221","malmBesty5@gmail.com");


create table Producer(
producer_id varchar(20),
salary decimal(10,2),
dob  date,
email varchar(30),
tvstation_id int,
primary key(producer_id),
foreign key(producer_id) references Persons (person_id),
foreign key(tvstation_id) references television_stations(tvstation_id)
);

insert into Producer
values
("P6",12000.00,'1995-02-02',"malmB@gmail,com",1),
("P7",7000.00,'1985-01-12',"malmB@gmail,com",2),
("P8",8000.00,'1983-12-30',"malmB@gmail,com",3),
("P9",9000.00,'1989-07-27',"malmB@gmail,com",4),
("P10",10000.00,'1997-05-06',"malmB@gmail,com",5),
("P11",11000.00,'1973-04-08',"malmB@gmail,com",6);



create table Sponsors(
sponsor_id varchar(20),
sponsor_name varchar(30),
sponsor_type enum('Individual','Company'),
sponsor_contact  varchar(15),
sponsor_email varchar(40),
sponsor_address varchar(30),
primary key (sponsor_id)

);
create  index sponsindex on Sponsors(sponsor_name,sponsor_type,sponsor_address);
insert into Sponsors
values
("SP1", "Adonkor Bitters",'Company',"0554000000","adonkorgroupcompanies@gmail.com","Accra"),
("SP2", "Mrs Osei Akoto",'Individual',"0254000000","oseis4akoto@gmail.com","Kumasi"),
("SP3", "MTN Ghana",'Company',"0552000000","mtnghana@gmail","Accra"),
("SP4", "Mrs Linda Essuman",'Individual',"0542000000","lindaessuman55@gmail.com","Tamale"),
("SP5", "MiceTech",'Company',"0545000000","micetech@gmail.com","Accra");



create table Programs(
program_id varchar(20),
program_name varchar(40),
program_time   varchar(10),
program_daysshowed varchar(50),
program_duration  char(12),
tvstation_id int,
producer_id varchar(20),
sponsor_id varchar(20),
primary key(program_id),
foreign key(tvstation_id) references television_stations(tvstation_id),
foreign key(producer_id) references Producer(producer_id),
foreign key(sponsor_id) references Sponsors(sponsor_id) on delete cascade
);
create  index progindex on Programs(program_name,program_daysshowed,program_time  );
insert into Programs
values


-- News
("PR1","atinkanewgh","6am","Mondays to Sundays","2hours",1,"P6","SP1"),
("PR2","UTVnew","6pm","Mondays to Sundays","1:30mins",2,"P7","SP1"),
("PR3","Wontuminew1","8pm","Mondays to Sundays","1hours",3,"P8","SP2"),
("PR4","GTVnews","12pm","Mondays to Sundays","3hours",4,"P9","SP2"),
("PR5","SaganiNews","3pm","Mondays to Sundays","1:40mins",5,"P10","SP3"),
("PR6","MighttvNews1","6am","Mondays to Sundays","2hours",6,"P11","SP3"),



-- Movies 
("PR7","The heiress","8am","Mondays to Fridays","2hours",1,"P7","SP4"),
("PR8","Boys abr3","7pm","Mondays","2hours",2,"P8","SP4"),
("PR9","ChandraNandini","10am","Sundays","2hours",3,"P9","SP5"),
("PR10","Abrab)","1pm","Mondays to Tuesdays","2hours",4,"P10","SP5"),
("PR11","The Generals Daugther","2pm","Mondays and Wednesday","2hours",5,"P6","SP5"),
("PR12","The good Son","10pm","Mondays and Sundays","2hours",6,"P11","SP5"),





-- Reality Shows
("PR13","My health my life","7pm"," Wednesday","2hours",1,"P8","SP4"),
("PR14","united showbiz","7:30pm","Saturdays","2hours",6,"P9","SP1"),
("PR15","Atuu","3pm","Mondays","2hours",4,"P10","SP3"),
("PR16","Heritage Africa","4pm","Thursdays","2hours",2,"P6","SP2"),
("PR17","Talented Kids","9pm","Sundays","2hours",5,"P7","SP2"),
("PR18","Data rush","10pm","Sundays","2hours",3,"P11","SP3");



create table Advertisments(
advert_id varchar(20),
advert_cost decimal(10,2),
advert_type enum('Goods','Services'),
advertNumberTimes int,
advert_duration char(7),
tvstation_id int,
sponsor_id varchar(20),
primary key(advert_id),
foreign key(tvstation_id) references television_stations(tvstation_id),
foreign key(sponsor_id) references Sponsors(sponsor_id) on delete set null
);
insert into  Advertisments
values
("ADV1",12000.00, 'Goods',1,"3mins",1,"SP1"),
("ADV2",245600.00, 'Goods',4,"2mins",2,"SP2"),
("ADV3",238900, 'Services',2,"3mins",3,"SP3"),
("ADV4",34700.00, 'Services',3,"6mins",4,"SP4"),
("ADV5",45000.00, 'Goods',5,"1mins",5,"SP5"),
("ADV6",67800.00, 'Services',1,"5mins",6,"SP1");


create table Social_media_platform(
platform_id varchar(20),
platform_name varchar(20),
numberoffollwers int,
primary key(platform_id)
);
create  index mediaindex on Social_media_platform(platform_name);
insert into Social_media_platform
values
("SM1","Twitter",300000),
("SM2","Facebook",900000),
("SM3","Insatgram",700000),
("SM4","Whatsapp",900),
("SM5","Reddit",40000),
("SM6","Quora",50000)
;

-- Derived tables






create table News(
news_id varchar(20),
news_status enum('Live','Recorded'),
news_segements varchar(20),
primary key(news_id),
foreign key(news_id) references Programs(program_id) on delete cascade
);


insert into News
values
("PR1", 'Live', "Politics"),
("PR2", 'Live', "Business"),
("PR3", 'Recorded', "Sports"),
("PR4", 'Recorded', "Entertainment"),
("PR5", 'Live', "Health"),
("PR6", 'Recorded', "Food");



create table Movies(
movie_id varchar(20),
director varchar(40),
movie_type enum('Series','Onetimehits'),
country_filmed varchar(30), 
year_release year,
datashowed   date,
primary key(movie_id),
foreign key(movie_id) references Programs (program_id)
);
create  index moveindex on Movies(director,country_filmed,year_release);


insert into Movies
values
("PR7","Jackson k Bentum",'Series',"Ghana",'2019','2020-01-12'),
("PR8","David Dontor",'Onetimehits',"Ghana",'1995','2001-05-10'),
("PR9","Tracy Boakye",'Series',"India",'2005','2020-06-22'),
("PR10","Nana Ama Mcbrown",'Onetimehits',"Ghana",'2001','2016-07-30'),
("PR11","Kofi Adu",'Series',"Mexico",'2015','2019-03-02'),
("PR12","Emelia Wool",'Onetimehits',"Ghana",'2017','2018-08-15');







create table Reality_Shows(
realityshow_id varchar(20),
numberOfparticipant  int,
showgenre   varchar(25),
datestarted  date,
primary key(realityshow_id)

);

create  index realindex on Reality_Shows(showgenre,datestarted);
insert into Reality_Shows
values
("PR13",2,"Health",'2020-01-01'),
("PR14",5,"Entertainment",'2019-01-01'),
("PR15",2,"Celebrity life",'2018-01-01'),
("PR16",2,"Education",'2017-01-01'),
("PR17",3,"Kids show",'2016-01-01'),
("PR18",5,"Relationhips",'2015-01-01');



create table  Presenters(
presenter_id varchar(20),
dob date,
salary decimal(10,2),
news_id varchar(20),
realityshow_id varchar(20),
primary key(presenter_id),
foreign key(presenter_id) references Persons (person_id) on delete cascade,
foreign key(realityshow_id) references Reality_Shows(realityshow_id) on delete set null,
foreign key(news_id) references News(news_id) on delete set null
);

insert into Presenters
values
("P12",'1985-01-01',6000.00,"PR1","PR13"),
("P13",'1985-01-01',9000.00,"PR2","PR14"),
("P14",'1985-01-01',8000.00,"PR3","PR15"),
("P15",'1985-01-01',11000.00,"PR4","PR16"),
("P16",'1985-01-01',12000.00,"PR5","PR17"),
("P17",'1985-01-01',4000.00,"PR6","PR18");


create table Public_viewer(
publicviewer_id varchar(20),
location varchar(40),
age int,
primary key(publicviewer_id),
foreign key(publicviewer_id) references Persons (person_id) on delete cascade

);
create  index publicindex on Public_viewer(location);
insert into Public_viewer
values
("P1","New legon,Accra", 24),
("P2","Ayigya,Kumasi", 34),
("P3","Ejisu,Kumasi", 44),
("P4","Madina,Accra", 21),
("P5","Kasoa,Tamale", 18)
;




-- Decomposed tables 
create table television_advertisment(
advert_id varchar(20),
tvstation_id int,
foreign key(advert_id) references Advertisments (advert_id),
foreign key(tvstation_id) references television_stations(tvstation_id)

);

insert into television_advertisment
values
("ADV1",1),
("ADV2",2),
("ADV3",3),
("ADV4",4),
("ADV5",5),
("ADV1",6),
("ADV2",1),
("ADV3",2),
("ADV4",3),
("ADV5",4);







create table sponsor_programs(
program_id varchar(20),
sponsor_id varchar(20),
foreign key(sponsor_id) references Sponsors(sponsor_id),
foreign key(program_id) references Programs(program_id)

);

insert into sponsor_programs
values
("PR1","SP1"),
("PR2","SP2"),
("PR3","SP3"),
("PR4","SP4"),
("PR5","SP5"),
("PR6","SP1"),
("PR7","SP2"),
("PR8","SP3"),
("PR9","SP4"),
("PR10","SP5");


create table televisionstation_programs(
program_id varchar(20),
tvstation_id int,
foreign key(program_id) references Programs(program_id) on delete set null,
foreign key(tvstation_id) references television_stations(tvstation_id) 

);
insert into televisionstation_programs
values
("PR1",1),
("PR2",2),
("PR3",3),
("PR4",4),
("PR5",5),
("PR6",1),
("PR7",2),
("PR8",3),
("PR9",4),
("PR10",5);


-- Relationship table
create table Rating_Comments(
comments varchar(70),
numberofstar  int ,
platform_id varchar(20),
publicviewer_id varchar(20),
program_id varchar(20),
tvstation_id int,
primary key(platform_id,publicviewer_id,program_id),
foreign key(platform_id) references Social_media_platform(platform_id) ,
foreign key(publicviewer_id) references Public_viewer(publicviewer_id) ,
foreign key(program_id) references Programs (program_id)on delete cascade,
foreign key(tvstation_id) references television_stations(tvstation_id) 

);

create  index ratesindex on Rating_Comments(comments,numberofstar);
insert into Rating_Comments
values
("Love the show",3,"SM1","P1","PR1",1),
("sad",2,"SM2","P2","PR2",2),
("Awesome",4,"SM3","P3","PR3",3),
("Feeling it here",5,"SM4","P4","PR1",4),
("waste of time",1,"SM5","P5","PR1",5),
("underrated cast",5,"SM6","P1","PR6",6),
("sharp camera work",5,"SM1","P1","PR7",1),
("Not recommeded",1,"SM2","P2","PR8",3),
("Highly Recommeded",5,"SM3","P3","PR9",2),
("overrated cast",4,"SM4","P4","PR10",4),
("Poor editing",0,"SM5","P5","PR11",5),
("Monam))bl33",3,"SM6","P2","PR12",6),
("Lov",3,"SM1","P3","PR13",1),
("so slow paced",3,"SM2","P4","PR14",4),
("Informative",5,"SM3","P5","PR15",5),
("Wow African nice history",4,"SM4","P2","PR16",6),
("going crazy",4,"SM5","P3","PR17",2),
("can't stop watching",5,"SM6","P4","PR18",3),
("Boring",1,"SM5","P5","PR15",4);

 
 
 
 
 -- Queries
 
 -- 1•	Display the total income Television stations gain from advertisements.
 select sum(advert_cost)  as "Total Advert Income" from Advertisments;
 
 -- •	2.Display producers of programs, the program they produce, and the television they work at.
 select distinct Persons.fname as "Producer 1stname",Persons.lname "Producers Surname",
 Programs.program_name as "Programs",television_stations.tvstation_name as "TV Stations"
 from Persons 
 inner join Producer
 on Persons.person_id=Producer.producer_id
 inner join Programs
 on Producer.producer_id=Programs.producer_id
 inner join television_stations
 on television_stations.tvstation_id=Programs.tvstation_id group by Programs.program_name ;
 
 
 -- •	3.Most rated program above 2 stars and the comment by a public viewer the location and television station.
 select Rating_Comments.comments as "Comments",Rating_Comments.numberofstar as "Rates",
 Programs.program_name as "Programs",Public_viewer.location "Viewer location",
 Persons.fname as "Viewr name",Social_media_platform.platform_name as "Media platform" 
 from Rating_Comments
 inner join Public_viewer
 on Rating_Comments.publicviewer_id=Public_viewer.publicviewer_id
 inner join Persons
 on Persons.person_id=Public_viewer.publicviewer_id
 inner join Programs
 on Rating_Comments.program_id=Programs.program_id
 inner join Social_media_platform
 on Social_media_platform.platform_id=Rating_Comments.platform_id
 where Rating_Comments.numberofstar>3 ;
 
 -- •	4.Display the lists of local movies(Ghanaian) shown by a television station and their directors date 
 select Programs.program_name as "Local Movies",Movies.director as "Directors",
 Movies.year_release as "Year Released",television_stations.tvstation_name as "Tv Station"
 from Movies
 join Programs
 on Programs.program_id=Movies.movie_id
 join television_stations
 on television_stations.tvstation_id=Programs.tvstation_id
 where Movies.country_filmed in ("Ghana")  ;
 
 -- •	5 Display the various reality shows by the different television stations with their presenter days and time
 select Programs.program_name as "Programs",Persons.fname as "Presenter 1stname",
 Persons.lname as "Presenter Surnmae",television_stations.tvstation_name as "TV stations",
 Reality_Shows.showgenre as " Show Genre", Programs.program_time "Time" ,
 Programs.program_daysshowed "Show Days" 
 from Persons
 inner join Presenters
 on  Persons.person_id=Presenters.presenter_id
 inner join Reality_Shows
 on Reality_Shows.realityshow_id=Presenters.realityshow_id
 inner join Programs
 on Programs.program_id=Reality_Shows.realityshow_id
 inner join television_stations
 on television_stations.tvstation_id=Programs.tvstation_id;
 
 -- •	6.The television station with the most number rating ( much public concentration).
 -- television station rate 
   select  television_stations.tvstation_name as "Tv Station" ,
   count( Rating_Comments.numberofstar) as "Rates Counts"
   from  Rating_Comments 
   inner join television_stations
   on television_stations.tvstation_id=Rating_Comments.tvstation_id
   group by television_stations.tvstation_name ;
   
   

 
 -- •	7.The sponsor of a program its sponsor(location, contacts) and the television stations
 
 select  Programs.program_name "Programs",Sponsors.sponsor_name as "Sponsors",
 Sponsors.sponsor_address "Sponsor Adress"
 from Sponsors 
 inner join Programs 
 on Sponsors.sponsor_id=Programs.sponsor_id
 where Sponsors.sponsor_address in ("kumasi","Accra") group by Programs.program_name ;
 
 
 
 
 