#include <iostream>

using namespace std;

class Integers {
  private:
    int* niz;
    int* length;

  public:
    Integers() {
      niz = new int[100];
      length = new int;
      *length = 0;
    }

    Integers(const Integers& original) {
      niz = new int[100];
      length = new int;

      *length = *original.length;
      for (int i = 0; i < (*length); i++) {
        niz[i] = original.niz[i];
      }
    }

    ~Integers() {
      delete[] niz;
      delete length;
    }

    int push(int number) {
      if ((*length) > 99) {
        cout << "Niz je pun!" << endl;
        return 1;
      }

      niz[*length] = number;
      (*length)++;

      return 0;
    }

    int pop() {
      if(*length)
        cout << "Niz je vec prazan!" << endl;

      (*length)--;
      return niz[(*length)];
    }

    void printArray() {
      for(int i = 0; i < (*length); i++)
        cout << niz[i] << endl;
    }
};

int main()
{
	Integers prvi;

	prvi.push(1);
	prvi.push(9);
	prvi.push(5);
	prvi.pop();

	Integers drugi = prvi;
	drugi.push(1);

	prvi.printArray();
	drugi.printArray();

	return 0;
}