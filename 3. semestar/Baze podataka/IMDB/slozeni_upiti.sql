--1. Napišite SQL upit koji će, kao rezultat, ispisati ukupan broj muških,
--odnosno ženskih osoba, čiji su podaci pohranjeni u bazi.

SELECT Osoba.Spol, COUNT(*) AS Broj_osoba
FROM Osoba
GROUP BY Osoba.Spol;



--2. Napišite SQL upit koji će, kao rezultat, ispisati broj naslova, koji se nalaze
--na listi najbolje ocijenjenih, po dekadama.

SELECT (10 * FLOOR(Naslov.Godina_pocetka / 10)) AS Dekada, COUNT(*) AS Broj_naslova
FROM Naslov
GROUP BY Dekada;



--3. Napišite SQL upit koji će, kao rezultat, ispisati prosječnu starost živućih
--osoba, prema njihovim primarnim profesijama. (U obzir se uzimaju samo
--osobe za koje je poznata godina rođenja, a glumci i glumice trebaju se naći
--u istoj skupini/kategoriji.)

SELECT (CASE
  WHEN Osoba.Primarna_profesija = 'actress' 
  THEN 'actor'
  ELSE Osoba.Primarna_profesija 
END) AS Profesija,
AVG(YEAR(CURDATE()) - Osoba.Godina_rodjenja) AS Prosjecna_starost 
FROM Osoba
WHERE Osoba.Godina_rodjenja IS NOT NULL AND Osoba.Godina_smrti IS NULL
GROUP BY Profesija;



--4. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena osoba,
--čija je primarna profesija gluma, a koje su ujedno režiseri nekog od
--najbolje ocijenjenih naslova.

SELECT DISTINCT Osoba.Ime, Osoba.Prezime
FROM Osoba INNER JOIN Rezira ON Osoba.OsobaID = Rezira.ReziserID
WHERE Osoba.Primarna_profesija IN ('actor', 'actress');



--5. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive naslova koji
--imaju prosječnu ocjenu veću od 9.0. Rezultate u ispisu poredajte prema
--godini izlaska, od najstarijih prema onima novijeg datuma.

SELECT Naslov.Naziv
FROM Naslov INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID
WHERE Ocjena.Prosjecna_ocjena >= 9.0
ORDER BY Naslov.Godina_pocetka ASC;



--6. Napišite SQL upit koji će, kao rezultat, ispisati nazive svih TV serija
--('tvSeries') koje se nalaze na listi najbolje ocijenjenih naslova.

SELECT Naslov.Naziv
FROM Naslov INNER JOINVrsta ON Naslov.VrstaID = Vrsta.VrstaID
WHERE Vrsta.Naziv = 'tvSeries';



--7. Napišite SQL upit koji će, kao rezultat, ispisati pune i alternativne
--hrvatske ('hr') nazive najbolje ocijenjenih naslova.

SELECT Naslov.Naziv, Alternaziv.Naziv
FROM Naslov INNER JOIN Odnosi_se ON Naslov.NaslovID = Odnosi_se.NaslovID 
INNER JOIN Alternaziv ON Odnosi_se.AlternazivID = Alternaziv.AlternazivID
WHERE Alternaziv.Jezik = 'hr';



--8. Napišite SQL upit koji će, kao rezultat, ispisati nazive, sezone i redne
--brojeve svih epizoda serije Game of Thrones, koje se nalaze na listi
--najbolje ocijenjenih naslova.

SELECT n.Naziv, Epizoda.Sezona, Epizoda.Redni_broj
FROM Naslov n INNER JOIN Epizoda ON n.NaslovID = Epizoda.EpizodaID 
INNER JOIN Naslov ON Epizoda.SerijaID = Naslov.NaslovID
WHERE Naslov.Naziv = 'Game ofThrones';



--9. Napišite SQL upit koji će, kao rezultat, ispisati naziv vrste kojoj pripada
--naslov najkraćeg (poznatog) trajanja.

SELECT Vrsta.Naziv
FROM Vrsta INNER JOIN Naslov ON Vrsta.VrstaID = Naslov.VrstaID
WHERE Naslov.Trajanje IS NOT NULL
ORDER BY Naslov.Trajanje ASC
LIMIT 1;



--10. Napišite SQL upit koji će, kao rezultat, ispisati puni naziv, godinu izlaska te
--trajanje najnovijeg naslova na listi najbolje ocijenjenih u kojem glumi
--Robert de Niro.

SELECT Naslov.Naziv, Naslov.Godina_pocetka, Naslov.Trajanje
FROM Naslov INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID
INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID
WHERE Osoba.Ime = 'Robert' AND Osoba.Prezime = 'de Niro'
ORDER BY Naslov.Godina_pocetka DESC
LIMIT 1;



--11. Napišite SQL upit koji će, kao rezultat, ispisati ime i prezime najmlađe
--osobe koja je glumila u nekom od najbolje ocijenjenih naslova.

SELECT Osoba.Ime, Osoba.Prezime, (Naslov.Godina_pocetka - Osoba.Godina_rodjenja) AS Dob
FROM Naslov INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID
INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID
WHERE Osoba.Godina_rodjenja IS NOT NULL
ORDER BY Dob ASC
LIMIT 1;



