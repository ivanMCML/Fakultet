#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define FILE_NAME "persons.txt"
#define ADD_TO_FRONT 1
#define ADD_TO_BACK 2
#define ADD_IN_FRONT 3
#define ADD_BEHIND 4
#define FIND_BY_LAST_NAME 5
#define DEL_BY_LAST_NAME 6
#define DEL_LIST 7
#define PRINT_TO_FILE 8
#define GET_FROM_FILE 9
#define PRINT_LIST 10
#define EXIT 0


// 2. Definirati strukturu osoba (ime, prezime, godina rođenja) i napisati program koji:
// a) dinamički dodaje novi element na početak liste,
// b) ispisuje listu,
// c) dinamički dodaje novi element na kraj liste,
// d) pronalazi element u listi (po prezimenu),
// e) briše određeni element iz liste.
// U zadatku se ne smiju koristiti globalne varijable.
// 3. Prethodnom zadatku dodati funkcije:
// a) dinamički dodaje novi element iza određenog elementa,
// b) dinamički dodaje novi element ispred određenog elementa,
// c) upisuje listu u datoteku,
// d) čita listu iz datoteke sortirano. 


/// @brief struct for linked list that describes persons
typedef struct _person {
  char firstName[32];
  char lastName[32];
  int yearOfBirth;
  struct _person* next;
} Person;

int pushToFront(Person*, char*, char*, int);
int pushToBack(Person*, char*, char*, int);
int pushInFront(Person*, char*, char*, char*, int);
int pushBehind(Person*, char*, char*, char*, int);

Person* findByLastName(Person*, char*);

int deleteByLastName(Person*, char*);
int deleteNextPerson(Person*);
void deleteList(Person*);

int printListToFile(Person*, const char*);
int getSortedListFromFile(Person*, const char*);
void printList(Person*);


int main() {

  Person head;
  strcpy(head.firstName, "");
  strcpy(head.lastName, "");
  head.yearOfBirth = -1;
  head.next = NULL;

  Person* personBefore = NULL;
  int flag = 0;
  char name[32];
  char surname[32];
  int year;
  char target[32];

  // Run the program until error or user exit it
  while (flag >= 0) {

    // Offer options
    printf("\n%d\tAdd new person to the start of the list", ADD_TO_FRONT);
    printf("\n%d\tAdd new person to the end of the list", ADD_TO_BACK);
    printf("\n%d\tAdd new person before targeted person", ADD_IN_FRONT);
    printf("\n%d\tAdd new person after targeted person", ADD_BEHIND);
    printf("\n%d\tFind person by last name, and print information", FIND_BY_LAST_NAME);
    printf("\n%d\tDelete targeted person", DEL_BY_LAST_NAME);
    printf("\n%d\tDelete the whole list", DEL_LIST);
    printf("\n%d\tPrint the list to the file", PRINT_TO_FILE);
    printf("\n%d\tGet list from file sorted (deletes previous list first)", GET_FROM_FILE);
    printf("\n%d\tPrint list to the console", PRINT_LIST);
    printf("\n%d\tExit program\n", EXIT);

    // Run chosen option
    scanf(" %d", &flag);
    switch (flag)
    {
    case ADD_TO_FRONT:
      printf("\nFirst name: ");
      scanf(" %s", name);
      printf("\nLast name: ");
      scanf(" %s", surname);
      printf("\nYear of birth: ");
      scanf(" %d", &year);

      flag = pushToFront(&head, name, surname, year);
      break;
    
    case ADD_TO_BACK:
      printf("\nFirst name: ");
      scanf(" %s", name);
      printf("\nLast name: ");
      scanf(" %s", surname);
      printf("\nYear of birth: ");
      scanf(" %d", &year);

      flag = pushToBack(&head, name, surname, year);
      break;
    
    case ADD_IN_FRONT:
      printf("\nLast name of the target: ");
      scanf(" %s", target);
      printf("\nFirst name: ");
      scanf(" %s", name);
      printf("\nLast name: ");
      scanf(" %s", surname);
      printf("\nYear of birth: ");
      scanf(" %d", &year);

      flag = pushInFront(&head, target, name, surname, year);
      break;
    
    case ADD_BEHIND:
      printf("\nLast name of the target: ");
      scanf(" %s", target);
      printf("\nFirst name: ");
      scanf(" %s", name);
      printf("\nLast name: ");
      scanf(" %s", surname);
      printf("\nYear of birth: ");
      scanf(" %d", &year);

      flag = pushBehind(&head, target, name, surname, year);
      break;

    case FIND_BY_LAST_NAME:
      printf("\nLast name of the target: ");
      scanf(" %s", target);

      personBefore = findByLastName(&head, target);
      if (personBefore->next == NULL)
        break;
      printf("\n%s\t%s\t%d", personBefore->next->firstName, personBefore->next->lastName, personBefore->next->yearOfBirth);
      break;

    case DEL_BY_LAST_NAME:
      printf("\nLast name of the target: ");
      scanf(" %s", target);

      personBefore = findByLastName(&head, target);
      flag = deleteNextPerson(personBefore);
      break;

    case DEL_LIST:
      deleteList(&head);
      break;

    case PRINT_TO_FILE:
      flag = printListToFile(&head, FILE_NAME);
      break;

    case GET_FROM_FILE:
      deleteList(&head);
      flag = getSortedListFromFile(&head, FILE_NAME);
      break;

    case PRINT_LIST:
      printList(head.next);
      break;

    case EXIT:
      flag = -1;
      break;

    default:
      printf("\n\nPlease, enter one of the offered options\n\n");
      break;
    }
  }

  deleteList(&head);
  return 0;
}




