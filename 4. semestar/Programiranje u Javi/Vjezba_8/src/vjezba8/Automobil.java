package vjezba8;

public class Automobil extends Vozilo {
	
	private String tip;

	public Automobil(String marka, String model, int godinaProizvodnje, String tip) {
    super(marka, model, godinaProizvodnje);
    this.tip = tip;
	}

  @Override
	public void vozi() {
    System.out.println("Automobil " + tip + " vozi...");
  }
}
