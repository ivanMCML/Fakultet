#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include <string.h>

typedef struct _Time {
	int h;
	int min;
	int s;
}Time;
typedef struct _Date {
	int day;
	int month;
	int year;
}Date;
typedef struct _Person {
	char firstName[32];
	char lastName[32];
	Date dateOfBirth;
	Time timeOfBirth;
}Person;

Time timeSum(Time, Time);
void printTime(Time);
Date calculateDateBefore(Date, int[]);
Date calculateDateAfter(Date, int[]);
void printDateBeforeAndAfter(Date, Date);
void getPeopleData(Person[], int);
void findAndPrintOldestPerson(Person[], int);
void findAndPrintAlphaFirstPerson(Person[], int);


// Napisati program u kojem korisnik unosi 2 proizvodna vremena(sat, minute i
// sekunde).Program treba zbrojiti unesena vremena te ispisati rezultat u konzolu.
// Za pohranu vremena koristiti strukturu struct Time, a zbrajanje i ispis
// implementirati u odvojenim funkcijama.
// Napomena: rezultat ne smije imati više od 60 sekundi i/ili više od 60 minuta.

void zadatak_9_1() {

	Time T_1 = { 0 };
	Time T_2 = { 0 };

	printf("Unesite prvo pa drugo vrijeme!\n");
	scanf(" %d:%d:%d", &T_1.h, &T_1.min, &T_1.s);
	scanf(" %d:%d:%d", &T_2.h, &T_2.min, &T_2.s);

	T_2 = timeSum(T_1, T_2);
	printTime(T_2);
}

Time timeSum(Time t1, Time t2) {

	Time t3;

	t3.h = t1.h + t2.h;
	t3.min = t1.min + t2.min;
	t3.s = t1.s + t2.s;

	while (t3.s > 59) {
		t3.min++;
		t3.s -= 60;
	}
	while (t3.min > 59) {
		t3.h++;
		t3.min -= 60;
	}

	return t3;
}

void printTime(Time t) {

	printf("\n%d:%d:%d", t.h, t.min, t.s);
}




// Napisati program u kojem korisnik unosi datum(dan, mjesec godina).Program treba
// izraèunati dan prije i dan poslije unesenog te ih ispisati u konzolu.
// Za pohranu datuma treba koristiti strukturu struct Date.
// Proraèun dana prije i poslije treba implementirati u funkcijama
// calculateDateBefore() i calculateDateAfter(), a ispis dana prije i poslije treba
// implementirati u funkciji printDateBeforeAndAfter().
// Napomena : pripaziti na prijestupne godine.

void zadatak_9_2() {

	Date today = { 0 };
	Date tomorrow = { 0 };
	Date yesterday = { 0 };

	int daysInMonth[13] = { 31,31,28,31,30,31,30,31,31,30,31,30,31 };

	printf("Unesite datum!\n");
	scanf(" %d.%d.%d.", &today.day, &today.month, &today.year);

	yesterday = calculateDateBefore(today, daysInMonth);
	tomorrow = calculateDateAfter(today, daysInMonth);
	printDateBeforeAndAfter(yesterday, tomorrow);
}

Date calculateDateBefore(Date yesterday, int daysInMonth[13]) {

	yesterday.day--;
	if (yesterday.day < 1) {
		yesterday.month--;
		yesterday.day = daysInMonth[yesterday.month];
	}
	if (yesterday.month < 1) {
		yesterday.month = 12;
		yesterday.year--;
	}
	if (yesterday.year % 4 == 0 && (yesterday.year % 100 != 0 || yesterday.year % 400 == 0) && yesterday.month == 2 && yesterday.day == 28) {
		yesterday.day = 29;
	}

	return yesterday;
}

Date calculateDateAfter(Date Tomorrow, int daysInMonth[13]) {

	Tomorrow.day++;
	if (Tomorrow.year % 4 == 0 && (Tomorrow.year % 100 != 0 || Tomorrow.year % 400 == 0) && Tomorrow.month == 2) {
		if (Tomorrow.day > 29) {
			Tomorrow.day = 1;
			Tomorrow.month = 3;
		}
	}
	else if (Tomorrow.day > daysInMonth[Tomorrow.month]) {
		Tomorrow.day = 1;
		Tomorrow.month++;
	}
	if (Tomorrow.month > 12) {
		Tomorrow.month = 1;
		Tomorrow.year++;
	}
	return Tomorrow;
}

