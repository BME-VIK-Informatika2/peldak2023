# ----- További SQL feladatok a demowebshop adatbázisra
 
# --- Kategóriánkénti rendelési adatok (kell kategória tábla és besorolás ('IN' kulcsszó))

# Létrehozás auto_increment nélkül
create table Kategoria
(
    id int primary key,
    nev varchar(30)
);

insert into Kategoria(id,nev) values (1,'Gyümölcs');
insert into Kategoria(id,nev) values (2,'Zoldség');
insert into Kategoria(id,nev) values (3,'Kerti szerszám');

# auto_increment bekapcsolása (nem lehet 0 ID, csak pozitív!)
alter table Kategoria MODIFY column id int auto_increment;

# Termékhez kategória ID
alter table Termek add column KategoriaID int;

# Idegen kulcs bekapcsolása
alter table Termek add constraint foreign key (KategoriaID) references Kategoria(ID);

# Eddigi termékek kategorizálása (legyen "besorolatlan" kategória?)
update termek set KategoriaID=1;

# Egy további termék és rendelés felvétele
insert into Termek(nev, ar, rakterkeszlet, KategoriaID) VALUES ('Ásó',4000,2,3);

# Megrendeles ID honnan lesz? (A MAX() nem biztos, hogy mindig biztonságos megoldás!)
insert into megrendelestetel(megrendelesid, termekid, db) VALUES
    ( 
        (SELECT MAX(ID) from Megrendeles),
        (SELECT ID from Termek where Nev='Ásó'),
        2
    );

update termek set ar=4000 where nev='Ásó'

# --- Nézet létrehozása (elnevezési konvenció? Típus a névbe?)
create view RendelesekView as
select v.id as VevoID, v.nev as VevoNev, t.id as TermekID, t.nev as TermekNev, t.ar as Ar, mt.db as db, t.KategoriaID
from Termek T
join megrendelestetel MT
    on T.ID = MT.termekid
join megrendeles M
    on MT.MegrendelesId = M.id
join vevo v
    on v.id = m.vevoid;

# Lekérdezés: kategóriánként milyen összegben vannak megrendelések?
select K.id, K.nev, SUM(RV.ar * RV.db) as OsszesRendelesErteke
from RendelesekView RV
join kategoria K
	on RV.KategoriaID = K.id
group by K.id, K.nev

# --- Kedvezmények adott vevőknek (unique a vevőID? vagy dátum szerint átfedésmentes lehessen?)
create table kedvezmeny
(
    id int primary key auto_increment,
    vevoid int references Vevo(ID),
    kategoriaid int references Kategoria(ID),
    szorzo float default 1.0
);

insert into kedvezmeny(vevoid,kategoriaid) VALUES
    ( (select id from Vevo where Nev LIKE '%Géza%'), 1, 0.8);

# megrendelések összege kedvezménnyel - csak szorzo mutatása
select RV.VevoID, RV.VevoNev, RV.TermekID, RV.TermekNev, RV.Ar, RV.Db, IFNULL(Kedv.Szorzo,1.0) As SzorzoVagy1
from RendelesekView RV
left outer join kedvezmeny Kedv
	on RV.KategoriaID = Kedv.kategoriaid AND RV.VevoID = Kedv.VevoID;

# megrendelések összege kedvezménnyel
select RV.VevoID, RV.VevoNev, SUM(RV.Ar*RV.Db*IFNULL(Kedv.Szorzo,1.0)) As OsszesenFizetendo
from RendelesekView RV
left outer join kedvezmeny Kedv
	on RV.KategoriaID = Kedv.kategoriaid AND RV.VevoID = Kedv.VevoID
group by RV.VevoID, RV.VevoNev;
# Megjegyzés: RendelesekView nem tartalmaz Megrendeles(ID)-t, így VevoID alapján csoportosítunk...

