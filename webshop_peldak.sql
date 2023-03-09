SELECT * FROM vevo;

select T.Nev AS TermekNev, V.Nev AS VevoNev, MT.db
from Megrendeles M
join megrendelestetel MT
	on M.Id = MT.MegrendelesId
join termek T
	on MT.TermekId=T.Id
join Vevo V
	on V.Id = M.VevoID;

select T.Nev AS TermekNev, V.Nev AS VevoNev, MT.db, T.Ar*MT.db AS Ar
from Megrendeles M
join megrendelestetel MT
	on M.Id = MT.MegrendelesId
join termek T
	on MT.TermekId=T.Id
join Vevo V
	on V.Id = M.VevoID;

select V.Nev AS VevoNev, SUM(T.Ar*MT.db) AS Osszeg
from Megrendeles M
join megrendelestetel MT
	on M.Id = MT.MegrendelesId
join termek T
	on MT.TermekId=T.Id
join Vevo V
	on V.Id = M.VevoID
group by V.Id, V.Nev;
