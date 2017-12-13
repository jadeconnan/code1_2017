
ArrayList<PVector> circle = new ArrayList<PVector>();
ArrayList<PVector> square = new ArrayList<PVector>();
ArrayList<PVector> morph = new ArrayList<PVector>();

boolean state = false;

int numDrops =300;
int posX [] = new int[numDrops]; 
int posY[] = new int[numDrops]; 

int speedY[] = new int[numDrops]; 

boolean firstClick = false;

int stage = 1;
float heartMove = 50 ;
PImage heart; 
float Xposition; 
float Yposition;

float xSpeed; 
float ySpeed;

color[] baseColor = new int[numDrops]; 

void setup() {
  size(600, 600);
  textSize(35);
  noSmooth();
  fill(255, 207, 207);

  heart= loadImage ("heart.png");
  Xposition=0; 
  Yposition= 0;

  for (int angle = 0; angle < 360; angle += 9) { 
    PVector v = PVector.fromAngle(radians(angle-135));
    v.mult(100);
    circle.add(v); 
    morph.add(new PVector());
  }

  for (int x = -50; x < 50; x += 10) {
    square.add(new PVector(x, -50));
  }
  for (int y = -50; y < 50; y += 10) {
    square.add(new PVector(50, y));
  }

  for (int x = 50; x > -50; x -= 10) {
    square.add(new PVector(x, 50));
  }

  xSpeed = 5; 
  ySpeed = 6; 

  for (int y = 50; y > -50; y -= 10) {
    square.add(new PVector(-50, y));
  }
  
  for (int i = 0; i<numDrops; i++){
    posY[i] = -width/2;  
    posX[i] = i*100 -100 - height/2; 
    speedY[i] = int(random(5,10)); 
  }
}

void draw() {
  println(stage); 
  if (firstClick == false) {
    background(210, 175, 234);
    fill(255);

    textAlign(CENTER, CENTER);
    text("CLICK ME", width/2, height/2);
  }
  float totalDistance = 0;

  for (int i = 0; i < circle.size(); i++) {
    PVector v1;
    if (state) {
      v1 = circle.get(i);
    } else {
      v1 = square.get(i);
    }
    PVector v2 = morph.get(i);
    v2.lerp(v1, 0.1);
    totalDistance += PVector.dist(v1, v2);
  }

  if (totalDistance < 0.1) {
    state = !state;
  }

  translate(width/2, height/2);
  strokeWeight(4);
  beginShape();
  noFill();
  stroke(255);
  for (PVector v : morph) {
    vertex(v.x, v.y);
  }
  endShape(CLOSE);

  if (stage == 2) {
    translate(-width/2, -height/2) ;
    imageMode(CENTER) ;
    image(heart, Xposition, Yposition) ;
    Xposition = Xposition + xSpeed;
    Yposition = Yposition + ySpeed; 
    if ( Xposition >= width || Xposition <= 0) {
      //println("this is running") ;
      xSpeed = xSpeed *-1;
    }
    if ( Yposition >= (height) || Yposition <= 0) {
      ySpeed = ySpeed * -1;
    }
    //println(Xposition) ;
  }

  if (stage  == 3) {
    drawHeart(); 
  }
  
  if(stage == 4){
    //want to make more than one teardrop, use a for loop 
    for(int i = 0; i<numDrops; i++){
       fill(baseColor[i]); 
 baseColor[i] = color(int(random(150,255)), int(random(0, 50)),  int(random(150, 255))); 
      posY[i] += speedY[i]; 
      println(i); 
      drawRaindrop(posX[i], posY[i], 12); 
      if(posY[i] > height){
        posY[i] = -height/2; 
      }
    }
  }
  
  if(stage ==5){
    stage =2; 
  }
}


void drawHeart(){
    translate (0, 230);
    shapeMode(CENTER);
    for (int i=0; i<61; i+=4) {
      float x = 0.25 * (-pow(i, 2) + 40*i + 1200)*sin((PI*i)/180);
      float y = -0.25 * (-pow(i, 2) + 40*i + 1200)*cos((PI*i)/180);
      fill((x +frameCount) % 600, 234, 890);
      text("♥", x, y);
      text("♥", -x, y);


      //// TEARDROP//
      //  drawRaindrop(120,120,12);

      if (mousePressed) {
        stroke(255);
      } else {
      }
    }
}

void drawRaindrop(int x,int y,int size){
    noStroke();
    fill(255); 
    for (int i = 2; i < size; i++ ) {
      ellipse(x,y + i*4,i*2,i*2);
    }
}

void mousePressed () {
  if (mouseX >= width/2 - 100 && mouseX<=width/2 +100 && mouseY >=  height/2 -100 && mouseY <= height/2 +100) {
    //println("this is running if i press the center") ;
    stage++;
  }
}