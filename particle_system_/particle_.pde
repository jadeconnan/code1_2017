class Particle {
  PVector position;
  PVector velocity;
  PVector accelaration; 
  
  Particle(){
    position = new PVector(0,.05);
    velocity = new PVector (random(-1,1),random(-2,0));
    accelaration = new PVector (mouseX,mouseY);
 
}
void update(){
velocity.add(accelaration);
position.add (velocity);
}


void display (){
fill (255);
  ellipse(position.x,position.y, 8,8 );
}
void applyForce (PVector force){
PVector f= PVector.div(force,9);
accelaration.add (f);
}
}