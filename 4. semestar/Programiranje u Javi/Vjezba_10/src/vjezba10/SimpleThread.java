package vjezba10;

public class SimpleThread extends Thread{
  @Override
  public void run() {
    System.out.println("Pokrenuta nit: " + getName());
  } 
}
