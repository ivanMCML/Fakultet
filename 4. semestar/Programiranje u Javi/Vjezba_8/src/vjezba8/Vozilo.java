package vjezba8;

public class Vozilo {
	protected String marka;
  protected String model;
  protected int godinaProizvodnje;

  public Vozilo(String marka, String model, int godinaProizvodnje) {
    this.marka = marka;
	  this.model = model;
	  this.godinaProizvodnje = godinaProizvodnje;
  }

  public void ispisiInformacije() {
    System.out.println("Marka: " + marka + ", Model: " + model + ", Godina proizvodnje: " + godinaProizvodnje);
  }

  public void vozi() {
    System.out.println("Vozilo vozi...");
  }
}
