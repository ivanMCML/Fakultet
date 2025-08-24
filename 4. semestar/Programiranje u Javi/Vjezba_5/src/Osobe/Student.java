package Osobe;

// Podklasa Student apstraktne klase Osoba
public class Student extends Osoba{
  private String brojIndeksa;

  // Konstruktor
  public Student(String ime, String prezime, String brojIndeksa) {
    super(ime, prezime);
    this.brojIndeksa = brojIndeksa;
  }

  // Override funkcije apstraktne klase
  @Override
  public void ispisDetalja() {
    System.out.println("Ime: " + getIme());
    System.out.println("Prezime: " + getPrezime());
    System.out.println("Broj indeksa: " + brojIndeksa);
  }
}
