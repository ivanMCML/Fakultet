package vjezba10;

public class Main {
	public static void main(String[] args) {
    SimpleThread t1 = new SimpleThread();
    SimpleThread t2 = new SimpleThread();

    t1.start();
    t2.start();
        
    RunnableTask task = new RunnableTask();
    Thread thread1 = new Thread(task);
    Thread thread2 = new Thread(task);

        thread1.start();
        thread2.start();
        
        ThreadManager manager = new ThreadManager();
        manager.startThreads();
        
        Counter counter = new Counter();
        Thread[] threads = new Thread[10];

        for (int i = 0; i < 10; i++) {
            threads[i] = new Thread(new CounterTask(counter));
            threads[i].start();
        }

        for (Thread t : threads) {
            try {
                t.join();
            } catch (InterruptedException e) {
                e.printStackTrace();
            }
        }

        System.out.println("Finalna vrijednost brojila: " + counter.getCount());
    }
}
