void setup(){
  size(600, 600); 
  background(0); 
}

void draw(){
  textSize(12); 
  fill(255);  
  for(int i = 0; i<10; i++){
    for(int j = 0; j<3; j++){
      if(j % 2 == 0){
        text("/", i*10, j*10); 
      }else if(j % 3== 0){
        text(" ", i*10, j*10); 
      }else{
        text("-", i*10, j*10);
      }
    }
  }
}