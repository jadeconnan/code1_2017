class Ball{
  //data we need for our ball 
  int size; 
  int x, y; 
  int xSpeed, ySpeed; 
  
  //constructor for our ball 
  Ball(int _x, int _y){
    x = _x; 
    y = _y;
    ySpeed = 20; 
  }
  
  //method for movement 
  void updateY(){
    y -= ySpeed; 
  }
  
  void updateX(){
    x = mouseX; 
  }
  
  
  int returnX(){
 return x; 
}
  
  int returnY(){
    return y;
  }
  
  
  
  //collision detection 
  //function that checks if my ball is colliding with my basket 
  boolean collisionDetection(int collideX, int collideY){
    if(dist(x, y, collideX, collideY)<=110){
      return true; 
    }else{
      return false; 
    }
  }
  
  //display
  void display(){
    fill(244, 157, 22);
    ellipse(x, y, 50, 50);
  }
  
  void reset(){
    x = 300; 
    y = 575; 
  }
  
  
}