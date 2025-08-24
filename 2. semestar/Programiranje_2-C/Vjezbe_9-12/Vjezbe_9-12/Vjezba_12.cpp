#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "funkcije.h"
#include<string.h>
#include<stdlib.h>


void zadatak_12_1();
void zadatak_12_2();
void zadatak_12_3();

int getArraySize();
void getArray(int*, int);
int getTargetNumber();
void findNumberInArray(int*, int, int);
int getNumber();
void formatNumToString(int, char[]);
void printString(char*);
int getStudentsDataFromFile(char***, char***);
void getPointsFromConsole(int*);
void printStudentDataToConsole(char**, int*);




//Napisati program u kojem korisnik unosi velièinu niza(cijeli broj N), nakon toga unosi
//N brojeva(koji se zapisuju u niz) te još jedan broj(koji se pretražuje).Zatim program
//treba ispisati nalazi li se uneseni broj u nizu.
//Unos velièine niza(broja N) treba implementirati u funkciji getArraySize(), unos
//samog niza u funkciji getArray(), a unos broja koji se pretražuje u funkciji
//getTargetNumber().Pretragu broja u nizu treba implementirati u funkciji
//findNumberInArray().

void zadatak_12_1() {

	int* p_arr = NULL;
	int n = 0;
	int num = 0;

	n = getArraySize();

	p_arr = (int*)malloc(n * sizeof(int));
	if (p_arr == NULL) {
		printf("Memorija nije alocirana!");
	}

	if (n < 0) {
		return;
	}
	getArray(p_arr, n);
	num = getTargetNumber();
	findNumberInArray(p_arr, n, num);
	free(p_arr);
}

int getArraySize() {

	int n = 0;
	printf("Koliki niz želite?\n");
	scanf(" %d", &n);

	return n;
}

void getArray(int* p_arr, int n) {

	printf("\nUnesite brojeve niza!\n");
	for (int i = 0;i < n;i++) {
		scanf(" %d", &p_arr[i]);
	}
}

int getTargetNumber() {
	int n = 0;

	printf("\nUnesite broj!\n");
	scanf(" %d", &n);
	return n;
}

void findNumberInArray(int* p_arr, int n, int findNum) {
	for (int i = 0; i < n;i++) {
		if (p_arr[i] == findNum) {
			printf("Broj %d se nalazi u nizu!", findNum);
			return;
		}
	}
	printf("Broj %d se ne nalazi u nizu!", findNum);
}




//Napisati program u kojem korisnik unosi dekadski broj, a zatim se broj pretvara u
//string koji se sastoji od znamenki tog broja.Nakon toga potrebno je ispisati string u
//konzoli na naèin da se svaka znamenka ispiše u zasebnom retku.
//Unos broja treba implementirati u funkciji getNumber(), pretvorbu broja(iz varijable
//tipa int) u string treba implementirati u funkciji formatNumToString(), a ispis
//stringa treba implementirati u funkciji printString().

void zadatak_12_2() {

	int num = 0;
	int temp = 0;
	int i = 1;
	char* p_strNum = NULL;

	num = getNumber();

	temp = num;
	while (temp != 0) {
		temp = temp / 10;
		i++;
	}

	p_strNum = (char*)malloc(i);
	if (p_strNum == NULL) {
		printf("\nMemorija nije alocirana.");
		return;
	}

	formatNumToString(num, p_strNum);
	printString(p_strNum);


}

int getNumber() {
	int n = 0;
	printf("Unesite broj!\n");
	scanf(" %d", &n);
	return n;
}

void formatNumToString(int num, char* p_strNum) {
	_itoa(num, p_strNum, 10);
}

void printString(char* p_strNum) {
	printf("\n%s", p_strNum);
}

