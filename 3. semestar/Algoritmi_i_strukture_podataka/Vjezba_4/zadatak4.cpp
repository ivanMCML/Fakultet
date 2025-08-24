#include <stdio.h>
#include <stdlib.h>

#define FILE_NAME "polynomial.txt"

// 4. Napisati program za zbrajanje koeficijenata polinoma. Koeficijenti i eksponenti se čitaju iz datoteke.
// Napomena: Eksponenti u datoteci nisu nužno sortirani.


typedef struct _polynomial {
  float coefficient;
  int exponent;
  struct _polynomial* next;
} Polynomial;
  
int getSortedListFromFile(Polynomial*, const char*);
int createNewPolynomial(Polynomial*, float, int);
void sumPolynomials(Polynomial*);
void printPolynomial(Polynomial*);
void deleteList(Polynomial*);


int main() {

  Polynomial head;
  head.coefficient = 0;
  head.exponent = 0;
  head.next = NULL;

  int flag = 0;

  if (flag = getSortedListFromFile(&head, FILE_NAME))
    return flag;

  printPolynomial(head.next);

  sumPolynomials(&head);
  printPolynomial(head.next);

  deleteList(&head);
  return 0;
}



/// @brief Reads polynomials from file and pushes them to the list sorted
/// @param poly Polynomial pointer to the head of the list
/// @param fileName Name of the file
/// @return Returns 0 fi list is succesfully filled from file, 1 if could not open the file,
///         -1 if memory allocation failed
int getSortedListFromFile(Polynomial* poly, const char* fileName) {

  float coeff;
  int exp;
  Polynomial* head = poly;

  // Open the file
  FILE* fp = NULL;
  fp = fopen(fileName, "r");
  if (fp == NULL) {
    printf("\nFailed to open the file.");
    return 1;
  }

  // Read the file line by line
  while(fscanf(fp, " %f %d", &coeff, &exp) == 2) {
    
    // Find position for new polynomial
    while (poly->next != NULL && poly->next->exponent < exp) 
      poly = poly->next;
    
    // Create new polynomial
    if (createNewPolynomial(poly, coeff, exp)){
      fclose(fp);
      return -1;
    }
    poly = head;
  }

  fclose(fp);
  return 0;
}



/// @brief Creates new polynomial
/// @param polynomialBefore Polynomial pointer to the polynomial after which comes new one
/// @param coeff Coefficient of the new polynomial
/// @param exp Exponent of the new polynomial
/// @return Returns 0 if polynomial was successfully created, -1 if memory allocation failed
int createNewPolynomial(Polynomial* polynomialBefore, float coeff, int exp) {

  // Create new polynomial
  Polynomial* newPolynomial = NULL;
  newPolynomial = (Polynomial*)malloc(sizeof(Polynomial));
  if (newPolynomial == NULL) {
    printf("\nERROR! Memory allocation failed.");
    return -1;
  }

  newPolynomial->coefficient = coeff;
  newPolynomial->exponent = exp;

  // Connect element to the list
  newPolynomial->next = polynomialBefore->next;
  polynomialBefore->next = newPolynomial;

  return 0;
}


/// @brief Sum polynomials
/// @param poly Polynomial pointer to the head of the list
void sumPolynomials(Polynomial* poly) {

  Polynomial* tempPoly = NULL;

  // Go through each polynomial
  while ((poly = poly->next) != NULL) {
    tempPoly = poly;

    // Look for polynomials with same exponents
    while (tempPoly->next != NULL && tempPoly->next->exponent == poly->exponent) {
      tempPoly = tempPoly->next;

      // Sum polynomials
      poly->coefficient += tempPoly->coefficient;

      // Delete polynomial with same exponent
      poly->next = tempPoly->next;
      free(tempPoly);
      tempPoly = poly;
    }
  }
}


/// @brief Prints polynomial
/// @param poly Polynomial pointer to the first element of the list (head->next)
void printPolynomial(Polynomial* poly) {

  // Check if list is empty
  if (poly == NULL){
    printf("The list is empty");
    return;
  }

  // Print the first element of the polynomial
  printf("\n%fx^%d", poly->coefficient, poly->exponent);

  // Print rest of the polynomial's elements
  while ((poly = poly->next) != NULL) {
    printf("%s%fx^%d", poly->coefficient<0?" ":" +", poly->coefficient, poly->exponent);
  }
}


/// @brief Deletes the whole list
/// @param poly Polynomial pointer to the head of the list
void deleteList(Polynomial* poly) {
  Polynomial* toDelete = NULL;

  while((toDelete = poly->next) != NULL) {
    poly->next = toDelete->next;
    free(toDelete);
  }
}