package vjezba11;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class MyGUIApp extends JFrame {
   
	private JTextField imeField;
  private JButton pozdravButton;

  public MyGUIApp() {
    setTitle("Ivan Bebic"); 
    setSize(500, 500);
    setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

    JPanel panel = new JPanel();
    panel.setLayout(new FlowLayout());

    JLabel imeLabel = new JLabel("Unesite ime:");
    imeField = new JTextField(20);
    pozdravButton = new JButton("Pozdrav");

    panel.add(imeLabel);
    panel.add(imeField);
    panel.add(pozdravButton);

    add(panel);

    pozdravButton.addActionListener(new ActionListener() {
      @Override
      public void actionPerformed(ActionEvent e) {
        String ime = imeField.getText();
        System.out.println("Pozdrav, " + ime + "!");
      }
    });

    setVisible(true);
  }

  public static void main(String[] args) {
    new MyGUIApp();
  }
}