void setup(){
 size(1200,1200);
 background(0);
  
  
}



void draw(){
//background(0,);

fill(0, 10);
//rect(0, 0, width, height);

stroke(random(0,255), random (0,255),random (0,255));
line( width/2, height/2, mouseX, mouseY);
  line(mouseX, height/2, mouseY, width/2);
  println(mouseX);
  println(mouseY);
  
}