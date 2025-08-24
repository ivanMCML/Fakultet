package Kalkulator;

import java.util.Scanner;

public class Main {
  public static void main(String[] args) {
    
    //Konfiguriraj skener
    Scanner skener = new Scanner(System.in);

    // Zatraži od korisnika unos dva broja i operacije
    System.out.println("Unesi prvi broj: ");
    int prviBroj = skener.nextInt();

    System.out.println("Unesi drugi broj: ");
    int drugiBroj = skener.nextInt();

    boolean flag = false;
    char operacija = ' ';

    while(!flag) {
      
      System.out.println("Unesi operaciju (+, -, *, /):");
      operacija = skener.next().charAt(0);

      switch (operacija) {
        case '+':
        case '-':
        case '*':
        case '/':
          flag = true;
          break;
        default:
          break;
      }
    }

    switch (operacija) {
      case '+':
        System.out.println(prviBroj + drugiBroj);
        break;
      case '-':
        System.out.println(prviBroj - drugiBroj);
        break;
      case '*':
        System.out.println(prviBroj * drugiBroj);
        break;
      case '/':
        if (drugiBroj == 0) {
          System.out.println("Nije moguće dijeliti s 0.");
          break;  
        }
        System.out.println(prviBroj / drugiBroj);
        break;
      default:
        System.out.println("Neispravna operacija");
        break;
    }    
    
    skener.close();
  }
}
