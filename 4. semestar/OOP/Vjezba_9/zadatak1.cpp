#include <iostream>

using namespace std;


class GeometrijskiLik {
  protected:
    float visina;
    float sirina;

  public:
    GeometrijskiLik(float visina, float sirina) {
      this->visina = visina;
      this->sirina = sirina;
    }

    virtual float povrsina() const {
      return 0;
    }
};

class Pravokutnik : public GeometrijskiLik {
  public:
    Pravokutnik(float visina, float sirina) : GeometrijskiLik(visina, sirina) {
      this->visina = visina;
      this->sirina = sirina;
    }

    float povrsina() const override {
      return visina * sirina;
    }
};

class Trokut : public GeometrijskiLik {
  public:
    Trokut(float visina, float sirina) : GeometrijskiLik(visina, sirina) {
      this->visina = visina;
      this->sirina = sirina;
    }

    float povrsina() const override {
      return visina * sirina / 2;
    }
};

int main() {
  GeometrijskiLik* likovi[4];

  likovi[0] = new Pravokutnik(4, 5);
  likovi[1] = new Trokut(3, 6);
  likovi[2] = new Pravokutnik(7, 2);
  likovi[3] = new Trokut(5, 4);

  for (int i = 0; i < 4; ++i) {
    cout << "Povrsina lika " << i + 1 << ": " << likovi[i]->povrsina() << endl;
  }

  for (int i = 0; i < 4; ++i) {
    delete likovi[i];
  }

  return 0;
}
