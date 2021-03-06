void setup() {
  size(600,600);
  textSize(35);
 //colorMode(HSB,360,100,100);
}

void draw() {
  translate(width/2,3*height/4);
  background(210,175,234);
  for (int i=0; i<61; i+=4) {
    float x = 0.25 * (-pow(i,2) + 40*i + 1200)*sin((PI*i)/180);
    float y = -0.25 * (-pow(i,2) + 40*i + 1200)*cos((PI*i)/180);
    fill((x +frameCount) % 600,234,890);
    text("♥",x,y);
    text("♥",-x,y);
  }
}