/// @brief Creates new person.
/// @param person Pointer to the person after which new person will be added (typically head of the list) 
/// @param name First name of the person
/// @param surname Last name of the person
/// @param year Year of birth
/// @return Returns 0 if the person was created successfully,
///         returns -1 if memory allocation failed
int pushToFront(Person* person, char* name, char* surname, int year) {
  
  // Create a new person
  Person* newPerson = NULL;
  newPerson = (Person*)malloc(sizeof(Person));

  if (newPerson == NULL) {
    printf("\nERROR! Memory allocation for new person failed!");
    return -1;
  }

  strcpy(newPerson->firstName, name);
  strcpy(newPerson->lastName, surname);
  newPerson->yearOfBirth = year;


  // Link new person to the linked list
  newPerson->next = person->next;
  person->next = newPerson;

  return 0;
}


/// @brief Creates a new person at the end of the list
/// @param person Pointer to the head of the list
/// @param name First name of the person
/// @param surname Last name of the person
/// @param year Year of birth
/// @return Returns 0 if the person was created successfully,
///         returns -1 if memory allocation failed
int pushToBack(Person* person, char* name, char* surname, int year) {

  // Find the end of the list
  while(person->next != NULL)
    person = person->next;

  // Create a new person at the end of the list
  return pushToFront(person, name, surname, year);
}


/// @brief Creates a new person before the targeted person
/// @param person Person pointer to the head of the list
/// @param targetLastName Last name of the person before which the new person will be added
/// @param name First name of the new person
/// @param surname Last name of the new person
/// @param year Year of birth of the new person
/// @return Returns 0 if person was created successfully,
///         -1 if memory allocation failed, and 1 if targeted person was not found
int pushInFront(Person* person, char* targetLastName, char* name, char* surname, int year) {

  person = findByLastName(person, targetLastName);
  if (person->next == NULL)
    return 1;

  return pushToFront(person, name, surname, year);
}


