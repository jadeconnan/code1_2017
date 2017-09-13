int xspacing = 16;
int w;

float theta= 0.0;
float amplitude = 75.0;
float period = 500.0;
float dx;
float[] yvalues;
int angle = 0;

void setup() {
  size(1200, 1200);
  background(102);
  noStroke();
  fill(0, 102);




  //size(600, 600);
  background(255, 210, 248);

  w = width+16;
  dx = (TWO_PI / period) * xspacing;
  yvalues =new float[w/xspacing];
}

void draw() {

  background(255, 210, 248);
  calcWave();
  renderWave();
  drawBear();
  //drawFlower();

  if (mousePressed == true) {
    angle += 5;
    float val = cos(radians(angle)) * 12.0;
    for (int a = 0; a < 360; a += 75) {
      float xoff = cos(radians(a)) * val;
      float yoff = sin(radians(a)) * val;
      fill(0);
      ellipse(mouseX + xoff, mouseY + yoff, val, val);
    }
    fill(255);
    ellipse(mouseX, mouseY, 2, 2);
  }
}

void calcWave() {
  theta += 0.02;
  float x = theta;
  for (int i = 0; i < yvalues.length; i++) {
    yvalues[i] = sin(x)*amplitude;
    x+=dx;
  }
}

void renderWave() {
  noStroke();
  fill(255);
  for (int x = 0; x < yvalues.length; x++) {
    ellipse(x*xspacing, height/2+yvalues[x], 16, 16);
  }
}

void drawBear() {

  fill(111, 33, 16);
  rect(470, 450, 400, 300);

  fill(111, 33, 16);
  rect(520, 750, 60, 70);


  fill(111, 33, 16);
  rect(750, 750, 60, 70);

  ellipseMode(CORNER);
  fill(111, 33, 16);
  ellipse(286, 428, 200, 200);


  ellipseMode(CORNER);
  fill(255);
  ellipse(320, 480, 25, 25);


  ellipseMode(CENTER);// middle eye
  fill(0);
  ellipse(333, 493, 10, 10);

  fill(134, 49, 30);
  triangle(250, 525, 290, 500, 290, 550);

  ellipseMode(CENTER);
  fill(134, 49, 30);
  ellipse(380, 425, 40, 40);


  ellipseMode(CENTER);
  noStroke();
  fill(255);
  ellipse(380, 425, 20, 20);

  ellipseMode(CENTER);
  noStroke();
  fill(0);
  ellipse(250, 525, 20, 20);


  ellipseMode(CENTER);
  noStroke();
  fill(100, 27, 12);
  ellipse(860, 460, 30, 30);


  ellipseMode(CENTER);
  noStroke();
  fill(100, 27, 12);
  ellipse(870, 440, 30, 30);


  ellipseMode(CENTER);
  noStroke();
  fill(100, 27, 12);
  ellipse(880, 440, 45, 45);
}