

create database Movies

use Movies

create table MovieTable
(MovieID int primary key ,
MovieName varchar(20),
MovieReleaseDate varchar(20))

select *from MovieTable
drop table MovieTable
insert into MovieTable values
(1010,'RadheShyam','11-03-2022'),
(1011,'RRR','15-03-2022'),
(1012,'Bahubali','02-05-2015'),
(1013,'Jathiratnalu','09-02-2021'),
(1014,'Ghani','12-04-2023'),
(1015,'Pushpa','13-11-2021'),
(1016,'Liger','08-05-2024')