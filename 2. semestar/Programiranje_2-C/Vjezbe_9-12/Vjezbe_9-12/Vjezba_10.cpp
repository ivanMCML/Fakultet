#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "funkcije.h"
#include<string.h>

void zadatak_10_1();
void zadatak_10_2();
void zadatak_10_3();
void zadatak_10_4();

void getIntArrByPointer(int*, int);
void getCharArrByPointer(char*, int);
void printIntArrByPointer(int*, int);
void printCharArrByPointer(char*, int);
void getData(int*, int*);
void calcMathResults(int, int, int*, int*, int*);
void getData(Date*);
void calculateDateBeforeByPointer(Date*, int[]);
void calculateDateAfterByPointer(Date*, int[]);
void printDateBeforeAndAfterByPointer(Date*, Date*);
void getString(char[]);
void getSubstring(char[]);
void countSubstrOccurrences(char[], char[], int*);



// Napisati program u kojem korisnik unosi niz od 10 brojeva, a zatim niz od 10 znakova
// (nije rijeè o stringu).Nakon toga se oba niza trebaju ispisati u konzoli.
// Unos i ispis nizova treba napraviti putem pokazivaèa(tj.operatora*) (tj.ne smiju se
// koristiti[])

void zadatak_10_1() {

	int intArr[10] = { 0 };
	char charArr[10] = { '\0' };

	printf("Unesite niz od 10 brojeva!\n");
	getIntArrByPointer(intArr, 10);

	printf("Unesite niz od 10 znakova!\n");
	getCharArrByPointer(charArr, 10);

	printIntArrByPointer(intArr, 10);
	printCharArrByPointer(charArr, 10);
}

void getIntArrByPointer(int* p_intArr, int n) {

	for (int i = 0;i < n;i++) {
		scanf(" %d", p_intArr);
		p_intArr++;
	}

}

void getCharArrByPointer(char* p_charArr, int n) {

	for (int i = 0;i < n;i++) {
		scanf(" %c", p_charArr);
		p_charArr++;
	}
}

void printIntArrByPointer(int* p_intArr, int n) {
	printf("\n");
	for (int i = 0;i < n;i++) {
		printf("%d\t", *p_intArr);
		p_intArr++;
	}
}

void printCharArrByPointer(char* p_charArr, int n) {
	printf("\n");
	for (int i = 0;i < n;i++) {
		printf("%c\t", *p_charArr);
		p_charArr++;
	}
}




// Napisati program u kojem korisnik unosi 2 broja, a zatim program raèuna sumu,
// umnožak i razliku tih brojeva te ispisuje rezultate u konzolu.
// Unos brojeva treba implementirati u funkciji getData(), raèunanje sume, umnoška i
// razlike treba implementirati u funkciji calcMathResults(), a ispis rezultata treba
// implementirati u funkciji main().

void zadatak_10_2() {
	int x = 0;
	int y = 0;
	int sum = 0;
	int diff = 0;
	int multiple = 0;

	printf("Unesite dva broja!\n");
	getData(&x, &y);

	calcMathResults(x, y, &sum, &diff, &multiple);
	printf("\nx = %d\ty = %d\nsuma = %d\nrazlika = %d\nprodukt = %d", x, y, sum, diff, multiple);
}

void getData(int* p_x, int* p_y) {

	scanf(" %d", p_x);
	scanf(" %d", p_y);
}

void calcMathResults(int x, int y, int* p_sum, int* p_diff, int* p_mult) {

	*p_sum = x + y;
	*p_diff = x - y;
	*p_mult = x * y;
}





// Zadatak 2 iz vježbe 9 (raèunanje dana prije i poslije) treba implementirati putem
// pokazivaèa.Sve funkcije osim main() moraju imati povratni tip void.

void zadatak_10_3() {

	int daysInMonth[13] = { 31,31,28,31,30,31,30,31,31,30,31,30,31 };

	Date yesterday;
	Date tommorow;

	getData(&yesterday);
	tommorow = yesterday;

	calculateDateBeforeByPointer(&yesterday, daysInMonth);
	calculateDateAfterByPointer(&tommorow, daysInMonth);

	printDateBeforeAndAfterByPointer(&yesterday, &tommorow);
}

void getData(Date* p_today) {

	printf("Unesite datum!\n");
	scanf(" %d.%d.%d.", &p_today->day, &p_today->month, &p_today->year);
}

void calculateDateBeforeByPointer(Date* p_yesterday, int daysInMonth[]) {

	p_yesterday->day--;
	if (p_yesterday->day < 1) {
		p_yesterday->month--;
		p_yesterday->day = daysInMonth[p_yesterday->month];
	}
	if (p_yesterday->month < 1) {
		p_yesterday->month = 12;
		p_yesterday->year--;
	}
	if (p_yesterday->year % 4 == 0 && (p_yesterday->year % 100 != 0 || p_yesterday->year % 400 == 0) && p_yesterday->month == 2 && p_yesterday->day == 28) {
		p_yesterday->day = 29;
	}

}

void calculateDateAfterByPointer(Date* p_tommorow, int daysInMonth[]) {

	p_tommorow->day++;
	if (p_tommorow->day > daysInMonth[p_tommorow->month]) {
		p_tommorow->month++;
		p_tommorow->day = 1;
	}
	if (p_tommorow->month > 12) {
		p_tommorow->month = 1;
		p_tommorow->year++;
	}
	if (p_tommorow->year % 4 == 0 && ((p_tommorow->year % 100 != 0 || p_tommorow->year % 400 == 0)) && p_tommorow->month == 3 && p_tommorow->day == 1) {
		p_tommorow->day = 29;
		p_tommorow->month--;
	}
}

void printDateBeforeAndAfterByPointer(Date* p_yesterday, Date* p_tommorow) {

	printf("\nJuèer je bio %d.%d.%d., a sutra æe biti %d.%d.%d.!", p_yesterday->day, p_yesterday->month, p_yesterday->year, p_tommorow->day, p_tommorow->month, p_tommorow->year);
}





// Napisati program u kojem korisnik unosi string i podstring.Zatim program pronalazi
// koliko puta se podstring pojavljuje unutar stringa.
// Unos stringova treba implementirati u funkcijama getString() i getSubstring().
// Raèunanje broja ponavljanja podstringa u stringu treba implementirati u funkciji
// countSubstrOccurrences(), a ispis broja ponavljanja treba implementirati u
// funkciji main().

void zadatak_10_4() {

	char string[32] = { '\0' };
	char substring[10] = { '\0' };
	int counter = 0;

	getString(string);
	getSubstring(substring);
	countSubstrOccurrences(string, substring, &counter);

	printf("\nPodstring se pojavljuje %d puta!", counter);
}

void getString(char string[]) {

	printf("Unesite string!\n");
	scanf(" %s", string);
}

void getSubstring(char string[]) {

	printf("Unesite podstring!\n");
	scanf(" %s", string);
}

void countSubstrOccurrences(char string[], char substring[], int* p_counter) {

	while (string[0] != '\0')
	{
		if (strncmp(string, substring, strlen(substring)) == 0) {
			*p_counter = *p_counter + 1;
			string += strlen(substring);
		}
		else
		{
			string++;
		}
	}
}