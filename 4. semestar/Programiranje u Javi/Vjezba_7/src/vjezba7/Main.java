package vjezba7;

import java.util.Scanner;

public class Main {
  public static void main (String[] args) {

    Scanner skener = new Scanner(System.in);
    EvidencijaStudenata evidencija = new EvidencijaStudenata(20);
    boolean flag = true;

    while (flag) {
      System.out.println("Odaberi opciju:");
      System.out.println("1 - Dodaj studenta    2 - Ispisi studente s prosjecnom ocjenom visom od zadane");
      System.out.println("3 - Obrisi studenta   4 - Izlaz");

      int result = skener.nextInt();
      skener.nextLine();

      switch (result) {
        case 1:
          System.out.println("Ime: ");
          String ime = skener.nextLine();

          System.out.println("Prezime: ");
          String prezime = skener.nextLine();

          System.out.println("Broj indeksa: ");
          String brojIndeksa = skener.nextLine();

          System.out.println("Prosjek ocjena: ");
          double prosjek = skener.nextDouble();

          evidencija.dodajStudenta(new Student(ime, prezime, brojIndeksa, prosjek));
          System.out.println("Student dodan.");
          break;

        case 2:
          System.out.println("Najniza prosjecna ocjena: ");
          double minimalniProsjek = skener.nextDouble();

          evidencija.ispisiStudenteSVisokomOcjenom(minimalniProsjek);
          break;

        case 3:
          System.out.println("Unesi broj indeksa:");
          String indeks = skener.nextLine();

          evidencija.obrisiStudenta(indeks);
          break;

        case 4:
          flag = false;
          break;

        default:
          System.out.println("Molim, odaberite jednu od ponudjenih opcija.");
      }

    }

    skener.close();
  }
}