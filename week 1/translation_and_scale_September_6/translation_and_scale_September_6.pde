int x, y;

void setup(){
  size(500, 500); 
  
  background(0);
  
  x = 200;
  y = 200;
 
  
}

void draw (){
  triangle(x+ 15, y, x, y + 15, x + 30, y + 15);
  rect(x,y+15 30, 30);
  rect(x+12,y+30,10,15);
 
  pushMatrix();
  translate(-700, -700);
  scale(5.0);
  triangle(x+ 15, y, x, y + 15, x + 30, y + 15);
  rect(x,y+15, 30, 30);
  rect(x+12,y+30,10,15);
  popMatrix();
    
  
}