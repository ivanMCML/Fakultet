package Osobe;

public class Main {
  public static void main(String[] args) {
    
    // Kreiraj niz od 6 osoba, odčega će troje biti studenti, a troje zaposlenici
    Osoba[] ljudi = new Osoba[] {
      new Student("Ante", "Šalinović", "00231234567"),
      new Student("Marino", "Marijanović", "00237654321"),
      new Student("Ivan", "Bebić", "0023160559"),
      new Zaposlenik("Marko", "Markić", "Asistent"),
      new Zaposlenik("Lana", "Lanić", "Profesor"),
      new Zaposlenik("Nikola", "Nikolić", "Administrator")
    };

    for(Osoba o : ljudi) {
      o.ispisDetalja();
    }
  }
}
