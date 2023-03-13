# A lekérdezések működése
# Descartes szorzat, where, join (Vevo és Megrendeles)

# Rendelések és darabszámok

# Ár kiszámolása (db*egységár)

# Vevőnkénti összesített ár (GROUP BY)

# ===================== Aggreg

# COUNT: Hány db megrendelés van almára?

# SUM: Összesen hány termék van a raktárban?

# ========= SUM/Aggreg, GROUP BY =========
# Mennyiért rendelt Kiss Árpád?

# Az összes vevőre: mennyiért rendeltek az egyes vevők?

# Rendezve összeg szerint csökkenő sorrendbe?

# Kik azok, akik legalább 3000 Ft értékben rendeltek?

# Minden vevőhöz a legdrágább termék, amit rendelt?


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

