--50. Napišite SQL upit koji će, u oglednoj bazi podataka, formirati novu tablicu
--koja će sadržavati JMBAG, imena i prezimena studenata upisanih 2021.
--godine, koji su polagali ispit iz kolegija „Termodinamika 1”.

CREATE TABLE Student_2 AS
SELECT Student.JMBAG, Ime, Prezime FROM Polaze
INNER JOIN Student ON Polaze.JMBAG = Student.JMBAG
INNER JOIN Kolegij ON Polaze.Sifra = Kolegij.Sifra
WHERE Godina_upisa = 2021 AND Naziv = 'Termodinamika 1';



--51. Napišite SQL upit koji će, tablicu STUDENT_2, koju smo kreirali u
--prethodnom zadatku, nadopuniti podacima o svim drugim studentima, koji
--su polagali ispit iz kolegija „Termodinamika 1”.

INSERT INTO Student_2
SELECT Student.JMBAG, Ime, Prezime FROM Polaze
INNER JOIN Student ON Polaze.JMBAG = Student.JMBAG
INNER JOIN Kolegij ON Polaze.Sifra = Kolegij.Sifra
WHERE Godina_upisa <> 2021 AND Naziv = 'Termodinamika 1';



--52. Napišite SQL upit kojim ćete, u tablici STUDENT, studentu čiji je JMBAG
--1123747213 promijeniti ime u Lovre.

UPDATE Student
SET Ime = 'Lovre'
WHERE JMBAG = '1123747213';



--53. Napišite SQL upit kojim ćete, studentu po imenu Ivan Vasilj promijeniti
--ocjenu iz kolegija „Termodinamika 1” u 4.

UPDATE Polaze
SET Ocjena = 4
WHERE JMBAG = (SELECT JMBAG FROM Student
  WHERE Ime = 'Ivan' AND Prezime = 'Vasilj') 
AND Sifra = (SELECT Sifra FROM Kolegij 
  WHERE Naziv = 'Termodinamika 1');



--54. Napišite SQL upit kojim ćete, iz tablice STUDENT izbrisati podatke o
--student čiji je JMBAG 1123745871.

DELETE
FROM Student
WHERE JMBAG = '1123745871';



--55. Napišite SQL upit kojim ćete izbrisati podatke o svim ispitima koje je
--student po imenu Ivan Vasilj položio u 2022. godini.

DELETE
FROM Polaze
WHERE JMBAG = (SELECT JMBAG FROM Student
  WHERE Ime = 'Ivan' AND Prezime = 'Vasilj') 
AND YEAR(Datum_polaganja) = 2022;



--56. Načinite pogled koji će sadržavati JMBAG, imena i prezimena studenata te
--nazive kolegija koje su polagali.

CREATE VIEW Popis_kolegijaAS
SELECT Student.JMBAG AS JMBAG, Ime, Prezime, Naziv
FROM Student
INNER JOIN Polaze ON Student.JMBAG = Polaze.JMBAG
INNER JOIN Kolegij ON Polaze.Sifra = Kolegij.Sifra;



--57. Koristeći pogled Popis_kolegija, napišite SQL upit koji će ispisati sve
--studente koji su polagali kolegij „Baze podataka”. Izlaznu listu rezultata
--poredajte po abecednom redu prezimena.

SELECT *
FROM Popis_kolegija
WHERE Naziv = 'Baze podataka'
ORDER BY Prezime ASC;



--58. Načinite pogled koji će sadržavati JMBAG, imena i prezimena te godine
--upisa studenata koji su fakultet upisali od 2020. godine na ovamo. Stupci u
--pogledu moraju nositi imena JMBAG, Ime studenta, Prezime
--studenta i Godina upisa.

CREATE VIEW Student_3 (JMBAG, Ime_studenta, Prezime_studenta, Godina_upisa) AS
SELECT JMBAG, Ime, Prezime, Godina_upisa 
FROM Student
WHERE Godina_upisa >= 2020;



--59. U pogledu Student_3 izmijenite godinu upisa studenta čiji je
--JMBAG1123713521 iz 2020. u 2018.

UPDATE Student_3
SET Godina_upisa = 2018
WHERE JMBAG = '1123713521';