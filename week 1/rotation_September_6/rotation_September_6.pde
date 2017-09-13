void setup(){
  size(600,600);
  background(255);
  smooth();
  fill(192);
 // noStroke();
 // rect(40, 40, 40, 40);
  
  
  pushMatrix();
  //translate(60,60);
  //rectMode(CENTER);
  //rotate(radians(45));
  //fill(0);
  //rect(0, 0, 40, 40);
 // popMatrix();
  
 
}


void draw(){
  if(frameCount %10 == 0){
    fill(random(0,25), random(0, 655), random(0,955));
    pushMatrix();
    translate(100, 100);
    rotate(radians(frameCount*4% 360));
    rect(0,0,80,20);
    popMatrix();
    
    if(frameCount %10 == 0){
    fill(random(0,245), random(0, 155), random(0,955));
    pushMatrix();
    translate(400, 400);
    rotate(radians(frameCount*4% 360));
    rect(0,0,80,20);
    popMatrix();
    
    if(frameCount %10 == 0){
    fill(random(0,67), random(45, 95), random(790,123));
    pushMatrix();
    translate(500, 100);
    rotate(radians(frameCount*4% 360));
    rect(0,0,80,20);
    popMatrix();
}

}
}
}