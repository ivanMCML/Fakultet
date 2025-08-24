--1. Napišite SQL upit koji će, kao rezultat, ispisati sve podatke o naslovima iz
--koji su izašli 2024. godine.

SELECT *
FROM Naslov
WHERE Naslov.Godina_pocetka = 2024;



--2. Napišite SQL upit koji će, kao rezultat, ispisati pune nazive svih naslova
--koji traju više od 120 minuta.

SELECT Naslov.Naziv
FROM Naslov
WHERE Naslov.Trajanje >= 120;



--3. Napišite SQL upit koji će, kao rezultat, ispisati primarne profesije svih
--muških osoba.

SELECT DISTINCT Osoba.Primarna_profesija
FROM Osoba
WHERE Osoba.Spol = 'M';



--4. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena osoba
--koje su rođene tijekom ’50-ih godina prošlog stoljeća.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba
WHERE Osoba.Godina_rodjenja BETWEEN 1951 AND 1960;



--5. Napišite SQL upit koji će, kao rezultat, ispisati nazive svih naslova koji u
--svome nazivu sadrže riječi ‘Star Wars’. Rezultate u ispisu poredajte prema
--godini izlaska, od najstarijeg prema najnovijem.

SELECT Naslov.Naziv
FROM Naslov
WHERE Naslov.Naziv LIKE '%Star Wars%'
ORDER BY Naslov.Godina_pocetkaASC;



--6. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena te dob
--svih osoba kojima je primarna profesija gluma. Rezultate u ispisu
--poredajte prema godinama starosti, od najstarije prema najmlađoj osobi.

SELECT Osoba.Ime, Osoba.Prezime, (YEAR(CURDATE()) - Osoba.Godina_rodjenja) AS Dob
FROM Osoba
WHERE Osoba.Primarna_profesija IN ('actor', 'actress')
ORDER BY Dob DESC;



--7. Napišite SQL upit koji će, kao rezultat, ispisati prosječnu ocjenu naslova s
--najvećim brojem glasova.

SELECT Ocjena.Prosjecna_ocjena
FROM Ocjena
ORDER BY Ocjena.Broj_glasova DESC
LIMIT 1;



--8. Napišite SQL upit koji će, kao rezultat, ispisati puni naziv naslova
--najkraćeg trajanja, koji pripada vrsti s oznakom 3.

SELECT Naslov.Naziv
FROM Naslov
WHERE Naslov.VrstaID = 3
ORDER BY Naslov.TrajanjeASC
LIMIT 1;



--9. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena svih
--osoba škotskog podrijetla, kojima prezime započinje s predmetkom ‘Mc’.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba
WHERE Osoba.Prezime LIKE 'Mc%';



--10. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena svih
--živućih osoba.

SELECT Osoba.Ime, Osoba.Prezime
FROM Osoba
WHERE Osoba.Godina_smrti IS NULL;



--11. Napišite SQL upit koji će, kao rezultat, ispisati imena i prezimena svih
--živućih osoba, mlađih od 70 godina, te minimalan broj godina koje ih još
--dijele do umirovljenja, pod pretpostavkom da u mirovinu odlaze s
--navršenih 70 godina.

SELECT Osoba.Ime, Osoba.Prezime, (70 - (YEAR(CURDATE()) - Osoba.Godina_rodjenja)) AS Godine_do_mirovine
FROM Osoba
WHERE Osoba.Godina_smrti IS NULL AND (YEAR(CURDATE()) - Osoba.Godina_rodjenja) < 70;



--12. Napišite SQL upit koji će, kao rezultat, ispisati broj filmova iz serijala
--‘Kum’ (‘The Godfather’) koji se nalaze na listi najbolje ocjenjenih.

SELECT COUNT(Naslov.Naziv) AS Broj_naslova
FROM Naslov
WHERE Naslov.Naziv LIKE 'The Godfather%';



--13. Napišite SQL upit koji će, kao rezultat, ispisati broj različitih osoba koje su
--režirale neku od epizoda serije s oznakom tt0096697.

SELECT COUNT(DISTINCT Rezira.ReziserID)
FROM Rezira
WHERE Rezira.NaslovID = 'tt0096697';



--14. Napišite SQL upit koji će, kao rezultat, ispisati koliko naslova je režirala
--osoba s oznakom nm0000229.

SELECT COUNT(*) AS Broj_naslova
FROM Rezira
WHERE Rezira.ReziserID = 'nm0000229';



--15. Napišite SQL upit koji će, kao rezultat, ispisati ukupni broj glasova koji su
--sakupili naslovi, čija je prosječna ocjena veća od 9.0.

SELECT SUM(Ocjena.Broj_glasova)
FROM Ocjena
WHERE Ocjena.Prosjecna_ocjena >= 9.0;



--16. Napišite SQL upit koji će, kao rezultat, ispisati godinu rođenja najmlađe
--osobe kojoj je primarna profesija gluma.

SELECT MAX(Osoba.Godina_rodjenja)
FROM Osoba
WHERE Osoba.Primarna_profesija IN ('actor', 'actress');



--17. Napišite SQL upit koji će, kao rezultat, ispisati prosječnu starost svih
--živućih osoba.

SELECT AVG(YEAR(CURDATE()) - Osoba.Godina_rodjenja) AS Prosjecna_dob
FROM Osoba
WHERE Osoba.Godina_smrti IS NULL;