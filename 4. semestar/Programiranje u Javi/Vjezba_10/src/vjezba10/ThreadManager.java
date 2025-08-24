package vjezba10;

public class ThreadManager {

  public void startThreads() {
	  Thread[] threads = new Thread[5];

	  for (int i = 0; i < 5; i++) {
      int threadNum = i + 1;

	    threads[i] = new Thread(() -> {
	      try {
	        Thread.sleep(1000);
	      } catch (InterruptedException e) {
	        e.printStackTrace();
        }
	      System.out.println("Nit " + threadNum + " završila.");
	    });
	    threads[i].start();
	  }

	       
	  for (Thread t : threads) {
	    try {
	      t.join();
	    } catch (InterruptedException e) {
	      e.printStackTrace();
	    }
	  }
  }
}

