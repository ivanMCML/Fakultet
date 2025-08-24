--1. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena svih
--osoba, čiji su podaci pohranjeni u bazi, koje su rođene iste godine kao i
--Brad Pitt.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba
WHERE Osoba.Godina_rodjenja = (SELECT Osoba.Godina_rodjenja
  FROM Osoba
  WHERE Osoba.Ime = 'Brad' AND Osoba.Prezime = 'Pitt');



--2. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive i godine izlaska
--svih naslova koje je režirao isti režiser kao i film Schindlerova lista
--("Schindler's List").

SELECT Naslov.Naziv, Naslov.Godina_pocetka
FROM Naslov INNER JOIN Rezira ON Naslov.NaslovID = Rezira.NaslovID
WHERE ReziserID = (SELECT Rezira.ReziserID 
  FROM Naslov INNER JOIN Rezira ON Naslov.NaslovID = Rezira.NaslovID
  WHERE Naslov.Naziv = "Schindler's List");



--3. Napišite SQL upit koji će, kao rezultat, ispisati ukupni broj naslova koji su
--izašli u posljednjoj kalendarskoj godini koja se pojavljuje među podacima
--dostupnim u bazi.

SELECT COUNT(Naslov.Naziv) AS Broj_naslova
FROM Naslov
WHERE Naslov.Godina_pocetka = (SELECT MAX(Naslov.Godina_pocetka) 
  FROM Naslov);



--4. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive i godine izlaska
--naslova čije je trajanje dulje od prosječnog trajanja svih naslova koji se
--nalaze na listi najbolje ocijenjenih.

SELECT Naslov.Naziv, Naslov.Godina_pocetka
FROM Naslov
WHERE Naslov.Trajanje > (SELECT AVG(Naslov.Trajanje) FROM Naslov
  WHERE Naslov.Trajanje IS NOT NULL);



--5. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati imena i
--prezimena režisera koji nisu režirali nijedan od najbolje ocijenjenih
--naslova, izašlih u 21. stoljeću.

SELECT DISTINCT p.Ime, p.Prezime
FROM (SELECT Osoba.OsobaID, Osoba.Ime, Osoba.Prezime 
  FROM Osoba INNER JOIN Rezira ON Osoba.Osoba = Rezira.ReziserID) AS p
WHERE p.OsobaID NOT IN (SELECT Rezira.ReziserID FROM Naslov
  INNER JOIN Rezira ON Naslov.NaslovID = Rezira.NaslovID
  WHERE Naslov.Godina_pocetka > 2000);



--6. Korištenjem podupita s predikatom postojanja, napišite SQL upit koji će,
--kao rezultat, ispisati imena i prezimena svih režisera koji su režirali neki
--od najbolje ocijenjenih naslova.

SELECT DISTINCT Osoba.Ime, Osoba.Prezime
FROM Osoba
WHERE EXISTS (SELECT * FROM ReziraWHERE Rezira.ReziserID = Osoba.OsobaID);



--7. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena svih
--ostalih osoba koje su se glumile u istim naslovima kao i Tom Hanks.

SELECT DISTINCT Osoba.Ime, Osoba.Prezime
FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID
WHERE Glumi.NaslovID IN (SELECT Glumi.NaslovID FROM Osoba
  INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID
  WHERE Osoba.Ime = 'Tom' AND Osoba.Prezime = 'Hanks') 
AND Osoba.Ime <> 'Tom' AND Osoba.Prezime <> 'Hanks';



--8. Koristeći isključivo podupite, napišite SQL upit koji će, kao rezultat,
--ispisati naziv serije kojoj pripada epizoda pod nazivom Ozymandias.

SELECT Naslov.Naziv
FROM Naslov
WHERE Naslov.NaslovID IN (SELECT Epizoda.SerijaID FROM Epizoda
  WHERE Epizoda.EpizodaID = (SELECT Naslov.NaslovID FROM Naslov
    WHERE Naslov.Naziv = 'Ozymandias'));



