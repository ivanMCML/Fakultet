-- 1. Napišite SQL upit koji će, kao rezultat, ispisati sve raspoložive podatke o
-- svim upisanim studentima.

SELECT * FROM Student;



--2. Napišite SQL upit koji će, kao rezultat, ispisati mjesta rođenja upisanih
--studenata.

SELECT DISTINCT Grad FROM Student;



--3. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim muškim
--studentima.

SELECT *
FROM Student
WHERE Spol = 'M';



--4. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim studentima
--rođenim između 2001. i 2003. godine.

SELECT *
FROM Student
WHERE Datum_rodjenja BETWEEN '2001-01-01' AND '2003-12-31';



--5. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim studentima
--koji ne dolaze iz Splita ili Hvara.

SELECT *
FROM Student
WHERE Grad NOT IN ('Split', 'Hvar');



--6. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim
--nastavnicima čija se soba nalazi u B krilu.

SELECT *
FROM Nastavnik
WHERE Soba LIKE 'B%';



--7. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim
--nastavnicima čija se soba nalazi na 5. katu.

SELECT *
FROM Nastavnik
WHERE Soba LIKE '_5%';



--8. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim
--nastavnicima čije prezime završava na ‘ić’.

SELECT *
FROM Nastavnik
WHERE Prezime LIKE '%ić';



--9. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim muškim
--studentima upisanim 2021. godine.

SELECT *
FROM Student
WHERE Godina_upisa = 2021 AND Spol = 'M';



--10. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim studentima
--koji dolaze iz Splita ili kojima mjesto prebivališta nije poznato.

SELECT *
FROM Student
WHERE Grad = 'Split' OR Grad IS NULL;



--11. Napišite SQL upit koji će, kao rezultat, ispisati podatke o svim studentima
--koji ne dolaze iz Splita.

SELECT *
FROM Student
WHERE NOT Grad = 'Split'; 



--14. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, imena i prezimena
--studenata upisanih 2022. godine, pri čemu će u izlaznoj listi ovi stupci
--nositi imena Maticni_broj, Ime_studenta i Prezime_studenta.

SELECT JMBAG AS Maticni_broj, Ime AS Ime_studenta, Prezime AS Prezime_studenta
FROM Student
WHERE Godina_upisa = 2022;



--15. Napišite SQL upit koji će, kao rezultat, ispisati studentov JMBAG, šifru
--položenog kolegija i ostvarenu ocjenu, zamjenjujući brojčane ocjene
--opisnima.

SELECT JMBAG, Sifra,
(CASE
  WHEN Ocjena = 5 THEN 'Izvrstan'
  WHEN Ocjena = 4 THEN 'Vrlo dobar'
  WHEN Ocjena = 3 THEN 'Dobar'
  WHEN Ocjena = 2 THEN 'Dovoljan'
END) AS Ocjena
FROM Polaze;



--16. Napišite SQL upit koji će, kao rezultat, ispisati sve podatke o upisanim
--studentima s prebivalištem u gradu Splitu, poredane po abecednom redu
--prezimena.

SELECT *
FROM Student
WHERE Grad = 'Split'
ORDER BY Prezime ASC;



--17. Napišite SQL upit koji će, kao rezultat, ispisati podatke o prva 3 upisana
--studenta, prema abecednom redu prezimena.

SELECT *
FROM Student
ORDER BY Prezime ASC
LIMIT 3;



--18. Napišite SQL upit koji će, kao rezultat, ispisati podatke o najstarijem
--studentu.

SELECT *
FROM Student
ORDER BY TIMESTAMPDIFF(YEAR, Datum_rodjenja, CURDATE()) DESC
LIMIT 1;



--19. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG, ime, prezime te
--minimalan broj godina koje će student još provesti na fakultetu, pod
--pretpostavkom da studij traje 5 godina.

SELECT JMBAG, Ime, Prezime, 5 - (2024 - Godina_upisa) AS Trajanje_studija
FROM Student;



--20. Napišite SQL upit koji će, kao rezultat, ispisati JMBAG te ime, prezime i
--broj godina pojedinog studenta u jednom stupcu.

SELECT JMBAG, CONCAT(Ime, ' ', Prezime, ', ', TIMESTAMPDIFF(YEAR, Datum_rodjenja, CURDATE()), ‘ godina’) AS Student
FROM Student;



--21. Napišite SQL upit koji će, kao rezultat, ispisati prosječnu ocjenu svih
--položenih ispita.

SELECT AVG(Ocjena)
FROM Polaze
WHERE Ocjena > 1;



--22. Napišite SQL upit koji će, kao rezultat, ispisati prosječnu ocjenu svih ispita
--položenih u 2023. godini.

SELECT AVG(Ocjena)
FROM Polaze
WHERE Ocjena > 1 AND YEAR(Datum_polaganja) = 2023;



--23. Napišite SQL upit koji će, kao rezultat, ispisati najmanju ocjenu ostvarenu
--na ispitu iz kolegija sa šifrom FESC09.

SELECT MIN(Ocjena)
FROM Polaze
WHERE Sifra = 'FESC09';



--23. Napišite SQL upit koji će, kao rezultat, ispisati ukupan broj studenata koji
--su položili ispit iz kolegija sa šifrom FESC09 u 2022. godini.

SELECT COUNT(*)
FROM Polaze
WHERE Ocjena > 1 AND Sifra = 'FESC09' AND YEAR(Datum_polaganja)
= 2022;
