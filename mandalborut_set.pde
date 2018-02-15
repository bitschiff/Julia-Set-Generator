int nn =0;
ComplexNumber zero = new ComplexNumber(0, 0);
color theColor = color(255, 255, 255);
boolean mousedown = false;

float locationXMin = -2;
float locationXMax = 2;
float locationYMin = -1.5;
float locationYMax = 1.5;
int frame = 0;
float xZoom = 0;
float yZoom = 0;

float widthOfSet = 2;
float heightOfSet = 1.5;
float ofsetx = .5;
float ofsety = .5;
boolean isjulia = false;
ComplexNumber mouseSpot = new ComplexNumber(map(mouseX, 0, width, locationXMin, locationXMax), map(mouseY, 0, height, locationYMin, locationYMax));
ComplexNumber seed = new ComplexNumber(map(mouseX, 0, width, locationXMin, locationXMax), map(mouseY, 0, height, locationYMin, locationXMax));


ComplexNumber julia = new ComplexNumber(0, 0);

ComplexNumber value = new ComplexNumber(0, 0);

ComplexNumber value2 = new ComplexNumber(0, 0);
int nval = 0;

void setup() {//final mandel

  size(800, 600);
  colorMode(HSB, 255);
  // translate(width/2, height/2);

  for (int i=0; i<width; i++) {
    //  println(i);
    for (int j=0; j<height; j++) {

      ComplexNumber spot = new ComplexNumber(map(i, 0, width, locationXMin, locationXMax), map(j, 0, height, locationYMin, locationYMax));



      nval = run2(zero, 0, spot);

      if (nval>=255) {
        theColor = color(255, 255, 0);
        // background(0);
      } else {

        //theColor = color(nval, 255, 255);
        //   theColor = color(map(pow(nval,.5), 0, pow(255,.5), 0, 255), 255, 255);
        theColor = color(nval, 255, 255);
        //background(255);
      }

      set(i, j, theColor);
    }
  }
  //  ComplexNumber spot = new ComplexNumber(.625, .0625);
  //  println(run2(zero, 0, spot));
  println("Done");
  save(frame+".jpg");
  frame++;
}

void draw() {
  if (isjulia == false) {
    ComplexNumber seed2 = new ComplexNumber(map(mouseX, 0, width, locationXMin, locationXMax), map(mouseY, 0, height, locationYMin, locationXMax));
    seed.setCN(seed2);
    noStroke();
    color c1 = color(255, 0, 0);
    fill(#FF0000);
    rect(10, 20, 250, -100);
    color c2 = color(0);
    fill(c2);
    textSize(14);
    text(seed.toString(), 10, 15);
  } else {
  }
}

void mouseClicked() {

  if (mouseButton == RIGHT) {
 //   println("Click");
    locationXMin = -2;
    locationXMax = 2;
    locationYMin = -1.5;
    locationYMax = 1.5;
    //   julia.setCN(9999, 9999);
    isjulia = false;
    for (int i=0; i<width; i++) {
      //  println(i);
      for (int j=0; j<height; j++) {

        ComplexNumber spot = new ComplexNumber(map(i, 0, width, locationXMin, locationXMax), map(j, 0, height, locationYMin, locationXMax));



        nval = run2(zero, 0, spot);

        if (nval>=255) {
          theColor = color(255, 255, 0);
          // background(0);
        } else {

          //theColor = color(nval, 255, 255);
          //   theColor = color(map(pow(nval,.5), 0, pow(255,.5), 0, 255), 255, 255);
          theColor = color(nval, 255, 255);
          //background(255);
        }

        set(i, j, theColor);
      }
    }
    //  ComplexNumber spot = new ComplexNumber(.625, .0625);
    //  println(run2(zero, 0, spot));
    println("Done");
  } else {//left

    ComplexNumber mouseSpot2 = new ComplexNumber(map(mouseX, 0, width, locationXMin, locationXMax), map(mouseY, 0, height, locationYMin, locationYMax));
    mouseSpot.setCN(mouseSpot2);

    if (isjulia == false) {
      mouseSpot.setCN(map(mouseX, 0, width, locationXMin, locationXMax), map(mouseY, 0, height, locationYMin, locationYMax));
      julia.setCN(mouseSpot);
      isjulia = true;
      println("Click");

      for (int i=0; i<width; i++) {

        for (int j=0; j<height; j++) {

          ComplexNumber spot = new ComplexNumber(map(i, 0, width, locationXMin, locationXMax), map(j, 0, height, locationYMin, locationXMax));



          nval = run2(spot, 0, mouseSpot);

          if (nval>=255) {
            theColor = color(255, 255, 0);
            // background(0);
          } else {
            theColor = color(nval, 255, 255);
            //theColor = color(map(pow(nval,.5), 0, pow(255,.5), 0, 255), 255, 255);
            //background(255);
          }

          set(i, j, theColor);
        }
      }
      //  ComplexNumber spot = new ComplexNumber(.625, .0625);
      //  println(run2(zero, 0, spot));

      noStroke();
      color c1 = color(255, 0, 0);
      fill(#FF0000);
      //rect(10, 20, 250, -100);
      color c2 = color(0);
      fill(c2);
      textSize(14);
      text(seed.toString(), 10, 15);
      println("Done");

      save(frame+".jpg");
      frame++;
    }
  }
}


void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  //println(e);

  if (isjulia == false) {
  } else {
    if (e<0) {
      locationXMin=locationXMin/2;
      locationXMax=locationXMax/2;
      locationYMin=locationYMin/2;
      locationYMax=locationYMax/2;
    } else {
      locationXMin=locationXMin*2;
      locationXMax=locationXMax*2;
      locationYMin=locationYMin*2;
      locationYMax=locationYMax*2;
    }


    // ComplexNumber mouseSpot = new ComplexNumber(map(mouseX, 0, width, locationXMin, locationXMax), map(mouseY, 0, height, locationYMin, locationYMax));
    for (int i=0; i<width; i++) {
    //  println(i);
      for (int j=0; j<height; j++) {
        ComplexNumber spot = new ComplexNumber(map(i, 0, width, locationXMin, locationXMax), map(j, 0, height, locationYMin, locationYMax));

        nval = run2(spot, 0, mouseSpot);

        if (nval>=255) {
          theColor = color(255, 255, 0);
          // background(0);
        } else {
          theColor = color(nval, 255, 255);
          //theColor = color(map(pow(nval,.5), 0, pow(255,.5), 0, 255), 255, 255);
          //background(255);
        }

        set(i, j, theColor);
      }
    }
    //  ComplexNumber spot = new ComplexNumber(.625, .0625);
    //  println(run2(zero, 0, spot));
    noStroke();
    color c1 = color(255, 0, 0);
    fill(#FF0000);
    //rect(10, 20, 250, -100);
    color c2 = color(0);
    fill(c2);
    textSize(14);
    text(seed.toString(), 10, 15);
    println("Done");

    save(frame+".jpg");
    frame++;
  }
}


int run2(ComplexNumber valu, int n, ComplexNumber c) {
  if (n>=255) {
  } else if (valu.magnitude()>2) {
  } else {//call
    if (n <=0) {
      //  valu = valu.add(c);
      n = run2(valu.add(c), n+1, c);
    } else {
      valu = valu.power(2);
      valu = valu.add(c);
      n = run2(valu, n+1, c);
    }
  }
  return n;
}