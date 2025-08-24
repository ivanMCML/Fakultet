#include <iostream>

using namespace std;

class CopmlexNumber {

  private:
    float real;
    float imaginary;

  public:
    CopmlexNumber(float real, float imaginary) {
      this->real = real;
      this->imaginary = imaginary;
    }

    float getReal() {
      return real;
    }

    float getImaginary() {
      return imaginary;
    }

    void setReal(float real) {
      this->real = real;
    }

    void setImaginary(float imaginary) {
      this->imaginary = imaginary;
    }

    CopmlexNumber calcualteSum(CopmlexNumber number2) {
      CopmlexNumber result(0, 0);

      result.setReal(real + number2.getReal());
      result.setImaginary(imaginary + number2.getImaginary());

      return result;
    }
    
    CopmlexNumber calculateMultiplication(CopmlexNumber number2) {
      CopmlexNumber result(0, 0);

      result.setReal((real * number2.getReal()) - (imaginary * number2.getImaginary()));
      result.setImaginary((real * number2.getImaginary()) + (imaginary * number2.getReal()));

      return result;
    }

};


int main() {

  CopmlexNumber number1(2, 4.2);
  CopmlexNumber number2(2.5, 0.4);
  CopmlexNumber result(0, 0);

  result = number1.calcualteSum(number2);
  cout << result.getReal() << " + " << result.getImaginary() << "i" << endl;
  
  result = number2.calculateMultiplication(number1);
  cout << result.getReal() << " + " << result.getImaginary() << "i" << endl; 
  


  return 0;
}