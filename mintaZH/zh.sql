drop schema if exists allatkert;
create schema allatkert;
use allatkert;

create table allat
(
    ID int primary key,
    Nev varchar(50),
    Faj varchar(50)
);

create table gondozo
(
    ID int primary key,
    Nev varchar(50),
    Kor int
);

create table gondozza
(
    AllatID int,
    GondozoID int,
    primary key (AllatID, GondozoID),
    foreign key (AllatID) references allat(ID),
    foreign key (GondozoID) references gondozo(ID)    
);

insert into allat(ID,Nev,Faj) values (1,'Meng', 'panda');
insert into allat(ID,Nev,Faj) values (2,'Glória', 'víziló');
insert into allat(ID,Nev,Faj) values (3,'Bálint', 'víziló');
insert into allat(ID,Nev,Faj) values (4,'Theo', 'zsiráf');

insert into gondozo(ID, Nev, Kor) values (1,'Kis Anna',28);
insert into gondozo(ID, Nev, Kor) values (2,'Közepes Béla',42);
insert into gondozo(ID, Nev, Kor) values (3,'Nagy Cecil',56);

insert into gondozza(AllatID, GondozoID) values (1,1);
insert into gondozza(AllatID, GondozoID) values (2,1);
insert into gondozza(AllatID, GondozoID) values (3,2);
insert into gondozza(AllatID, GondozoID) values (3,3);
insert into gondozza(AllatID, GondozoID) values (4,1);

select A.ID, A.Nev, MIN(G.Kor) as 'minkor'
from allat A
join gondozza H
    on A.ID = H.AllatID
join gondozo G
    on H.GondozoID = G.ID
where A.Faj = 'víziló'
group by A.ID, A.Nev
order by A.Nev;
