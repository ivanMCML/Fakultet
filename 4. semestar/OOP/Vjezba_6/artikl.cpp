#include <iostream>
#include <string>

using namespace std;


class Artikl {
  private:
    string name;
    float price;
    int amount;

  public:
    Artikl(string name, float price, int amount) {
      this->name = name;
      this->price = price;
      this->amount = amount;
    }

    void setName(string name) {
      this->name = name;
    }

    string getName() {
      return name;
    }

    void setPrice(float price) {
      if (price > 0) {
        this->price = price;
      }
    }

    float getPrice() {
      return price;
    }

    void setAmount(int amount) {
      if (amount >= 0) {
        this->amount = amount;
      }
    }

    int getAmount() {
      return amount;
    }

    void addToAmount(int pieces) {
      if (pieces > 0) {
        amount += pieces;
      }
    }

    void getAPiece() {
      if (amount > 0) {
        amount--;
      }
    }

};

class Automat {

  private:
    float balance = 0;
    Artikl artikli[4] = {{"bomboni", 2.99, 10}, {"cips", 1.39, 10}, {"sladoled", 2.29, 10}, {"kroasan", 1.79, 10}};

  public:
    void buyArticle() {

      for(int i = 0; i < 4; i++) {
        cout << artikli[i].getName() + " " << artikli[i].getPrice() << i << endl;
      }

      int type;
      cin >>  type;

      if (artikli[type].getAmount() < 1) {
        cout << "Artikl nije dostupan!" << endl;
        return;
      }

      float paid = 0;
      while(true) {
        cout << "Plati: " << endl;
        
        float pay;
        cin >> pay;

        paid += pay;
        if (paid >= artikli[type].getPrice()) {
          cout << "Kusur: " << paid - artikli[type].getPrice() << endl;
          artikli[type].getAPiece();
          balance += artikli[type].getPrice();
          return;
        }
      }    
    }

};


int main() {

  Automat aparat;
  aparat.buyArticle();

  return 0;
}