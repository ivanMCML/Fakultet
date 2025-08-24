--1. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena svih
--osoba koje imaju dva imena.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba
WHERE Osoba.Ime LIKE '% %';



--2. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive svih naslova na
--listi najbolje ocijenjenih koje su režirale sestre Lilly i Lana Wachowski.

SELECT Naslov.Naziv
FROM Naslov INNER JOIN Rezira ON Naslov.NaslovID = Rezira.NaslovID
INNER JOIN Osoba ON Rezira.ReziserID = Osoba.OsobaID
WHERE Osoba.Ime IN ('Lilly', 'Lana') AND Osoba.Prezime = 'Wachowski';



--3. Napišite SQL upit koji će, kao rezultat, ispisati nazive žanrova u koje se
--svrstava film Coco.

SELECT Zanr.Naziv
FROM Zanr INNER JOIN Pripada ON Zanr.ZanrID = Pripada.ZanrID
INNER JOIN Naslov ON Pripada.NaslovID = Naslov.NaslovID
WHERE Naslov.Naziv = 'Coco';



--4. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena tzv.
--dječjih zvijezda, odnosno osoba koje su ostvarile uloge u nekom od
--najbolje ocijenjenih naslova prije svog 14. rođendana.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID
INNER JOIN Naslov ON Glumi.NaslovID = Naslov.NaslovID
WHERE (Naslov.Godina_pocetka - Osoba.Godina_rodjenja) < 14;



--5. Napišite SQL upit koji će, kao rezultat, prikazati izvještaj o broju naslova
--po pojedinim vrstama. Ispis, uz traženi podatak o broju naslova, treba
--sadržavati puni naziv vrste.

SELECT Vrsta.Naziv, COUNT(*) AS Broj_naslova
FROM Vrsta INNER JOIN Naslov ON Vrsta.VrstaID = Naslov.VrstaID
GROUP BY Vrsta.VrstaID;



--6. Napišite SQL upit koji će, kao rezultat, ispisati naziv serije, redni broj
--sezone te broj epizoda iz spomenute sezone koje se nalaze na listi
--najbolje ocijenjenih naslova. Rezultate u ispisu poredajte broju epizoda, od
--najvišeg prema najmanjem.

SELECT Naslov.Naziv, Epizoda.Sezona, COUNT(*) AS Broj_epizoda
FROM Naslov INNER JOIN Epizoda ON Naslov.NaslovID = Epizoda.SerijaID
GROUP BY Naslov.Naziv, Epizoda.Sezona
ORDER BY Broj_naslova DESC;



