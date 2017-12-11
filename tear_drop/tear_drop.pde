void setup(){
size(500,500);
}
void draw(){
//draw a drop at 120, 120 size 8
  drawRaindrop(120,120,12);
}
//draw raindrop x = x position, y = y positiom, size = size
void drawRaindrop(int x,int y,int size){
noStroke();
for (int i = 2; i < size; i++ ) {
ellipse(x,y + i*4,i*2,i*2);
    }
}