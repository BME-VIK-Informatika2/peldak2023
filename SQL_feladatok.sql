# A lekérdezések működése
# Descartes szorzat, where, join (Vevo és Megrendeles)

select *
from Vevo V, megrendeles M
where V.id = M.vevoid;

select *
from Vevo V
join megrendeles M
  on V.id = M.vevoid;


# Rendelések és darabszámok

select *
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id;

# Ár kiszámolása (db*egységár)

select mt.MegrendelesId, mt.db, t.ar, t.Nev, mt.db*t.ar AS Osszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id;


# Vevőnkénti összesített ár (GROUP BY)

select v.id, v.nev, m.Id, m.Datum, mt.MegrendelesId, mt.db, t.ar, t.Nev, mt.db*t.ar AS Osszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
join megrendeles M
  on MT.MegrendelesId = M.Id
join vevo V
  on V.id = m.VevoId
where v.id=2;

select v.id, v.nev, m.Id, m.Datum, mt.MegrendelesId, mt.db, t.ar, t.Nev,
    mt.db*t.ar AS Osszeg, SUM( mt.db*t.ar) AS TeljesOsszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
join megrendeles M
  on MT.MegrendelesId = M.Id
join vevo V
  on V.id = m.VevoId
where v.id=2;

select v.id, v.nev, SUM( mt.db*t.ar) AS TeljesOsszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
join megrendeles M
  on MT.MegrendelesId = M.Id
join vevo V
  on V.id = m.VevoId
group by V.id #, v.nev


# ===================== Aggreg

# COUNT: Hány db megrendeléstétel van almára?

select count(*)
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
where T.Nev='alma';

# SUM: Összesen hány termék van a raktárban?

select sum(raktarkeszlet)
from termek;


# ========= SUM/Aggreg, GROUP BY =========
# Mennyiért rendelt Kiss Árpád? (Megrendelésenként külön!)

select v.id, v.nev, M.id, M.Datum, SUM( mt.db*t.ar) AS TeljesOsszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
join megrendeles M
  on MT.MegrendelesId = M.Id
join vevo V
  on V.id = m.VevoId
where V.Nev = 'Kiss Árpád' 
group by M.id;

# Az összes vevőre: mennyiért rendeltek az egyes vevők?
(Már volt)

# Rendezve összeg szerint csökkenő sorrendbe?

select v.id, v.nev, SUM( mt.db*t.ar) AS TeljesOsszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
join megrendeles M
  on MT.MegrendelesId = M.Id
join vevo V
  on V.id = m.VevoId
group by V.id, v.nev
order by TeljesOsszeg desc;

# Kik azok, akik legalább 3000 Ft értékben rendeltek?

select v.id, v.nev, SUM( mt.db*t.ar) AS TeljesOsszeg
from megrendelestetel MT
join termek T
  on MT.TermekId = T.id
join megrendeles M
  on MT.MegrendelesId = M.Id
join vevo V
  on V.id = m.VevoId
group by V.id, v.nev
having TeljesOsszeg>=3000
order by TeljesOsszeg desc

# Minden vevőhöz a legdrágább termék, amit rendelt?

# Veszélyforrás, hibás eredményt ad:
select t.nev, max(t.ar)
from termek T

select t.Nev
from termek t
where t.ar = (select max(ar) from termek);

# ========= SUM, Join, GROUP BY, HAVING =========
# Kik azok, akik legalább 2 eltérő terméket rendeltek?


# ========= Weitere Anfragen =========
# Melyik a legdrágább termék az adatbázisban?


# ==================================================================================================
# Melyek azok a termékpárok, melyek egységárának különbsége < 200 Ft?


# ======== Join, outer join
# Melyek azok a termékek, melyekből van legalább egy rendelés?

# Melyek azok a termékek, melyekhez nincsen egyetlen rendelés sem?



# =========== UPDATE, DELETE

# Akció: Alma -20% (hogyan érdemes tárolni?)

# Elírás javítása (először elrontása...)

# ========== DELETE ==========
# Epret már nem árulunk. Törölhetjük?

# Először töröljük az összes ilyen megrendelést és utána töröljük.
#   JOIN nem lehet delete-ben, kell a termék ID-ja

# =========================== subquery
# (Bevezető) Melyek azok a vevők, akik címében szerepel a "Budapest"?


# Ennek segítségével, mint beágyazott lekérdezéssel:
#   Mely termékeket kell Budapestre szállítani és mennyit?


# Melyik a legdrágább termék?
# (Tipp: subquery-vel le kell kérni a maximális árat, majd megkeresni azt a terméket,
#   melynek ennyi az ára)


# (Ajánló rendszer) Melyek azok a termékek, melyeket együtt vásároltak Almával?
#   Vagyis ugyanaz a vevő a mindkét terméket megrendelte legalább egyszer.

