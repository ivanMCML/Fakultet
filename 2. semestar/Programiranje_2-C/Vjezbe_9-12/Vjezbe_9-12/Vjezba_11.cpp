#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "funkcije.h"
#include<string.h>
#include<stdlib.h>

void zadatak_11_1();
void zadatak_11_2();
void zadatak_11_3();
void zadatak_11_4();

void copyFileContent(char[], char[]);
int readFile(char[]);
void printParsedNumber(int);
void readDataFromFile(char[][32], char[][32], char[], int[]);
int countPeopleWithFirstName(char[][32], char[]);


void zadatak_11_1() {
	FILE* f1 = NULL;

	char file_1[32];
	char file_2[32];

	printf("Unesite nazive datoteka!\n");
	scanf(" %s %s", file_1, file_2);

	strcat(file_1, ".txt");
	strcat(file_2, ".txt");

	f1 = fopen(file_1, "w");
	if (f1 == NULL) {
		printf("\nDatoteka nije otvorena!");
		return;
	}
	fprintf(f1, "Ovo je sadržaj prve datoteke \"%s\" koji æe biti kopiran u drugu datoteku \"%s\"!\n1234444", file_1, file_2);
	fclose(f1);

	copyFileContent(file_1, file_2);
}

void copyFileContent(char file_1[], char file_2[]) {
	FILE* f1 = NULL;
	FILE* f2 = NULL;

	char str[1024];

	f1 = fopen(file_1, "r");
	if (f1 == NULL) {
		printf("\nDatoteka nije otvorena!!");
		return;
	}
	f2 = fopen(file_2, "w");
	if (f2 == NULL) {
		printf("\nDatoteka nije otvorena!!!");
		fclose(f1);
		return;
	}

	do {
		fgets(str, 1024, f1);
		fprintf(f2, str);
	} while (!feof(f1));

	fclose(f1);
	fclose(f2);
}



void zadatak_11_2() {
	FILE* f = NULL;
	char str[32];
	int num = 0;

	printf("Unesite ime datoteke!\n");
	scanf(" %s", str);

	strcat(str, ".txt");

	f = fopen(str, "w");
	if (f == NULL) {
		printf("\nDatoteka nije otvorena!");
		return;
	}
	fprintf(f, "1234");
	fclose(f);

	num = readFile(str);
	printParsedNumber(num);
}

int readFile(char str[]) {
	char aNum[20];
	int i = 0;
	FILE* f = NULL;

	f = fopen(str, "r");
	if (f == NULL) {
		printf("\nDatoteka nije otvorena!");
		return -1;
	}
	do {
		aNum[i] = getc(f);
		i++;
	} while (aNum[i - 1] >= '0' && aNum[i - 1] <= '9');
	fclose(f);

	aNum[i] = '\0';
	i = atoi(aNum);

	return i;
}

void printParsedNumber(int num) {

	printf("\n%d", num);
}



void zadatak_11_3() {
	char str[32];
	char surname[100][32];
	char name[100][32];
	int years[100];
	int n;
	char personName[] = "Ana";

	printf("Unesite ime datoteke!\n");
	scanf(" %s", str);
	strcat(str, ".txt");

	readDataFromFile(name, surname, str, years);
	n = countPeopleWithFirstName(name, personName);

	printf("\nIz datoteke je proèitano %d osoba s imenom %s!", n, personName);
}

void readDataFromFile(char firstnames[][32], char lastnames[][32], char str[], int years[]) {

	FILE* f = NULL;

	f = fopen(str, "r");
	if (f == NULL) {
		printf("\nDatoteka nije otvorena!");
		return;
	}

	for (int i = 0; i < 100;i++) {

		if (feof(f))
			break;

		fscanf(f, " %s %s %d.", lastnames[i], firstnames[i], &years[i]);
	}
	fclose(f);
}

int countPeopleWithFirstName(char firstname[][32], char name[]) {

	int counter = 0;

	for (int i = 0;i < 100;i++) {

		if (_strcmpi(firstname[i], name) == 0) {
			counter++;
		}
	}
	return counter;
}



void zadatak_11_4() {
	FILE* f = NULL;
	char file[32];
	char str[1024];
	char* token;

	printf("Unesite ime datoteke!\n");
	scanf(" %s", str);

	strcat(str, ".txt");

	f = fopen(str, "w");
	if (f == NULL) {
		printf("\nDatoteka nije otvorena!");
		return;
	}
	fprintf(f, "Napisati program koji iz datoteke cita 1 redak podataka.\nZatim podatke iz procitanog retka ispisuje rijec po rijec u konzolu.\nSvaka rijec mora biti ispisana u zasebnom retku.\nNaziv datoteke treba unijeti korisnik.");
	fclose(f);

	f = fopen(str, "r");
	if (f == NULL) {
		printf("\nDatoteka nije otvorena!");
		return;
	}

	fgets(str, 1024, f);
	fclose(f);

	token = strtok(str, " ");
	while (token != NULL) {
		printf(" %s\n", token);
		token = strtok(NULL, " ");
	}
}