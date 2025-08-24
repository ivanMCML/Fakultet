// ZADATAK 2

#include <iostream>
#include <string>
using namespace std;

class Student {
  private:
    string ime;
    string prezime;
    string smjer;
    double prosjek;

  public:
    void Unos() {
      cout << "Unesite ime: ";
      cin >> ime;
      cout << "Unesite prezime: ";
      cin >> prezime;
      cout << "Unesite smjer: ";
      cin >> smjer;
      cout << "Unesite prosjek: ";
      cin >> prosjek;
    }

    void Ispis() const {
      cout << ime << " " << prezime << " | Smjer: " << smjer << " | Prosjek: " << prosjek << endl;
    }

    string DohvatiSmjer() const {
      return smjer;
    }

    double DohvatiProsjek() const {
      return prosjek;
    }

    bool operator<(const Student &drugi) const {
      return prosjek < drugi.prosjek;
    }

    bool operator>(const Student &drugi) const {
      return prosjek > drugi.prosjek;
    }
};

int main()
{
  const int n = 5;
  Student studenti[n];

  for (int i = 0; i < n; ++i) {
    cout << "\nUnos podataka za studenta " << i + 1 << ":\n";
    studenti[i].Unos();
  }

  for (int i = 0; i < n - 1; ++i) {
    for (int j = i + 1; j < n; ++j) {
      if (studenti[j] > studenti[i]) {
        swap(studenti[i], studenti[j]);
      }
    }
  }

  cout << "\n--- Sortirani studenti po prosjeku ---\n";
  for (int i = 0; i < n; ++i) {
    studenti[i].Ispis();
  }

  cout << "\n--- Studenti sa smjera 'računarstvo' i prosjekom većim od 3.0 ---\n";
  for (int i = 0; i < n; ++i) {
    if (studenti[i].DohvatiSmjer() == "racunarstvo" && studenti[i].DohvatiProsjek() > 3.0) {
      studenti[i].Ispis();
    }
  }

  return 0;
}
