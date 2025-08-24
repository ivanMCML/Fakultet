--37. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati JMBAG,
--imena i prezimena studenata, koji su polagali barem jedan ispit u 2022.
--godini. Izlaznu listu rezultata poredajte po abecednom redu prezimena.

SELECT JMBAG, Ime, Prezime FROM Student
WHERE JMBAG IN (SELECT DISTINCT JMBAG FROM Polaze
  WHERE YEAR(Datum_polaganja) = 2022)
ORDER BY Prezime ASC;



--38. Prethodni zadatak riješite primjenom upita nad više relacija (JOIN).

SELECT Student.JMBAG, Ime, Prezime FROM Polaze
INNER JOIN Student ON Polaze.JMBAG = Student.JMBAG
WHERE YEAR(Datum_polaganja) = 2022
ORDER BY Prezime ASC;



--39. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati JMBAG,
--imena i prezimena studenata koji do sada nisu položili ispit iz nijednog
--kolegija.

SELECT JMBAG, Ime, Prezime FROM Student
WHERE JMBAG NOT IN (SELECT DISTINCT JMBAG
  FROM Polaze);



--40. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati JMBAG,
--imena i prezimena studenata koji dolaze iz istog grada kao i student čiji je
--JMBAG 1123713521.

SELECT JMBAG, Ime, Prezime FROM Student
WHERE Grad = (SELECT Grad FROM Student
  WHERE JMBAG = '1123713521');



--41. Koristeći podupite, napišite SQL upit koji će, kao rezultat, ispisati šifre,
--nazive i ocjene svih kolegija, osim posljednjeg, koje je polagao student Ivan
--Vasilj.

SELECT Kolegij.Sifra, Naziv, Ocjena 
FROM Polaze INNER JOIN Student ON Polaze.JMBAG = Student.JMBAG
INNER JOIN Kolegij ON Polaze.Sifra_kolegija = Kolegij.Sifra
WHERE Ime = 'Ivan' AND Prezime = 'Vasilj' 
AND Datum_polaganja < (SELECT MAX(Datum_polaganja) FROM Polaze
  WHERE JMBAG = (SELECT JMBAG FROM Student
    WHERE Ime = 'Ivan'AND Prezime = 'Vasilj'));



--42. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena
--svih studenata čija je srednja ocjena položenih ispita veća od srednje
--ocjene studentice Jelene Pleštine.

SELECT Student.JMBAG, Student.Ime, Student.Prezime, AVG(Polaze.Ocjena) AS Srednja_ocjena 
FROM Student INNER JOIN Polaze ON Student.JMBAG = Polaze.JMBAG 
GROUP BY Student.JMBAG,  
HAVING AVG(Polaze.Ocjena) > (SELECT
  AVG(Polaze.Ocjena) 
  FROM Student INNER JOIN Polaze ON Student.JMBAG = Polaze.JMBAG 
  WHERE Student.Ime = 'Jelena' AND Student.Prezime = 'Pleština');



--43. Napišite SQL upit koji će, kao rezultat, ispisati šifre i nazive kolegija na
--kojima je prosječna ocjena položenih ispita manja od prosječne ocjene
--svih položenih ispita.

SELECT Kolegij.Sifra, Kolegij.Naziv, AVG(Polaze.Ocjena) AS Srednja_ocjena 
FROM Kolegij INNER JOIN Polaze ON Kolegij.Sifra = Polaze.Sifra 
GROUP BY Kolegij.Sifra 
HAVING AVG(Polaze.Ocjena) < (SELECT AVG(Polaze.Ocjena) FROM Polaze); 



--44. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena
--studenata s najvećom srednjom ocjenom položenih ispita.

SELECT Student.JMBAG, Student.Ime, Student.Prezime, AVG(Polaze.Ocjena) AS Srednja_ocjena 
FROM Student INNER JOIN Polaze ON Student.JMBAG = Polaze.JMBAG 
GROUP BY Student.JMBAG 
HAVING AVG(Polaze.Ocjena) = (SELECT MAX(p.Srednja_ocjena) 
  FROM (SELECT Polaze.JMBAG, AVG(Polaze.Ocjena) AS Srednja_ocjena 
    FROM Polaze 
    GROUP BY Polaze.JMBAG) AS p); 



--45. Koristeći podupite s predikatom usporedbe, napišite SQL upit koji će, kao
--rezultat, ispisati matične brojeve, imena i prezimena svih studenata koji su
--ispite polagali između 1. lipnja 2022. i 30. rujna 2022.

SELECT JMBAG, Ime, Prezime 
FROM Student
WHERE JMBAG = ANY (SELECT DISTINCT JMBAG FROM Polaze
  WHERE Datum_polaganja BETWEEN '2022-06-01'AND '2022-09-30');



--46. Koristeći podupite s predikatom postojanja, napišite SQL upit koji će, kao
--rezultat, ispisati JMBAG, imena i prezimena svih studenata koji nisu
--polagali nijedan ispit u 2022. godini.

SELECT JMBAG, Ime, Prezime 
FROM Student
WHERE NOT EXISTS (SELECT * FROM Polaze
  WHERE Student.JMBAG = Polaze.JMBAG AND YEAR(Datum_polaganja) = 2022);




--47. Koristeći podupite s predikatom postojanja, napišite SQL upit koji će, kao
--rezultat, ispisati nazive svih mjesta iz kojih dolaze studenti koji su do sada
--položili barem jedan ispit.

SELECT DISTINCT Grad FROM Student
WHERE EXISTS (SELECT * FROM Polaze
  WHERE Student.JMBAG = Polaze.JMBAG);



--48. Napišite korelirani SQL upit koji će, kao rezultat, ispisati JMBAG, datum
--polaganja i ocjene svih studenata koji su polagali ispit iz kolegija
--'Termodinamika 1'.

SELECT JMBAG, Datum_polaganja, Ocjena 
FROM Polaze
WHERE 'Termodinamika 1' = (SELECT Naziv FROM Kolegij
  WHERE Polaze.Sifra = Kolegij.Sifra);



--49. Napišite korelirani SQL upit s predikatom liste koji će, kao rezultat,
--ispisati JMBAG, imena i prezimena svih studenata koji su polagali ispite u
--2023. godini.

SELECT JMBAG, Ime, Prezime 
FROM Student
WHERE JMBAG IN (SELECT JMBAG FROM Polaze
  WHERE Student.JMBAG = Polaze.JMBAG AND YEAR(Datum_polaganja) = 2023);