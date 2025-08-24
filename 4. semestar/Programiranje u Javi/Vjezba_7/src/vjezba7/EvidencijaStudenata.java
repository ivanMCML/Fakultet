package vjezba7;

public class EvidencijaStudenata {
  
  private Student[] studenti;
  private int brojStudenata;

  public EvidencijaStudenata(int kapacitet) {
    studenti = new Student[kapacitet];
    brojStudenata = 0;
  }

  public void dodajStudenta(Student noviStudent) {
    if (brojStudenata < studenti.length) {
      studenti[brojStudenata++] = noviStudent;
    } else {
      System.out.println("Nema više mjesta u evidenciji!");
    }
  }

  public void ispisiStudenteSVisokomOcjenom(double granica) {
    for(int i = 0; i < brojStudenata; i++) {
      if (studenti[i].getProsjecnaOcjena() > granica) {
        System.out.println(studenti[i].getIme() + " " + studenti[i].getPrezime());
        System.out.println("Broj indeksa: " + studenti[i].getBrojIndeksa());
        System.out.println("Prosjecna ocjena: " + studenti[i].getProsjecnaOcjena());
        System.out.println();
      }
    }
  }

  public void obrisiStudenta(String brojIndeksa) {
    for(int i = 0; i < brojStudenata; i++) {
      if (studenti[i].getBrojIndeksa().equals(brojIndeksa)) {
        for(int j = i; j < brojStudenata - 1; j++) {
          studenti[j] = studenti[j + 1];
        }
        brojStudenata--;
        return;
      }
    }
    System.out.println("Student s tim indeksom nije pronadjen!");
  }
}