--9. Koristeći isključivo podupite, napišite SQL upit koji će, kao rezultat,
--ispisati imena i prezimena osoba kojima gluma nije primarna profesija, a
--koje su tumačile uloge u više različitih naslova.

SELECT Osoba.Ime, Osoba.Prezime FROM Osoba
WHERE Osoba.Primarna_profesija NOT IN ('actor', 'actress') 
AND Osoba.OsobaID IN (SELECT Glumi.GlumacID FROM Glumi
  GROUP BY Glumi.GlumacID HAVING COUNT(DISTINCT Glumi.NaslovID) > 1);



--10. Koristeći isključivo podupite, napišite SQL upit koji će, kao rezultat,
--ispisati nazive svih najbolje ocijenjenih naslova u kojima je glumio Robert
--de Niro.

SELECT Naslov.Naziv
FROM Naslov
WHERE Naslov.NaslovID IN (SELECT Glumi.NaslovID FROM Glumi 
  WHERE Glumi.GlumacID = (SELECT Osoba.OsobaID FROM Osoba 
    WHERE Osoba.Ime = 'Robert' AND Osoba.Prezime = 'de Niro'));



--11. Koristeći isključivo podupite, napišite SQL upit koji će, kao rezultat,
--ispisati nazive svih naslova koji su izašli iste godine kada i naslov s
--najvećom prosječnom ocjenom među onima zastupljenim u bazi.

SELECT Naslov.Naziv 
FROM Naslov 
WHERE Naslov.Godina_pocetka = (SELECT Naslov.Godina_pocetka FROM Naslov
  WHERE Naslov.NaslovID = (SELECT Ocjena.NaslovID FROM Ocjena 
    WHERE Ocjena.Prosjecna_ocjena = (SELECT MAX(Ocjena.Prosjecna_ocjena)
      FROM Ocjena)));



--12. Napišite SQL upit koji će, kao rezultat, ispisati nazive svih naslova ostalih
--zastupljenih vrsta, koji imaju veću prosječnu ocjenu od najbolje
--ocijenjenog filma ('movie').

SELECT Naslov.Naziv, Vrsta.Naziv
FROM Naslov INNER JOIN Vrsta ON Naslov.VrstaID = Vrsta.VrstaID
INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID
WHERE Vrsta.Naziv <> 'movie' 
AND Ocjena.Prosjecna_ocjena > (SELECT MAX(Ocjena.Prosjecna_ocjena) 
  FROM Naslov INNER JOIN Vrsta ON Naslov.VrstaID = Vrsta.VrstaID 
  INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID
  WHERE Vrsta.Naziv = 'movie');



--13. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati naziv
--naslova s najmlađom glumačkom postavom.

SELECT Naslov.Naziv FROM Naslov INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID 
INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID
GROUP BY Naslov.NaslovID 
HAVING AVG(Naslov.Godina_pocetka - Osoba.Godina_rodjenja) = (SELECT MIN(p.Dob) 
  FROM (SELECT Naslov.NaslovID, AVG(Naslov.Godina_pocetka - Osoba.Godina_rodjenja) AS Dob 
    FROM Naslov INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID 
    INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID 
    GROUP BY Naslov.NaslovID) AS p);



--14. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati naziv
--najpopularnijeg žanra, mjereno prema broju glasova korisnika IMDB
--sustava.

SELECT Zanr.Naziv 
FROM Zanr INNER JOIN Pripada ON Zanr. ZanrID = Pripada.ZanrID 
INNER JOIN Ocjena ON Pripada.NaslovID = Ocjena.NaslovID 
GROUP BY Zanr.ZanrID
HAVING SUM(Ocjena.Broj_glasova) = (SELECT MAX(p.Ukupno_glasova)
  FROM (SELECT Zanr.Naziv, SUM(Ocjena.Broj_glasova) AS Ukupno_glasova 
    FROM Zanr INNER JOIN Pripada ON Zanr. ZanrID = Pripada.ZanrID 
    INNER JOIN Ocjena ON Pripada.NaslovID = Ocjena.NaslovID 
    GROUP BY Zanr.ZanrID) AS p);



