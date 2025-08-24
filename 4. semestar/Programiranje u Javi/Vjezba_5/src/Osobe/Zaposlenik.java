package Osobe;

// Klasa Zaposlenik koja nasljeđuje apstraktnu klasu Osoba
public class Zaposlenik extends Osoba {
  private String radnoMjesto;

  // Konsturktor
  public Zaposlenik(String ime, String prezime, String radnoMjesto) {
    super(ime, prezime);
    this.radnoMjesto = radnoMjesto;
  }

  // Override apstraktne funkcije 
  @Override
  public void ispisDetalja() {
    System.out.println("Ime: " + getIme());
    System.out.println("Prezime: " + getPrezime());
    System.out.println("Radno mjesto: " + radnoMjesto);
  }
}
