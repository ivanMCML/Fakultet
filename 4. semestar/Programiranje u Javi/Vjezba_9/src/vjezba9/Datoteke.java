package vjezba9;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.nio.file.InvalidPathException;
import java.nio.file.Paths;
import java.util.Scanner;

public class Datoteke {
  public static void main(String[] args) {
    Scanner skener = new Scanner(System.in);

    System.out.println("Unesite put do ulazne datoteke (student.txt): ");
    String ulaznaPutanja = skener.nextLine();

    System.out.println("Unesite put do izlazne datoteke (izlaz.txt): ");
    String izlaznaPutanja = skener.nextLine();

    try {
      Paths.get(ulaznaPutanja);
      Paths.get(izlaznaPutanja);
    } catch (InvalidPathException e) {
      System.out.println("Nevažeća putanja datoteke.");
      return;
    }

    try (BufferedReader reader = new BufferedReader(new FileReader(ulaznaPutanja));
      BufferedWriter writer = new BufferedWriter(new FileWriter(izlaznaPutanja))) {

      String linija;
      while ((linija = reader.readLine()) != null) {
        writer.write(linija.toUpperCase());
        writer.newLine();
      }

      System.out.println("Podaci su uspješno pročitani i zapisani u " + izlaznaPutanja);

    } catch (IOException e) {
      System.out.println("Došlo je do greške pri radu s datotekama: " + e.getMessage());
    }
    }
}
