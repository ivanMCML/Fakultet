#include <stdio.h>
#include <stdlib.h>


// Napisati program koji prvo pročita koliko redaka ima datoteka, tj. koliko ima studenata zapisanih u
// datoteci. Nakon toga potrebno je dinamički alocirati prostor za niz struktura studenata (ime, prezime,
// bodovi) i učitati iz datoteke sve zapise. Na ekran ispisati ime, prezime te broj bodova.
// Napomena: Svaki redak datoteke sadrži ime i prezime studenta, te broj bodova na kolokviju.


typedef struct _student
{
  char firstName[32];
  char lastName[32];
  int points;
} Student;

int main() {

  int lines = 0;
  Student* students = NULL;
  FILE* fp = NULL;
  char buffer[32];

  // Open the file and check if succeeded
  fp = fopen("studenti.txt", "r");
  if (fp == NULL) {
    printf("\nFailed to open the file!");
    return 1;
  }

  // Count students in the file
  while (!feof(fp)) {
    fgets(buffer, 1024, fp);
    lines++;
  }

  // Close the file
  fclose(fp);

  // Allocate memory for each student in the file and check if allocation succeeded
  students = (Student*)calloc(lines, sizeof(Student));
  if (students == NULL) {
    printf("\nERROR! Failed to allocate memory.");
    return -1;
  }

  // Open the file and check if succeeded
  fp = fopen("studenti.txt", "r");
  if (fp == NULL) {
    printf("\nFailed to open the file!");
    return 1;
  }

  // Store information about students into students array
  for (int i = 0; i < lines; i++) {
    fscanf(fp, " %s %s %d", students->firstName, students->lastName, &students->points);
    students++;
  }

  // Close the file
  fclose(fp);

  // Return students pointer to the first student of the array
  students -= lines;

  // Print students names and their results
  for (int i = 0; i < lines; i++) {
    printf("\n%s\t%s\t%d", students->firstName, students->lastName, students->points);
    students++;
  }

  // Return students pointer to the first student of the array
  students -= lines;

  // Free the memory
  free(students);

  return 0;
};
