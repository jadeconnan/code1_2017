int rectX, rectY;
int circleX, circleY;
int rectSize = 200;
int circleSize = 220;

color rectColor, circleColor, baseColor;
color rectHighlight, circleHighlight;
color currentColor;
boolean rectOver = false;
boolean circleOver = false;

float angle;
float jitter;
boolean changeRectSize; 

void setup(){
  background (248,250,199);
  size(1000,1000);
  noStroke();
  rectColor = color(229,185,243);
  rectHighlight = color(250,199,245);
  circleColor = color(199,241,250 );
  circleHighlight = color(204);
  baseColor = color(245,250,199);
  currentColor = baseColor;
  circleX = width/2+circleSize/2+10;
  circleY = height/2;
  rectX = width/2-rectSize-10;
  rectY = height/2-rectSize/2;
  ellipseMode(CENTER);
}


void draw() {
  update(mouseX, mouseY);
  //background(currentColor);
  if(changeRectSize){ 
  //  background (255);
  rectSize = int (map(mouseX, 0, width, 0, 175));
    
    
  }else{
    rectSize = 30;
  }
  if (rectOver) {
    fill(rectHighlight);
  } else {
    fill(rectColor);
  }
  stroke(255);
  rect(rectX, rectY, rectSize, rectSize);
  
  if (circleOver) {
    fill(circleHighlight);
  } else {
    fill(circleColor);
  }
  stroke(0);
  ellipse(circleX, circleY, circleSize, circleSize);
}

void update(int x, int y) {
  if ( overCircle(circleX, circleY, circleSize) ) {
    circleOver = true;
    rectOver = false;
  } else if ( overRect(rectX, rectY, rectSize, rectSize) ) {
    rectOver = true;
    circleOver = false;
  } else {
    circleOver = rectOver = false;
  }
}

void mousePressed() {
  if (circleOver) {
    currentColor = circleColor;
    drawcircles ();
  }
  
  if (rectOver) {
    //change someting here
    //
    changeRectSize = !changeRectSize; 
    currentColor = rectColor;
  }
}

boolean overRect(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}

boolean overCircle(int x, int y, int diameter) {
  float disX = x - mouseX;
  float disY = y - mouseY;
  if (sqrt(sq(disX) + sq(disY)) < diameter/2 ) {
    return true;
  } else {
    return false;
  }
}
  void drawcircles (){
    background (currentColor);
for (int i = 0; i <= width; i += width/35) {
for (int j = 0; j <= height; j += height/35) {
float d = dist(mouseX, mouseY, i, j);
float s = map(d, 0, 1000, 10, 50);
ellipse(i, j, s, s);
    }

  if (second() % 2 == 0) {  
    jitter = random(-0.1, 0.1);
  }
  angle = angle + jitter;
  float c = cos(angle);
  translate(width/2, height/2);
  rotate(c);
  rect(0, 0, 180, 180);   
  }
 }