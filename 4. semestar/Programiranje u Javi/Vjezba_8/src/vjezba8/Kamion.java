package vjezba8;

public class Kamion extends Vozilo{
	private double nosivost;

  public Kamion(String marka, String model, int godinaProizvodnje, double nosivost) {
    super(marka, model, godinaProizvodnje);
    this.nosivost = nosivost;
  }

  @Override
  public void vozi() {
    System.out.println("Kamion s nosivošću " + nosivost + " tona vozi...");
  }
}
