# ----- További SQL feladatok a demowebshop adatbázisra

 
# --- Kategóriánkénti rendelési adatok (kell kategória tábla és besorolás ('IN' kulcsszó))

# Létrehozás auto_increment nélkül

insert into Kategoria(id,nev) values (1,'Gyümölcs');
insert into Kategoria(id,nev) values (2,'Zoldség');
insert into Kategoria(id,nev) values (3,'Kerti szerszám');

# auto_increment bekapcsolása (nem lehet 0 ID, csak pozitív!)


# Termékhez kategória ID

# Idegen kulcs bekapcsolása


# Eddigi termékek kategorizálása (legyen "besorolatlan" kategória?)


# Egy további termék és rendelés felvétele


# Megrendeles ID honnan lesz? (A MAX() nem biztos, hogy mindig biztonságos megoldás!)


# --- Nézet létrehozása (elnevezési konvenció? Típus a névbe?)



# Lekérdezés: kategóriánként milyen összegben vannak megrendelések?


# --- Kedvezmények adott vevőknek (unique a vevőID? vagy dátum szerint átfedésmentes lehessen?)


# megrendelések összege kedvezménnyel - csak szorzo mutatása


# megrendelések összege kedvezménnyel