--12. Napišite SQL upit koji će, kao rezultat, ispisati nazive vrsta koje nisu
--zastupljene među naslovima koji se nalaze na listi najbolje ocijenjenih.

SELECT Vrsta.Naziv
FROM Vrsta LEFT JOIN Naslov ON Vrsta.VrstaID = Naslov.VrstaID
WHERE Naslov.VrstaID IS NULL;



--13. Napišite SQL upit koji će, kao rezultat, ispisati naziv vrste te prosječno
--trajanje naslova koji toj vrsti pripadaju.

SELECT Vrsta.Naziv, AVG(Naslov.Trajanje) AS Prosjecno_trajanje
FROM Vrsta INNER JOIN Naslov ON Vrsta.VrstaID = Naslov.VrstaID
GROUP BY Vrsta.VrstaID;



--14. Napišite SQL upit koji će, kao rezultat, ispisati naziv žanra, najmanje
--zastupljenog među naslovima na listi najbolje ocijenjenih.

SELECT Zanr.Naziv, COUNT(*) AS Broj_pojavljivanja
FROM Zanr INNER JOIN Pripada ON Zanr.ZanrID = Pripada.ZanrID
INNER JOIN Naslov ON Pripada.NaslovID = Naslov.NaslovID
GROUP BY Zanr.ZanrID
ORDER BY Broj_pojavljivanja ASC
LIMIT 1;



--15. Napišite SQL upit koji će, kao rezultat, ispisati ime i prezime glumca koji
--se pojavio u najvećem broju filmova na listi najbolje ocijenjenih.

SELECT Osoba.Ime, Osoba.Prezime, COUNT(*) AS Broj_naslova
FROM Naslov INNER JOIN Vrsta ON Naslov.VrstaID = Vrsta.VrstaID
INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID
INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID
WHERE Vrsta.Naziv = 'movie'
GROUP BY Osoba.OsobaID
ORDER BY Broj_naslova DESC
LIMIT 1;



--16. Napišite SQL upit koji će, kao rezultat, ispisati nazive serija koje imaju više
--od 5 epizoda među najbolje ocijenjenim naslovima.

SELECT Naslov.Naziv, COUNT(*) AS Broj_epizoda
FROM Naslov INNER JOIN Epizoda ON Naslov.NaslovID = Epizoda.SerijaID
GROUP BY Epizoda.SerijaID
HAVING Broj_epizoda > 5;



--17. Napišite SQL upit koji će, kao rezultat, ispisati puni naziv te godinu izlaska
--naslova koji ima najviše različitih, alternativnih naziva.

SELECT Naslov.Naziv, Naslov.Godina_pocetka, COUNT(DISTINCT Alternaziv.Naziv) AS Broj_alternativnih_naziva
FROM Naslov INNER JOIN Odnosi_se ON Naslov.NaslovID = Odnosi_se.NaslovID 
INNER JOIN Alternaziv ON Odnosi_se.AlternazivID = Alternaziv.AlternazivID
GROUP BY Naslov.NaslovID
ORDER BY Broj_alternativnih_naziva DESC
LIMIT 1;



--18. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive naslova koji su
--prevedeni na barem još jedan svjetski jezik, izuzev engleskog ('en'),
--francuskog ('fr'), španjolskog ('es') ili njemačkog ('de').

SELECT Naslov.Naziv, COUNT(DISTINCT Alternaziv.Jezik) AS Broj_jezika 
FROM Naslov INNER JOIN Odnosi_se ON Naslov.NaslovID = Odnosi_se.NaslovID 
INNER JOIN Alternaziv ON Odnosi_se.AlternazivID = Alternaziv.AlternazivID
WHERE Alternaziv.Jezik NOT IN ('en', 'fr', 'es', 'de')
GROUP BY Naslov.NaslovID
HAVING Broj_jezika >= 1;



--19. Napišite SQL upit koji će, kao rezultat, ispisati oznaku svjetskog jezika, na
--koji je prevedeno najviše različitih naslova, nakon engleskog ('en'),
--francuskog ('fr'), španjolskog ('es') ili njemačkog ('de').

SELECT Alternaziv.Jezik, COUNT(DISTINCT Odnosi_se.NaslovID) AS Broj_naslova
FROM Alternaziv INNER JOIN Odnosi_se ON Alternaziv.AlternazivID = Odnosi_se.AlternazivID
WHERE Alternaziv.Jezik NOT IN ('en', 'fr', 'es', 'de')
GROUP BY Alternaziv.Jezik
ORDER BY Broj_naslova DESC
LIMIT 1;



--20. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena ženskih
--redateljica koje su režirale više od 3 različitih najbolje ocijenjenih naslova.
--Rezultate u ispisu poredajte prema abecednom redoslijedu prezimena i
--imena.

SELECT Osoba.Ime, Osoba.Prezime, COUNT(DISTINCT Rezira.NaslovID) AS Broj_naslova
FROM Osoba INNER JOIN Rezira ON Osoba.OsobaID = Rezira.ReziserID
WHERE Osoba.Spol = 'F'
GROUP BY Osoba.OsobaID
HAVING Broj_naslova > 3
ORDER BY Osoba.Prezime, Osoba.Ime ASC;