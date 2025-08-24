package vjezba10;

public class RunnableTask implements Runnable {
  @Override
  public void run() {
    System.out.println("Pokrenuta nit: " + Thread.currentThread().getName());
  }
}
