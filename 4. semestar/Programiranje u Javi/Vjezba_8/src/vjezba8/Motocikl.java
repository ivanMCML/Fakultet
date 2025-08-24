package vjezba8;

public class Motocikl extends Vozilo {
	private boolean imaPrtljaznik;

	public Motocikl(String marka, String model, int godinaProizvodnje, boolean imaPrtljaznik) {
	  super(marka, model, godinaProizvodnje);
	  this.imaPrtljaznik = imaPrtljaznik;
	}

  @Override
	public void ispisiInformacije() {
	  super.ispisiInformacije();
	  System.out.println("Ima prtljažnik: " + (imaPrtljaznik ? "Da" : "Ne"));
	}
}
