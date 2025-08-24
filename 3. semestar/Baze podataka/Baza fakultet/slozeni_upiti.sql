--24. Napišite SQL upit koji će, kao rezultat, ispisati koliko je kojih ocjena
--ostvareno na ispitima iz svih kolegija.

SELECT Ocjena, COUNT(*)
FROM Polaze
GROUP BY Ocjena;



--25. Napišite SQL upit koji će, kao rezultat, ispisati prosjek ocjena po
--kolegijima.

SELECT Sifra, AVG(Ocjena) AS Srednja_ocjena
FROM Polaze
GROUP BY Sifra; 



--26. Napišite SQL upit koji će, kao rezultat, ispisati šifre kolegija kod kojih je
--prosjek ocjena veći od 3.

SELECT Sifra, AVG(Ocjena) AS Srednja_ocjena
FROM Polaze
GROUP BY Sifra
HAVING AVG(Ocjena) >= 3; 



--27. Napišite SQL upit koji će, kao rezultat, ispisati koliko je ispita položio
--pojedini student.

SELECT JMBAG, COUNT(*) AS Broj_ispita
FROM Polaze
GROUP BY JMBAG; 



--28. Napišite SQL upit koji će, kao rezultat, ispisati koliko je koji student ispita
--položio s ocjenom većom ili jednakom 4.

SELECT JMBAG, COUNT(*) AS Broj_ispita
FROM Polaze
WHERE Ocjena >= 4
GROUP BY JMBAG; 



--29. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG studenata koji su
--položili 2 ili više ispita.

SELECT JMBAG, COUNT(*) AS Broj_ispita
FROM Polaze
GROUP BY JMBAG
HAVING COUNT(*) >= 2;



--30. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG studenata kojima je
--srednja ocjena ispita, položenih u 2023. godini, veća od 3.5.

SELECT JMBAG, AVG(Ocjena) AS Srednja_ocjena
FROM Polaze
WHERE YEAR(Datum_polaganja) = 2023
GROUP BY JMBAG
HAVING Srednja_ocjena >= 3.5; 



--31. Napišite SQL upit koji će, kao rezultat, ispisati koliko je različitih
--studenata polagalo ispite u pojedinoj kalendarskoj godini.

SELECT YEAR(Datum_polaganja) AS Godina, COUNT(DISTINCT JMBAG) AS Broj_studenata
FROM Polaze
GROUP BY Godina; 



--32. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena
--studenata koji su do sada polagali barem jedan ispit.

SELECT DISTINCT Student.JMBAG, Student.Ime, Student.Prezime
FROM Polaze INNER JOIN Student
ON Polaze.JMBAG = Student.JMBAG;



--33. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena
--studenata, nazive kolegija koje su polagali te ocjene koje se iz njih dobili.

SELECT Student.JMBAG, Student.Ime, Student.Prezime, Kolegij.Naziv, Polaze.Ocjena
FROM Polaze INNER JOIN Student ON Polaze.JMBAG = Student.JMBAG
INNER JOIN Kolegij ON Polaze.Sifra = Kolegij.Sifra;



--34. Napišite SQL upit koji će, kao rezultat, ispisati šifru, naziv i prosječnu
--ocjenu ostvarenu na ispitima iz pojedinog kolegija u 2023. godini.

SELECT Kolegij.Sifra, Kolegij.Naziv, AVG(Polaze.Ocjena) AS Srednja_ocjena FROM Polaze INNER JOIN Kolegij
ON Polaze.Sifra = Kolegij.Sifra
WHERE YEAR(Polaze.Datum_polaganja) = 2023
GROUP BY Kolegij.Sifra;



--35. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena,
--broj položenih kolegija te prosjek ocjena studenata kojima je srednja
--ocjena svih položenih ispita veća od 3.

SELECT Student.JMBAG, Student.Ime, Student.Prezime, COUNT(*) AS Broj_položenih_ispita, AVG(Polaze.Ocjena) AS Prosjek FROM Polaze
INNER JOIN Student ON Polaze.JMBAG = Student.JMBAG
GROUP BY Student.JMBAG
HAVING Prosjek >= 3;



--36. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena
--studenata koji do sada nisu polagali ispit iz nijednog kolegija.

SELECT Student.JMBAG, Student.Ime, Student.Prezime
FROM Student LEFT JOIN Polaze ON Student.JMBAG = Polaze.JMBAG
WHERE Polaze.Ocjena IS NULL;