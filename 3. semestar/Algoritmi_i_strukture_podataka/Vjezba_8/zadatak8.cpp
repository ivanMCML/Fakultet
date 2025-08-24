#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>


// 8. Napisati program koji iz datoteke čita postfiks izraz i zatim korištenjem stoga računa rezultat. Stog
// je potrebno realizirati preko vezane liste. 

typedef struct _NumList* Position;

typedef struct _NumList {

	int number;
	Position next;

}NumList;

int getPostfix(Position, char*);
int pushNumber(Position, int);
int getResult(Position, char*);
int popNumbers(Position, int*, int*);
void deleteElement(Position);
void deleteList(Position);

int main() {

	FILE* fp;
	int result = 0;
	char rijec[5]="";

	NumList Postfix;
	Postfix.number = -1;
	Postfix.next = NULL;

	fp = fopen("postfix.txt", "r");
	if (fp == NULL) {
		printf("\nERROR! File not opened!");
		return -1;
	}

	while (!feof(fp) && result != -1) {
		
		fscanf(fp, " %s", rijec);
		result = getPostfix(&Postfix, rijec);
		strcpy(rijec, "");
	}

	fclose(fp);

	if (Postfix.next->next != NULL) {
		printf("\nERROR! Neispravan format datoteke!");
		deleteList(&Postfix);
		return -1;
	}

	printf("\nRezultat: %d", Postfix.next->number);
	deleteList(&Postfix);

	return result;
}


int getPostfix(Position P, char* c) {

	if (isdigit(*c)) {
		return pushNumber(P, atoi(c));
	}

	return getResult(P, c);
}

int pushNumber(Position P, int num) {

	Position NewElement = NULL;

	NewElement = (Position)malloc(sizeof(NumList));
	if (NewElement == NULL) {
		printf("\nERROR! Memory not allocated!");
		return -1;
	}

	NewElement->number = num;
	NewElement->next = P->next;
	P->next = NewElement;

	return 0;
}

int getResult(Position P, char* c) {

	int a = 0;
	int b = 0;

	if (popNumbers(P, &a, &b)) {
		return -1;
	}

	switch (*c)
	{
	case '+':
		a += b;
		break;
	case '-':
		a -= b;
		break;
	case '*':
		a *= b;
		break;
	case '/':
		a /= b;
		break;
	default:
		printf("\nERROR! Neispravan format datoteke!");
		return -1;
		break;
	}

	return pushNumber(P, a);
}

int popNumbers(Position P, int* a, int* b) {

	Position temp = NULL;

	if (P->next == NULL) {
		printf("\nERROR! Neispravan postfiks izraz!");
		return -1;
	}

	*a = P->next->number;
	deleteElement(P);


	if (P->next == NULL) {
		printf("\nERROR! Neispravan postfiks izraz!");
		return -1;
	}

	*b = P->next->number;
	deleteElement(P);

	return 0;
}

void deleteElement(Position P) {

	Position del = NULL;

	del = P->next;
	P->next = del->next;

	free(del);
}

void deleteList(Position P) {

	while (P->next != NULL)
	{
		deleteElement(P);
		P = P->next;
	}
}