--15. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati naziv i
--godinu izlaska naslova u kojem glumi najmanje osoba kojima gluma nije
--primarna profesija.

SELECT Naslov.Naziv, Naslov.Godina_pocetka 
FROM Naslov INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID 
INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID
WHERE Osoba.Primarna_profesija NOT IN ('actor', 'actress') 
GROUP BY Naslov.NaslovID 
HAVING COUNT(*) = (SELECT MIN(p.Broj_osoba) 
  FROM (SELECT Naslov.NaslovID, COUNT(*) AS Broj_osoba 
    FROM Naslov INNER JOIN Glumi ON Naslov.NaslovID = Glumi.NaslovID 
    INNER JOIN Osoba ON Glumi.GlumacID = Osoba.OsobaID
    WHERE Osoba.Primarna_profesija NOT IN ('actor', 'actress') 
    GROUP BY Naslov.NaslovID) AS p);



--16. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati nazive
--svih naslova koji nisu izvorno na engleskom jeziku.

SELECT n.Naziv 
FROM Naslov n 
WHERE EXISTS (SELECT * 
  FROM (SELECT DISTINCT Naslov.NaslovID, Alternaziv.Naziv 
    FROM Naslov INNER JOIN Odnosi_se ON Naslov.NaslovID = Odnosi_se.NaslovID
    INNER JOIN Alternaziv ON Odnosi_se.AlternazivID = Alternaziv.AlternazivID
    WHERE Alternaziv.Jezik = 'en') AS p
  WHERE n.NaslovID = p.NaslovID AND n.Naziv <> p.Naziv);



--17. Napišite SQL upit koji će, kao rezultat, ispisati nazive naslova s najvišim
--prosječnim ocjenama po pojedinim žanrovima.

SELECT Zanr.Naziv, Naslov.Naziv 
FROM Zanr INNER JOIN Pripada ON Zanr.ZanrID = Pripada.ZanrID 
INNER JOIN Naslov ON Pripada.NaslovID = Naslov.NaslovID 
INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID
WHERE EXISTS (SELECT * 
  FROM (SELECT Zanr.ZanrID, MAX(Ocjena.Prosjecna_ocjena) AS Max_ocjena
    FROM Zanr INNER JOIN Pripada ON Zanr.ZanrID = Pripada.ZanrID
    INNER JOIN Ocjena ON Pripada.NaslovID = Ocjena.NaslovID 
    GROUP BY Zanr.ZanrID) AS p 
  WHERE Zanr.ZanrID = p.ZanrID 
  AND Ocjena.Prosjecna_ocjena = p.Max_ocjena);



--18. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena osoba
--koje su glumile samo u TV serijama, ali ne i u nekom od filmskih naslova,
--zastupljenim u bazi. Rezultate u ispisu poredajte prema abecednom
--redoslijedu prezimena i imena.

SELECT DISTINCT p.Ime, p.Prezime 
FROM (SELECT Osoba.OsobaID, Osoba.Ime, Osoba.Prezime 
  FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID 
  INNER JOIN Naslov ON Glumi.NaslovID = Naslov.NaslovID 
  INNER JOIN Vrsta ON Naslov.VrstaID = Vrsta.VrstaID
  WHERE Vrsta.Naziv = 'tvSeries') AS p 
WHERE p.OsobaID NOT IN (SELECT DISTINCT Osoba.OsobaID 
  FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID 
  INNER JOIN Naslov ON Glumi.NaslovID = Naslov.NaslovID 
  INNER JOIN Vrsta ON Naslov.VrstaID = Vrsta.VrstaID
  WHERE Vrsta.Naziv = 'movie') 
ORDER BY p.Prezime, p.Ime ASC;