--7. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive svih naslova
--koji su prevedeni na 10 ili više različitih svjetskih jezika, ne računajući
--engleski ('en'), francuski ('fr'), španjolski ('es’) i njemački ('de').

SELECT Naslov.Naziv, COUNT(*) AS Broj_jezika
FROM Naslov INNER JOIN Odnosi_se ON Naslov.NaslovID = Odnosi_se.NaslovID 
INNER JOIN Alternaziv ON Odnosi_se.AlternazivID = Alternaziv.AlternazivID
WHERE Alternaziv.Jezik NOT IN ('en', 'fr', 'es', 'de')
GROUP BY Naslov.NaslovID
HAVING COUNT(DISTINCT Alternaziv.Jezik) >= 10;



--8. Napišite SQL upit koji će, kao rezultat, ispisati ime i prezime najstarije
--osobe koja je režirala neki od najbolje ocijenjenih naslova. Ispis, uz traženi
--podatak o najstarijem režiseru, treba sadržavati i naziv naslova kojeg je
--režirao/režirala.

SELECT Osoba.Ime, Osoba.Prezime, Naslov.Naziv 
FROM Osoba INNER JOIN Rezira ON Osoba.OsobaID = Rezira.ReziserID 
INNER JOIN Naslov ON Rezira.NaslovID = Naslov.NaslovID
WHERE (Naslov.Godina_pocetka - Osoba.Godina_rodjenja) = (SELECT
  MAX(Naslov.Godina_pocetka - Osoba.Godina_rodjenja) 
  FROM Osoba INNER JOIN Rezira ON Osoba.OsobaID = Rezira.ReziserID 
  INNER JOIN Naslov ON Rezira.NaslovID = Naslov.NaslovID);



--9. Napišite korelirani SQL upit koji će, kao rezultat, ispisati pune nazive i
--godine izlaska najstarijih naslova po pojedinim vrstama.

SELECT n.Naziv, n.Godina_pocetka 
FROM Naslov AS n
WHERE n.Godina_pocetka = (SELECT MIN(Naslov.Godina_pocetka)
  FROM Naslov 
  WHERE n.VrstaID = Naslov.VrstaID);



--10. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena osoba
--koje su glumile u naslovima različitih vrsta.

SELECT Osoba.Ime, Osoba.Prezime, COUNT(DISTINCT Naslov.VrstaID)
FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID 
INNER JOIN Naslov ON Glumi.NaslovID = Naslov.NaslovID
GROUP BY Osoba.OsobaID
HAVING COUNT(DISTINCT Naslov.VrstaID) >= 2;



--11. Prethodni zadatak riješite korištenjem podupita.

SELECT p.Ime, p.Prezime, COUNT(DISTINCT p. VrstaID)
FROM (SELECT Osoba.OsobaID, Osoba.Ime, Osoba.Prezime, Naslov.VrstaID 
  FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID 
  INNER JOIN Naslov ON Glumi.NaslovID = Naslov.NaslovID) AS p
GROUP BY p.OsobaID
HAVING COUNT(DISTINCT p. VrstaID) >= 2;



--12. Napišite SQL upit koji će, kao rezultat, ispisati naziv primarne profesije
--kojom se ne bavi nijedna ženska osoba od onih čiji se podaci nalaze u bazi.
--(U ispisu glumci i glumice predstavljaju istu primarnu profesiju.)

SELECT DISTINCT Osoba.Primarna_Profesija 
FROM Osoba
WHERE Osoba.Primarna_profesija <> 'actor' 
AND Osoba.Primarna_profesija NOT IN (SELECT Osoba.Primarna_profesija
  FROM Osoba WHERE Osoba.Spol = 'F');


--13. Napišite SQL upit koji će, kao rezultat, ispisati ime i prezime režisera koji
--je režirao naslov s najvišom prosječnom ocjenom među onima
--zastupljenim u bazi. Rezultat, uz ime i prezime režisera, treba sadržavati i
--puni naziv naslova.

SELECT Naslov.Naziv, Osoba.Ime, Osoba.Prezime 
FROM Naslov INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID
INNER JOIN Rezira ON Naslov.NaslovID = Rezira.NaslovID 
INNER JOIN Osoba ON Rezira.ReziserID = Osoba.OsobaID
WHERE Ocjena.Prosjecna_ocjena = (SELECT MAX(Ocjena.Prosjecna_ocjena) 
  FROM Ocjena);



--14. Napišite SQL upit koji će, kao rezultat, ispisati popis osoba koje su se
--odigrale uloge pojavile u svim dijelovima serijala Gospodar prstenova
--('The Lord of the Rings'), koji se nalaze među najbolje ocijenjenim
--naslovima.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba INNER JOIN Glumi ON Osoba.OsobaID = Glumi.GlumacID 
INNER JOIN Naslov ON Glumi.NaslovID = Naslov.NaslovID
WHERE Naslov.Naziv LIKE 'The Lord of the Rings%'
GROUP BY Osoba.OsobaID
HAVING COUNT(DISTINCT Naslov.NaslovID) = (SELECT COUNT(*) Zbirna_ocjena 
  FROM Naslov 
  WHERE Naslov.Naziv LIKE 'The Lord of the Rings%');



--15. Koristeći podupite s predikatom postojanja, napišite SQL upit koji će, kao
--rezultat, ispisati pune nazive i godine izlaska naslova za koje je glasovalo
--više od 1.000.000 korisnika sustava IMDB.

SELECT Naslov.Naziv, Naslov.Godina_pocetka 
FROM Naslov
WHERE EXISTS (SELECT * FROM Ocjena 
  WHERE Naslov.NaslovID = Ocjena.NaslovID 
  AND Ocjena.Broj_glasova >= 1000000);



--16. Napišite SQL upit koji će, kao rezultat, ispisati puni naziv i godinu izlaska
--najbolje ocijenjenog animiranog filma među naslovima zastupljenim u bazi.

SELECT Naslov.Naziv, Naslov.Godina_pocetka 
FROM Naslov INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID 
INNER JOIN Pripada ON Naslov.NaslovID = Pripada.NaslovID
WHERE Pripada.ZanrID = (SELECT Zanr.ZanrID 
  FROM ZanrWHERE Zanr.Naziv = 'Animation') 
AND Naslov.VrstaID = (SELECT VrstaID FROM Vrsta 
  WHERE Vrsta.Naziv = 'movie') 
AND Ocjena.Prosjecna_ocjena = (SELECT MAX(Ocjena.Prosjecna_ocjena) 
  FROM Naslov INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID 
  INNER JOIN Pripada ON Naslov.NaslovID = Pripada.NaslovID 
  WHERE Pripada.ZanrID = (SELECT Zanr.ZanrID FROM Zanr
    WHERE Zanr.Naziv = 'Animation') 
  AND Naslov.VrstaID = (SELECT VrstaID FROM Vrsta 
    WHERE Vrsta.Naziv = 'movie'));



--17. Napišite SQL upit koji će, kao rezultat, ispisati puni naziv najdugovječnije
--TV serije među naslovima zastupljenim u bazi.

SELECT Naslov.Naziv 
FROM Naslov INNER JOINVrsta ON Naslov.VrstaID = Vrsta.VrstaID
WHERE Vrsta.Naziv = 'tvSeries' 
AND (Naslov.Godina_zavrsetka - Naslov.Godina_pocetka) = (SELECT MAX(p.Broj_godina) 
  FROM (SELECT Naslov.Godina_zavrsetka - Naslov.Godina_pocetka AS Broj_godina 
    FROM Naslov INNER JOIN Vrsta ON Naslov.VrstaID = Vrsta.VrstaID
    WHERE Vrsta.Naziv = 'tvSeries') AS p);



--18. Napišite SQL upit koji će, kao rezultat, ispisati ime i prezime
--najuspješnijeg režisera, gledano prema sumarnoj prosječnoj ocjeni svih
--naslova, među onima zastupljenim u bazi, koje je režirao/režirala.

SELECT Osoba.Ime, Osoba.Prezime 
FROM Osoba INNER JOIN Rezira ON Osoba.OsobaID = Rezira.ReziserID 
INNER JOIN Ocjena ON Rezira.NaslovID = Ocjena.NaslovID 
GROUP BY Osoba.OsobaID
HAVING SUM(Ocjena.Prosjecna_ocjena) = (SELECT MAX(p.Zbirna_ocjena) 
  FROM (SELECT SUM(Ocjena.Prosjecna_ocjena) AS Zbirna_ocjena 
    FROM Osoba INNER JOIN Rezira ON Osoba.OsobaID = Rezira.ReziserID 
    INNER JOIN Ocjena ON Rezira.NaslovID = Ocjena.NaslovID 
    GROUP BY Osoba.OsobaID) AS p);



--19. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive i nazive vrsta
--najbolje ocijenjenih naslova po pojedinim dekadama.

SELECT FLOOR(n.Godina_pocetka / 10) * 10 AS Dekada, n.Naziv, Vrsta.Naziv
FROM Naslov AS n INNER JOIN Vrsta ON n.VrstaID = Vrsta.VrstaID 
INNER JOIN Ocjena ON n.NaslovID = Ocjena.NaslovID 
WHERE EXISTS (SELECT *
  FROM (SELECT p.Dekada, MAX(p.Prosjecna_ocjena) AS Najbolja_ocjena 
    FROM (SELECT FLOOR(Naslov.Godina_pocetka / 10) * 10 AS Dekada, Ocjena.Prosjecna_ocjena 
      FROM Naslov INNER JOIN Ocjena ON Naslov.NaslovID = Ocjena.NaslovID) AS p 
    GROUP BY p.Dekada)AS r 
  WHERE FLOOR(n.Godina_pocetka / 10) * 10 = r.Dekada 
  AND Ocjena.Prosjecna_ocjena = r.Najbolja_ocjena) 
ORDER BY Dekada;