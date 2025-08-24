package Osobe;

// Apstraktna klasa osobe
public abstract class Osoba {
  private String ime;
  private String prezime;

  // Konstruktor
  public Osoba(String ime, String prezime) {
    this.ime = ime;
    this.prezime = prezime;
  }

  // Geter za ime
  public String getIme() {
    return ime;
  }

  // Geter za prezime
  public String getPrezime() {
    return prezime;
  }

  // Apstraktna metoda za ispis detalja
  public abstract void ispisDetalja(); 
}