/// @brief Creates a new person after the targeted person
/// @param person Person pointer to the head of the list
/// @param targetLastName Last name of the person after which the new person will be added
/// @param name First name of the new person
/// @param surname Last name of the new person
/// @param year Year of birth of the new person
/// @return Returns 0 if person was created successfully,
///         -1 if the memory allocation failed, and 1 if targeted person was not found
int pushBehind(Person* person, char* targetLastName, char* name, char* surname, int year) {
 
  person = findByLastName(person, targetLastName);
  if (person->next == NULL)
    return 1;
 
  return pushToFront(person->next, name, surname, year);
}



/// @brief Looks for person with a specific last name
/// @param person Person pointer to the head of the list
/// @param surname Last name of the person to find
/// @return Returns pointer to the person before one with the matching last name
Person* findByLastName(Person* person, char* surname) {

  while (person->next != NULL &&  strcmp(person->next->lastName, surname))
    person = person->next;

  if (person->next == NULL)
    printf("\nTarget not found!");

  return person;
}



/// @brief Delets the person with matching last name
/// @param person Person pointer to the head of the list
/// @param surname Last name of the person to delete
/// @return Returns 0 if deletion was successful, or 1 if person not found
int deleteByLastName(Person* person, char* surname) {

  person = findByLastName(person, surname);
  return deleteNextPerson(person);
}


/// @brief Delets the person that comes after the given one
/// @param person Pointer to the person before one to delete
/// @return Returns 0 if deletion was successful, or 1 if person not found
int deleteNextPerson(Person* person) {

  Person* personToDelete = NULL;

  // Check if person exists in the list
  if (person == NULL || person->next == NULL)
    return 1;

  // Connect list elements
  personToDelete = person->next;
  person->next = personToDelete->next;

  // Delete the person
  free(personToDelete);
  return 0;
}


/// @brief Deletes the whole list 
/// @param head Person pointer to the head of the list
void deleteList(Person* head){

  while(head->next != NULL)
    deleteNextPerson(head);
}


/// @brief Print the list of persons into the file
/// @param person Person pointer to the head of the list
/// @param fileName Name of the file
/// @return 0 if data successfully printed into the file, -2 if failed to open the file
int printListToFile(Person* person, const char* fileName) {

  // Open the file for writing
  FILE* fp = NULL;
  fp = fopen(fileName, "w");
  if (fp == NULL) {
    printf("\nERROR! Failed to open the file.");
    return -2;
  }

  // Print the list into the file
  while ((person = person->next) != NULL)
    fprintf(fp, "%s\t%s\t%d\n", person->firstName, person->lastName, person->yearOfBirth);
  
  fclose(fp);
  return 0;
}


/// @brief Fill the empty list sorted with person data from the file
/// @param person Person pointer to the head of the empty list
/// @param fileName File name
/// @return Returns 0 if the list was filled successfully, -1 if memory allocation failed
///         2 if file could not be opened
int getSortedListFromFile(Person* person, const char* fileName) {

  char name[32];
  char surname[32];
  int year;

  Person* head = person;

  // Open the file for reading
  FILE* fp = NULL;
  fp = fopen(fileName, "r");
  if (fp == NULL) {
    printf("Failed to open the file. Please, check if file exists.");
    return 2;
  }

  // Read file line by line
  while (fscanf(fp, " %s %s %d", name, surname, &year) == 3) {

    // Find the person alphabetically before new one
    while (person->next != NULL && strcmp(person->next->lastName, surname) < 0)
      person = person->next;
    while (person->next != NULL && strcmp(person->next->lastName, surname) == 0 && 
    strcmp(person->next->firstName, name) < 0)
      person = person->next;

    // Insert new person to the list
    if (pushToFront(person, name, surname, year)) {
      fclose(fp);
      return 1;
    }
    person = head;
  }

  fclose(fp);
  return 0;
}


/// @brief Prints the first name, last name and year of birth for each person in the list
/// @param person Person pointer to the first person in the list (head->next) 
void printList(Person* person) {
  
  while (person != NULL) {
    printf("\n%s\t%s\t%d", person->firstName, person->lastName, person->yearOfBirth);
    person = person->next;
  }
}
