package studenti;

public class Student {
  private String ime;
  private String prezime;
  private int godinaRodjenja;
  private int godinaStudija;

  // Konstruktor
  public Student(String ime, String prezime, int godinaRodjenja, int godinaStudija) {
    this.ime = ime;
    this.prezime = prezime;
    this.godinaRodjenja = godinaRodjenja;
    this.godinaStudija = godinaStudija;
  }

  // Ispis informacija
  public void ispisiInformacije() {
    System.out.println("Ime: " + ime);
    System.out.println("Prezime: " + prezime);
    System.out.println("Godina rodjenja: " + godinaRodjenja);
    System.out.println("Godina studija: " + godinaStudija);
  }
}