void printDateBeforeAndAfter(Date yesterday, Date tomorrow) {
	printf("Juèer je bio %d.%d.%d.\n", yesterday.day, yesterday.month, yesterday.year);
	printf("Sutra æe biti %d.%d.%d.\n", tomorrow.day, tomorrow.month, tomorrow.year);
}




// Napisati program u kojem korisnik unosi podatke o 5 osoba(ime, prezime, datum i
// vrijeme roðenja).Program treba pronaæi i ispisati podatke o najstarijoj osobi te osobi
// prvoj po abecedi.
// Za pohranu podataka treba koristiti 3 strukture: struct Person, struct Date i
// struct Time.
// Unos podataka treba implementirati u funkciji getPeopleData(), a pronalazak i ispis
// najstarije osobe i osobne prve po abecedi treba implementirati u funkciji
// findAndPrintOldestPerson() i findAndPrintAlphaFirstPerson().

void zadatak_9_3() {

	Person People[5] = { 0 };

	printf("Unesite ime i prezime te datum i vrijeme roðenja 5 osoba!");
	getPeopleData(People, 5);
	findAndPrintOldestPerson(People, 5);
	findAndPrintAlphaFirstPerson(People, 5);

}

void getPeopleData(Person People[], int n) {

	printf("\nFormat: ime prezime 0.0.0. 0:0:0\n");
	for (int i = 0;i < n;i++) {

		scanf(" %s %s %d.%d.%d. %d:%d:%d", People[i].firstName, People[i].lastName, &People[i].dateOfBirth.day, &People[i].dateOfBirth.month, &People[i].dateOfBirth.year, &People[i].timeOfBirth.h, &People[i].timeOfBirth.min, &People[i].timeOfBirth.s);
	}
}

void findAndPrintOldestPerson(Person People[], int n) {

	int oldest = 0;

	for (int i = 1;i < n;i++) {

		if (People[i].dateOfBirth.year < People[oldest].dateOfBirth.year) {
			oldest = i;
		}
		else if (People[i].dateOfBirth.year == People[oldest].dateOfBirth.year) {
			if (People[i].dateOfBirth.month < People[oldest].dateOfBirth.month) {
				oldest = i;
			}
			else if (People[i].dateOfBirth.month == People[oldest].dateOfBirth.month) {
				if (People[i].dateOfBirth.day < People[oldest].dateOfBirth.day) {
					oldest = i;
				}
				else if (People[i].dateOfBirth.day == People[oldest].dateOfBirth.day) {
					if (People[i].timeOfBirth.h < People[oldest].timeOfBirth.h) {
						oldest = i;
					}
					else if (People[i].timeOfBirth.h == People[oldest].timeOfBirth.h)
					{
						if (People[i].timeOfBirth.min < People[oldest].timeOfBirth.min) {
							oldest = i;
						}
						else if (People[i].timeOfBirth.min == People[oldest].timeOfBirth.min)
						{
							if (People[i].timeOfBirth.s < People[oldest].timeOfBirth.s) {
								oldest = i;
							}
						}
					}
				}
			}
		}
	}

	printf("\nNajstarija osoba je %s %s!", People[oldest].firstName, People[oldest].lastName);
}

void findAndPrintAlphaFirstPerson(Person People[], int n) {

	int alphaFirst = 0;

	for (int i = 1;i < n;i++) {

		if (strcmp(People[i].lastName, People[alphaFirst].lastName) < 0) {
			alphaFirst = i;
		}
		else if (strcmp(People[i].lastName, People[alphaFirst].lastName) == 0) {
			if (strcmp(People[i].firstName, People[alphaFirst].firstName) < 0) {
				alphaFirst = i;
			}
		}
	}

	printf("\nPrva osoba po abecedi je %s %s!", People[alphaFirst].firstName, People[alphaFirst].lastName);
}