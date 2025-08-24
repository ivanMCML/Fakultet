#include <iostream>
#include <string>
#include <array>
using namespace std;

class Kolegij {
public:
    string nazivKolegija;
    int ocjena;

    Kolegij(string naziv = "", int ocjena = 0) : nazivKolegija(naziv), ocjena(ocjena) {}
};

class Student {
protected:
    string ime, prezime;
    string brojIndeksa;
    int godinaStudija;
    double prosjek;
    array<Kolegij, 3> listaKolegija;

public:
    Student(string ime, string prezime, string brojIndeksa)
        : ime(ime), prezime(prezime), brojIndeksa(brojIndeksa), godinaStudija(1), prosjek(0.0) {
    }

    virtual ~Student() {}

    void IzlazNaIspit(int sifraKolegija) {
        if (sifraKolegija < 0 || sifraKolegija >= 3) {
            cout << "Neispravna sifra kolegija." << endl;
            return;
        }
        int ocjena;
        cout << "Unesite ocjenu za " << listaKolegija[sifraKolegija].nazivKolegija << ": ";
        cin >> ocjena;
        listaKolegija[sifraKolegija].ocjena = ocjena;
        IzracunajProsjek();
    }

    virtual void UpisiPrvuGodinu() = 0;
    virtual void UpisiDruguGodinu() = 0;

protected:
    void IzracunajProsjek() {
        int suma = 0;
        for (const auto& kolegij : listaKolegija) {
            suma += kolegij.ocjena;
        }
        prosjek = suma / 3.0;
    }

    bool SveOcjenePozitivne() {
        for (const auto& kolegij : listaKolegija) {
            if (kolegij.ocjena < 2) return false;
        }
        return true;
    }
};

class StudentRacunarstva : public Student {
private:
    int brojOdradjenihVjezbiNaRacunalu;

public:
    StudentRacunarstva(string ime, string prezime, string indeks)
        : Student(ime, prezime, indeks), brojOdradjenihVjezbiNaRacunalu(0) {
    }

    void UpisiPrvuGodinu() override {
        listaKolegija = { Kolegij("Programiranje", 0), Kolegij("Baze", 0), Kolegij("Internet", 0) };
        cout << ime << " " << prezime << " upisan u prvu godinu racunarstva." << endl;
    }

    void OdradiVjezbe(int brojSati) {
        brojOdradjenihVjezbiNaRacunalu += brojSati;
    }

    void UpisiDruguGodinu() override {
        if (brojOdradjenihVjezbiNaRacunalu > 100 && SveOcjenePozitivne()) {
            cout << "Student prelazi u drugu godinu s prosjekom: " << prosjek << endl;
            godinaStudija = 2;
            listaKolegija = { Kolegij("Programiranje2", 0), Kolegij("Baze2", 0), Kolegij("Internet2", 0) };
        }
        else {
            cout << "Student ne ispunjava uvjete za upis u drugu godinu racunarstva." << endl;
        }
    }
};

class StudentBrodogradnje : public Student {
private:
    int brojOdradjenihVjezbiKonstrukcije;

public:
    StudentBrodogradnje(string ime, string prezime, string indeks)
        : Student(ime, prezime, indeks), brojOdradjenihVjezbiKonstrukcije(0) {
    }

    void UpisiPrvuGodinu() override {
        listaKolegija = { Kolegij("Konstrukcija", 0), Kolegij("Statika", 0), Kolegij("Dinamika", 0) };
        cout << ime << " " << prezime << " upisan u prvu godinu brodogradnje." << endl;
    }

    void OdradiVjezbe(int brojSati) {
        brojOdradjenihVjezbiKonstrukcije += brojSati;
    }

    void UpisiDruguGodinu() override {
        if (brojOdradjenihVjezbiKonstrukcije > 100 && SveOcjenePozitivne()) {
            cout << "Student prelazi u drugu godinu s prosjekom: " << prosjek << endl;
            godinaStudija = 2;
            listaKolegija = { Kolegij("Konstrukcija2", 0), Kolegij("Statika2", 0), Kolegij("Dinamika2", 0) };
        }
        else {
            cout << "Student ne ispunjava uvjete za upis u drugu godinu brodogradnje." << endl;
        }
    }
};

// Testiranje
int main() {
    StudentRacunarstva s1("Ivan", "Ivic", "RA123");
    s1.UpisiPrvuGodinu();
    s1.OdradiVjezbe(120);
    s1.IzlazNaIspit(0);
    s1.IzlazNaIspit(1);
    s1.IzlazNaIspit(2);
    s1.UpisiDruguGodinu();

    cout << endl;

    StudentBrodogradnje s2("Ana", "Anic", "BR456");
    s2.UpisiPrvuGodinu();
    s2.OdradiVjezbe(110);
    s2.IzlazNaIspit(0);
    s2.IzlazNaIspit(1);
    s2.IzlazNaIspit(2);
    s2.UpisiDruguGodinu();

    return 0;
}
