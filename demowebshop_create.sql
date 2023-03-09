drop schema if exists demowebshop;
create schema demowebshop CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
use demowebshop;

DROP TABLE IF EXISTS MegrendelesTetel;
DROP TABLE IF EXISTS Megrendeles;
DROP TABLE IF EXISTS Vevo;
DROP TABLE IF EXISTS Termek;
DROP VIEW IF EXISTS Pestiek;
DROP VIEW IF EXISTS BestTermek;

CREATE TABLE Termek (
  Id int PRIMARY KEY AUTO_INCREMENT,
  Nev varchar(50) NOT NULL,
  Raktarkeszlet int NOT NULL DEFAULT 50,
  Ar int
);

CREATE TABLE Vevo (
  Id int PRIMARY KEY AUTO_INCREMENT,
  Nev varchar(50) NOT NULL,
  Cim varchar(100),
  Telefon varchar(20)
);

CREATE TABLE Megrendeles(
  Id int PRIMARY KEY AUTO_INCREMENT,
  VevoId int not null,
  Datum datetime,
  CONSTRAINT FK_M_V FOREIGN KEY (VevoId) REFERENCES Vevo(Id)
);

CREATE TABLE MegrendelesTetel(
 TermekId int NOT NULL,
 MegrendelesId int NOT NULL,
 db int NOT NULL,
 PRIMARY KEY(TermekId, MegrendelesId),
 CONSTRAINT FK_MT_T FOREIGN KEY (TermekId) REFERENCES Termek(Id),
 CONSTRAINT FK_MT_M FOREIGN KEY (MegrendelesId) REFERENCES Megrendeles(Id)
);

-- Termékek
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Alma', 150, 400);
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Körte', 120, 800);
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Eper', 100, 2000);
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Szőlő', 110, 1600);
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Banán', 200, 700);
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Narancs', 220, 800);
INSERT INTO Termek (Nev, Raktarkeszlet, Ar) VALUES ('Kivi', 0, NULL);

-- Vásárlók
INSERT INTO Vevo (Nev, Cim, Telefon) VALUES('Kiss Árpád', '1111 Budapest Egy u 3', NULL);
INSERT INTO Vevo (Nev, Cim, Telefon) VALUES('Nagy Géza', '5000 Szolnok Fa u 4', '209874562');
INSERT INTO Vevo (Nev, Cim, Telefon) VALUES('Kovács Ágnes', NULL, '701234567');
INSERT INTO Vevo (Nev, Cim, Telefon) VALUES('Tóth István', '9000 Gyor To u 6', '305555555');

-- Megrendelések
INSERT INTO Megrendeles(VevoId, Datum) VALUES (2, '2023-01-01');
INSERT INTO Megrendeles(VevoId, Datum) VALUES (1, '2023-02-02');
INSERT INTO Megrendeles(VevoId, Datum) VALUES (1, '2023-03-03');
INSERT INTO Megrendeles(VevoId, Datum) VALUES (3, '2022-04-04');
INSERT INTO Megrendeles(VevoId, Datum) VALUES (2, '2022-05-05');
INSERT INTO Megrendeles(VevoId, Datum) VALUES (2, curdate());

INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (1, 1, 5);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (2, 1, 4);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (3, 1, 6);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (1, 2, 5);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (4, 2, 10);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (3, 3, 2);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (1, 3, 3);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (2, 3, 8);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (3, 4, 1);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (3, 5, 7);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (4, 5, 2);
INSERT INTO MegrendelesTetel (TermekId, MegrendelesId, db) VALUES (1, 6, 4);
