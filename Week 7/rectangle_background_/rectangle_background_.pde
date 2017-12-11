int size = 50;

color[][] grid = new color [size][size];


void setup (){
  size (500,500);
  // set rectangles
  for (int i=0; i<size; i++){
    for(int j= 0; j<size; j++){
      rect(i*size, j*size, size, size);
    
  }
  }
}