package vjezba7;

public class Student {

  private String ime; 
  private String prezime;
  private String brojIndeksa;
  private double prosjecnaOcjena;

  public Student(String ime, String prezime, String brojIndeksa, double prosjecnaOcjena) {
    this.ime = ime;
    this.prezime = prezime;
    this.brojIndeksa = brojIndeksa;
    this.prosjecnaOcjena = prosjecnaOcjena;
  }

public String getIme() {
  return ime;
}

public String getPrezime () {
  return prezime;
}

public String getBrojIndeksa() {
  return brojIndeksa;
}

public double getProsjecnaOcjena() {
  return prosjecnaOcjena;
}

public void setProsjecnaOcjena(double prosjecnaOcjena) {
  this.prosjecnaOcjena = prosjecnaOcjena;
} 

}