#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define PUSH 1
#define POP 2
#define PRINT_STACK 3
#define ENQUEUE 4
#define DEQUEUE 5
#define PRINT_QUEUE 6
#define EXIT 0


// Napisati program koji pomoću vezanih listi simulira rad:
// a) stoga,
// b) reda s prioritetom (prioritet može biti od 1-5 i generira se slučajno, 
// a veći broj znači i veći prioritet).
// Napomena: Funkcija "push" sprema cijeli broj, slučajno generirani u opsegu od 10 -100.


typedef struct _stackNode {
  int number;
  struct _stackNode* next;
} StackNode;

typedef struct _queueNode {
  int number;
  int priority;
  struct _queueNode* next;
} QueueNode;



int push(StackNode*);
int pop(StackNode*);

int enqueue(QueueNode*);
int dequeueWithPriority(QueueNode*);

void printStack(StackNode*);
void printQueue(QueueNode*);

void deleteStack(StackNode*);
void deleteQueue(QueueNode*);


int main() {

  srand(unsigned(time(NULL)));

  StackNode stackHead;
  stackHead.number = -1;
  stackHead.next = NULL;

  QueueNode queueHead;
  queueHead.number = -1;
  queueHead.next = NULL;

  int flag = 0;

  while(flag >= 0) {
    printf("\nPush          %d", PUSH);
    printf("\nPop           %d", POP);
    printf("\nPrint stack   %d", PRINT_STACK);
    printf("\nEnqueue       %d", ENQUEUE);
    printf("\nDequeue       %d", DEQUEUE);
    printf("\nPrint queue   %d", PRINT_QUEUE);
    printf("\nExit          %d\n", EXIT);

    scanf(" %d", &flag);

    switch (flag)
    {
    case PUSH:
      flag = push(&stackHead);
      break;

    case POP:
      flag = pop(&stackHead);

      if(flag > 1)
        printf("\n%d poped\n", flag);
      break;

    case PRINT_STACK:
      printStack(stackHead.next);
      break;
    
    case ENQUEUE:
      flag = enqueue(&queueHead);
      break;

    case DEQUEUE:
      flag = dequeueWithPriority(&queueHead);

      if (flag > 2)
        printf("\n%d dequeued\n", flag);
      break;

    case PRINT_QUEUE:
      printQueue(queueHead.next);
      break;

    case EXIT:
      flag = -1;
      break;

    default:
      printf("\nPlease, enter one of the offered options.\n");
      flag = 0;
      break;
    }
  }

  deleteStack(&stackHead);
  deleteQueue(&queueHead);

  return 0;
}



/// @brief Pushes a new number (10-100) to the start of the stack list
/// @param head StackNode pointer to the head of the stack
/// @return Returns 0 if element was successfully created,
///         -1 if memory allocation failed
int push(StackNode* head) {

  // Create new element
  StackNode* newElement = NULL;
  newElement = (StackNode*)malloc(sizeof(StackNode));
  if (newElement == NULL) {
    printf("\nERROR! Memory allocation failed.");
    return -1;
  }

  newElement->number = (rand() % 91) + 10;

  // Conect new element to the list
  newElement->next = head->next;
  head->next = newElement;

  return 0;
}



/// @brief Pops the number from the top of the stack
/// @param head StackNode pointer to the head of the list
/// @return Returns the popped number, or 1 if the stack is empty.
int pop(StackNode* head) {

  int num = 0;
  StackNode* toDelete = NULL;

  // Check if stack is empty
  if (head->next == NULL) {
    printf("\nStack is empty.");
    return 1;
  }

  // Get the number from the top of the stack
  num = head->next->number;

  // Remove the element from the list and delete it
  toDelete = head->next;
  head->next = toDelete->next;

  free(toDelete);

  return num;
}



/// @brief Creates a new element (10-100) with priority (1-5) at the end of the queue list
/// @param priorityQueue QueueNode pointer to the head of the queue
/// @return Returns 0 if successfully enqueued, -1 if memory allocation failed
int enqueue(QueueNode* priorityQueue) {
  
  // Find the last element of the queue
  while(priorityQueue->next != NULL)
    priorityQueue = priorityQueue->next;

  // Create new element
  QueueNode* newElement = NULL;
  newElement = (QueueNode*)malloc(sizeof(QueueNode));
  if (newElement == NULL) {
    printf("\nERROR! Memory allocation failed.");
    return -1;
  }

  newElement->number = (rand() % 91) + 10;
  newElement->priority = (rand() % 5) +1;

  // Conect new element to the list
  priorityQueue->next = newElement;
  newElement->next = NULL;

  return 0;
}



/// @brief Dequeue the first element with heighest priority
/// @param head QueueNode pointer to the first element of the queue
/// @return Returns dequeued number, or 2 if queue is empty
int dequeueWithPriority(QueueNode* priorityQueue) {

  // Check if queue is empty
  if(priorityQueue->next == NULL) {
    printf("\nQueue is empty.");
    return 2;
  }

  priorityQueue->priority = -1;
  QueueNode* deleteNext = priorityQueue;
  int num = 0;

  // Find first element with max priority
  while(priorityQueue->next != NULL) {

    // If element has max priority (5) dequeue it
    if(priorityQueue->next->priority == 5) {
      deleteNext = priorityQueue;
      break;
    } 

    // If the next element has heigher priority, take it for current heighest priority
    if(priorityQueue->next->priority > deleteNext->next->priority)
      deleteNext = priorityQueue;

    priorityQueue = priorityQueue->next;
  }

  // Remove element from the queue
  priorityQueue = deleteNext;
  deleteNext = deleteNext->next;
  priorityQueue->next = deleteNext->next;

  // Get the number and delete the element
  num = deleteNext->number;
  
  free(deleteNext);
  return num;
}



/// @brief Prints the stack list
/// @param stackPointer StackNode pointer to the first element of the list (head->next) 
void printStack(StackNode* stackPointer) {

  // Check if the stack is empty
  if(stackPointer == NULL) {
    printf("\nStack is empty.");
    return;
  }

  // Print stack from the latest to the oldest element
  printf("\nLatest -> ");
  while (stackPointer != NULL) {
    printf(" %d", stackPointer->number);
    stackPointer = stackPointer->next;
  }
  printf("  <-Oldest\n");
}


/// @brief Prints the queue list
/// @param queuePointer QueueNode pointer to the first element of the list (head->next) 
void printQueue(QueueNode* queuePointer) {

  // Check if the queue is empty
  if(queuePointer == NULL) {
    printf("\nQueue is empty.");
    return;
  }

  // Print queue from the oldest to the latest element
  printf("\nOldest -> ");
  while (queuePointer != NULL) {
    printf(" num: %d  priority: %d ", queuePointer->number, queuePointer->priority);
    queuePointer = queuePointer->next;
  }
  printf("  <-Latest\n");
}



/// @brief Deletes the whole stack list
/// @param head StackNode pointer to the head of the stack list
void deleteStack(StackNode* head) {

  StackNode* toDelete = NULL;

  while(head->next != NULL) {
    toDelete = head->next;
    head->next = toDelete->next;
    free(toDelete);
  }
}


/// @brief Deletes the whole queue list
/// @param head QueueNode pointer to the head of the queue list
void deleteQueue(QueueNode* head) {

  QueueNode* toDelete = NULL;

  while(head->next != NULL) {
    toDelete = head->next;
    head->next = toDelete->next;
    free(toDelete);
  }
}
