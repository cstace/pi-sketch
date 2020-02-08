
// Cameron Stace
// https://cstace.media
// https://instagram.com/cstace.media
// have fun and make cool stuff with it
// tag me if you make something cool!

/*
polar coords std. conversion:
  x = radius *  cos(angle);
  y = radius *  sin(angle);
 
inverse y-axis (used in this case):
  x = radius *  sin(angle);
  y = radius * -cos(angle);
 */

import processing.pdf.*;

String pi;
int[] digits;
int index = 0;

float radius = 25;

float xPos = 0.0;
float yPos = 0.0;
float xPosNew = 0.0;
float yPosNew = 0.0;

String[] turbo = {
  "ff23171b", 
  "ff4860e6", 
  "ff2aabee", 
  "ff2ee5ae", 
  "ff6afd6a", 
  "ffc0ee3d", 
  "fffeb927", 
  "fffe6e1a", 
  "ffc2270a", 
  "ff900c00"
};

String[] plasma = {
  "ff0d0887", 
  "ff46039f", 
  "ff7201a8", 
  "ff9c179e", 
  "ffbd3786", 
  "ffd8576b", 
  "ffed7953", 
  "fffb9f3a", 
  "fffdca26", 
  "fff0f921"
};

String[] viridis = {
  "ff440154", 
  "ff482878", 
  "ff3e4989", 
  "ff31688e", 
  "ff26828e", 
  "ff1f9e89", 
  "ff35b779", 
  "ff6ece58", 
  "ffb5de2b", 
  "fffde725"
};

String orangeRed = "ffff4500";
String lime = "ffbfff00";

void setup() {

  pixelDensity(displayDensity());
  fullScreen(P2D);
  background(255);
  beginRecord(PDF, "export/"+getClass().getName()+"-"+hour()+"-"+minute()+"-"+second()+".pdf");
  pi = loadStrings("pi-fract-100k.txt")[0];
  String[] sdigits = pi.split("");
  digits = int(sdigits);

}

void draw() {

  if (index < 1000) {

    int currentDigit = digits[index];
    float angle = (TWO_PI / 10) * float(currentDigit);

    xPosNew = radius * sin(angle);
    yPosNew = radius * -cos(angle);

    pushMatrix();
    translate(width / 2, height / 2);

    String currentCol = turbo[currentDigit];

    strokeWeight(3);

    if (index == 0) {
      stroke(unhex(orangeRed));
    } else {
      stroke(unhex(currentCol));
    }
    line(xPos, yPos, xPosNew + xPos, yPosNew + yPos);

    popMatrix();

    xPos += xPosNew;
    yPos += yPosNew;

    index++;
  }
}

void keyPressed() {
  if (key == 'q') {
    endRecord();
    exit();
  }
}
