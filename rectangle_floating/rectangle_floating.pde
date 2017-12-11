int rectWidth = 100;
int rectHeight = 40;
float rectR, rectG, rectB;
float rectSpeedX, rectSpeedY;
float rectX, rectY;

void setup() {
  size(700, 700);
  changeColor();
  rectSpeedX = random(1, 10);
  rectSpeedY = random(1, 10);
  rectX = random(0, width-rectWidth);
  rectY = random(0, height-rectHeight);
}

void draw() {
  background(0);
  drawRect();
  move();
  detectCollision();
}

void drawRect() {
  fill(rectR, rectG, rectB);
  rect(rectX, rectY, rectWidth, rectHeight);
}
void move() {
  rectX+=rectSpeedX;
  rectY+=rectSpeedY;
}
void detectCollision() {
  if (rectX+rectWidth >= width) {
    rectSpeedX*=-1;
    changeColor();
  }
  if (rectX <= 0) {
    rectSpeedX*=-1;
    changeColor();
  }
  if (rectY+rectHeight >= height) {
    rectSpeedY*=-1;
    changeColor();
  }
  if (rectY <= 0) {
    rectSpeedY*=-1;
    changeColor();
  }
}
void changeColor() {
  rectR = random(0, 100);
  rectG = random(0, 155);
  rectB = random(0, 455);
}