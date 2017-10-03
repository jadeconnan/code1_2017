void setup(){
  size(1200,1200);
  background(0);
  
}

void draw(){ /*professor Kourtney*/
  textSize(12);
  fill(255);
  for(int i=0; i<600; i++){
     for (int j=0; j<400; j++){
       if(j % 4 == 0){
         text("o -- o", i*20, j*frameCount + 10);
       
       float dist = dist(mouseX, mouseY, i, j);
       if (dist > 500){
         fill(161,4,211);
       }else{
         fill(255);
         
         
       }
     }
  }
}

}