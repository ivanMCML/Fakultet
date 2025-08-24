package studenti;

public class Main {
  public static void main(String[] args) {
    // Kreiraj objekte prvog i drugog studenta
    Student prviStudent = new Student("Ivan", "Bebić", 2005, 2);
    Student drugiStudent = new Student("Karlo", "Volarević", 2004, 2);

    // Ispiši informacije za prvog i drugog studenta
    prviStudent.ispisiInformacije();
    drugiStudent.ispisiInformacije();
  }
}
