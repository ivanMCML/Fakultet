#pragma once

void zadatak_9_1();
void zadatak_9_2();
void zadatak_9_3();

void zadatak_10_1();
void zadatak_10_2();
void zadatak_10_3();
void zadatak_10_4();

void zadatak_11_1();
void zadatak_11_2();
void zadatak_11_3();
void zadatak_11_4();

void zadatak_12_1();
void zadatak_12_2();
void zadatak_12_3();


//VJEŽBA 9 STRUKTURE
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


//VJEŽBA 9 FUNKCIJE
Time timeSum(Time, Time);
void printTime(Time);
Date calculateDateBefore(Date, int[]);
Date calculateDateAfter(Date, int[]);
void printDateBeforeAndAfter(Date, Date);
void getPeopleData(Person[], int);
void findAndPrintOldestPerson(Person[], int);
void findAndPrintAlphaFirstPerson(Person[], int);

//VJEŽBA 10 FUNKCIJE
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

//VJEŽBA 11 FUNKCIJE
void copyFileContent(char[], char[]);
int readFile(char[]);
void printParsedNumber(int);
void readDataFromFile(char[][32], char[][32], char[], int[]);
int countPeopleWithFirstName(char[][32], char[]);

//VJEŽBA 12 FUNKCIJE
int getArraySize();
void getArray(int*, int);
int getTargetNumber();
void findNumberInArray(int*, int, int);
int getNumber();
void formatNumToString(int, char[]);