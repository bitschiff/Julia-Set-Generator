class ComplexNumber {

  private float real;
  private float imaginary;

  /**
   * Makes a new ComplexNumber with no parameters
   */
  public ComplexNumber() {//
  }

  /**
   * Makes a new ComplexNumber
   * 
   * @param re
   *            float
   * @param im
   *            float
   */
  public ComplexNumber(float re, float im) {//
    real = re;
    imaginary = im;
  }

  /**
   * Makes a copy of a ComplexNumber
   * 
   * @param cn
   *            ComplexNumber
   */
  public ComplexNumber(ComplexNumber cn) {//
    real = cn.getReal();
    imaginary = cn.getImaginary();
  }

  /**
   * Gets the real part of the complex number
   * 
   * @return the real part of the complex number
   */
  public float getReal() {//
    return real;
  }

  /**
   * Gets the imaginary part of the complex number
   * 
   * @return the imaginary part of the complex number
   */
  public float getImaginary() {//
    return imaginary;
  }
  
  
  public void setCN(float a, float b){
    real = a;
    imaginary = b;
  }


public void setCN(ComplexNumber cn) {//
    real = cn.getReal();
    imaginary = cn.getImaginary();
  }
  /**
   * Adds 2 complex numbers
   * 
   * @param c1
   *            ComplexNumber
   * @return The sum between 2 complex number
   */
  public ComplexNumber add(ComplexNumber c1) {// is this how i add
    float realNumb = real + c1.getReal();
    float imaginaryNumb = imaginary + c1.getImaginary();
    ComplexNumber c2 = new ComplexNumber(realNumb, imaginaryNumb);
    return c2;
  }

  /**
   * Adds 2 complex numbers
   * 
   * @param c1
   *            ComplexNumber
   * @param c2
   *            ComplexNumber
   * @return The sum between 2 complex numbers
   */
//  public ComplexNumber add(ComplexNumber c1, ComplexNumber c2) {
//    float realNumb = c2.getReal() + c1.getReal();
//    float imaginaryNumb = c2.getImaginary() + c1.getImaginary();
//    ComplexNumber c3 = new ComplexNumber(realNumb, imaginaryNumb);
//    return c3;
//  }

  /**
   * Subtracts 2 complex numbers
   * 
   * @param c1
   *            ComplexNumber
   * @return The difference between 2 complex numbers
   */
  public ComplexNumber subtract(ComplexNumber c1) {// test like add
    float realNumb = real - c1.getReal();
    float imaginaryNumb = imaginary - c1.getImaginary();
    ComplexNumber c2 = new ComplexNumber(realNumb, imaginaryNumb);
    return c2;
  }

  /**
   * Subtracts 2 complex numbers
   * 
   * @param c1
   *            ComplexNumber
   * @param c2
   *            ComplexNumber
   * @return The difference between 2 complex numbers
   */
//  public static ComplexNumber subtract(ComplexNumber c1, ComplexNumber c2) {
//    float realNumb = c1.getReal() - c2.getReal();
//    float imaginaryNumb = c1.getImaginary() - c2.getImaginary();
//    ComplexNumber c3 = new ComplexNumber(realNumb, imaginaryNumb);
//    return c3;
//  }

  /**
   * Multiplies 2 complex numbers together
   * 
   * @param c1
   *            ComplexNumber
   * @return a new complex number that is the result of multiplying two
   *         together
   */
  public ComplexNumber multiply(ComplexNumber c1) {
    float realNumb = real * c1.getReal();
    realNumb -= imaginary * c1.getImaginary();
    float imaginaryNumb = real * c1.getImaginary();
    imaginaryNumb += c1.getReal() * imaginary;
    ComplexNumber c2 = new ComplexNumber(realNumb, imaginaryNumb);
    return c2;
  }

  /**
   * Multiplies 2 complex numbers together
   * 
   * @param c1
   *            ComplexNumber
   * @param c2
   *            ComplexNumber
   * @return a new complex number that is the result of multiplying two
   *         together
   */
//  public static ComplexNumber multiply(ComplexNumber c1, ComplexNumber c2) {
//    float realNumb = c2.getReal() * c1.getReal();
//    realNumb -= c2.getImaginary() * c1.getImaginary();
//    float imaginaryNumb = c2.getReal() * c1.getImaginary();
//    imaginaryNumb += c1.getReal() * c2.getImaginary();
//    ComplexNumber c3 = new ComplexNumber(realNumb, imaginaryNumb);
//    return c3;
//  }

  /**
   * Divides the second complex number from the first one
   * 
   * @param c2
   *            ComplexNumber
   * @return a new complex number that is the result of dividing two together
   * 
   * @throws ArithmeticException
   *             Arithmetic Exception
   */
  public ComplexNumber divide(ComplexNumber c2) {
    ComplexNumber finalCN = new ComplexNumber();
    try {
      ComplexNumber currentCN = new ComplexNumber(real, imaginary);

      ComplexNumber top = new ComplexNumber(currentCN.multiply(c2.conjugate()));
      ComplexNumber bot = new ComplexNumber(c2.multiply(c2.conjugate()));

      finalCN = new ComplexNumber(top.getReal() / bot.getReal(), top.getImaginary() / bot.getReal());

    } catch (ArithmeticException e) {
      System.out.println("Arithmetic Exception");
    }

    return finalCN;
  }

  /**
   * Divides the second complex number from the first one
   * 
   * @param c1
   *            ComplexNumber
   * @param c2
   *            ComplexNumber
   * @return a new complex number that is the result of dividing two together
   * 
   * @throws ArithmeticException
   *             Arithmetic Exception
   */
//  public static ComplexNumber divide(ComplexNumber c1, ComplexNumber c2) {
//    ComplexNumber finalCN = new ComplexNumber();
//    try {
//      ComplexNumber currentCN = new ComplexNumber(c1.getReal(), c1.getImaginary());
//
//      ComplexNumber top = new ComplexNumber(multiply(currentCN, c2.conjugate()));
//      ComplexNumber bot = new ComplexNumber(multiply(c2, c2.conjugate()));
//
//      finalCN = new ComplexNumber(top.getReal() / bot.getReal(), top.getImaginary() / bot.getReal());
//
//    } catch (ArithmeticException e) {
//      System.out.println("Arithmetic Exception");
//    }
//
//    return finalCN;
//  }

  /**
   * Takes a complex number and multiplies its self the power amount of times
   * 
   * @param power
   *            int
   * @return a new complex number that is the result of taking the complex
   *         number and multiplying it by its self a power amount of times
   * 
   * @throws IllegalArgumentException
   *             Illegal Argument Exception
   */
  public ComplexNumber power(int power) {
    ComplexNumber currentCN = new ComplexNumber(real, imaginary);
    ComplexNumber newCN = new ComplexNumber(real, imaginary);
    try {

      for (int i = 0; i < power - 1; i++) {
        newCN = newCN.multiply(currentCN);

      }

    } catch (IllegalArgumentException e) {
      System.out.println("Illegal Argument Exception");
    }
    return newCN;
  }

  /**
   * Takes a complex number and multiplies its self the power amount of times
   * 
   * @param c1
   *            ComplexNumber
   * @param power
   *            int
   * @return a new complex number that is the result of taking the complex
   *         number and multiplying it by its self a power amount of times
   * 
   * @throws IllegalArgumentException
   *             Illegal Argument Exception
   */
//  public ComplexNumber power(ComplexNumber c1, int power) {
//    ComplexNumber currentCN = new ComplexNumber(c1.getReal(), c1.getImaginary());
//    ComplexNumber newCN = new ComplexNumber(c1.getReal(), c1.getImaginary());
//
//    try {
//
//      for (int i = 0; i < power - 1; i++) {
//        newCN = multiply(newCN, currentCN);
//
//      }
//
//    } catch (IllegalArgumentException e) {
//      System.out.println("Illegal Argument Exception");
//    }
//
//    return newCN;
//  }

  /**
   * Compare 2 complex numbers
   * 
   * @param c1
   *            ComplexNumber
   * @return boolean: true if equal false if not
   */
  public boolean equals(ComplexNumber c1) {
    if (c1.getImaginary() == imaginary)
      if (c1.getReal() == real)
        return true;
    return false;
  }

  /**
   * Calculates the distance from the origin
   * 
   * @return double: the distance from theorigin
   */
  public double magnitude() {
    return Math.sqrt(Math.pow(real, 2) + Math.pow(imaginary, 2));
  }

  /**
   * Compares two complex numbers
   * 
   * @param c2
   *            ComplexNumber
   * @return int: A 1 if the first complex number is greater than the second.
   *         A -1 if the second complex number is greater than the first. A 0
   *         if the complex numbers are equal.
   */
  public int compareTo(ComplexNumber c2) {
    if (magnitude() < c2.magnitude())
      return -1;
    else if (magnitude() == c2.magnitude())
      return 0;
    else// (magnitude()>c2.magnitude())
      return 1;
  }

  private ComplexNumber conjugate() {
    ComplexNumber c2 = new ComplexNumber(real, imaginary * (-1));
    return c2;
  }

  /*
   * (non-Javadoc)
   * 
   * @see java.lang.Object#toString()
   */
  public String toString() {
    String result;
    if (real == 0) {
      if (imaginary == 0)
        result = "0";
      else
        result = imaginary + "i";
      // else if (imaginary > 0)
      // result = "i" + imaginary;
    } else if (imaginary == 0)
      result = real + "";
    else if (imaginary > 0)
      result = real + "+" + imaginary + "i";
    else
      result = real + "" + imaginary + "i";

    return result;
  }
}