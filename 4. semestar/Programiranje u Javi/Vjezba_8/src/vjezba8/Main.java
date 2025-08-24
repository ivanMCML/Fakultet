package vjezba8;

public class Main {

	public static void main(String[] args) {

		Vozilo auto = new Automobil("Ford", "Mustang", 2020, "Sedan");
		Vozilo kamion = new Kamion("MAN", "kamion", 2018, 18.5);
		Vozilo moto = new Motocikl("Yamaha", "brzi motor", 2022, true);

		auto.ispisiInformacije();
		auto.vozi();

		kamion.ispisiInformacije();
		kamion.vozi();

		moto.ispisiInformacije();
		moto.vozi(); 
	}

}

