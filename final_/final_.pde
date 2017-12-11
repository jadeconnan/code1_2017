int [][] board; 
boolean [][] clicked; 
int size = 3; 
boolean player1 = true; 
int state= 1;
int hoope = 300;
int movement = 3;
//int ball = 30;
int ballX = 300;
int ballY = 575;
boolean moveball=false;

void setup(){
  size(600, 600); 
  textSize(24); 
  
  board = new int[size][size]; 
  clicked = new boolean[size][size]; 
  
  for(int i = 0; i<size; i++){
    for(int j = 0; j<size; j++){
      board[i][j] = 0; 
      clicked[i][j] = false; 
    }
  }
}

void draw(){
  background(255); 
  
  
  if (state==1){
        println ("homepage");
        rect(200,35,250,232);
  if(mousePressed ==true && mouseX > 200 && mouseY> 35 && mouseX<450 && mouseY<267){
    state = 3;
  }
  rect (100,100,100,200);
    if(mousePressed ==true&&mouseX>100 && mouseY>100 && mouseX<200 && mouseY<300){
      state = 2;
    }
   }else if (state==2){
     //basketball 
     fill (255);
     ellipse(hoope,50,100,100);
     hoope+=movement;
     if (hoope>550 || hoope< 50) {
       movement *= -1;
     }
         fill(244,157,22);
     ellipse(ballX, ballY, 50, 50);
 if (mousePressed == true){
   moveball=true;
 }
     if (moveball == true) {
       ballX += mouseX/100; 
       ballY -= mouseY/50;
     }
     
     
   }else if (state==3){
     //tic tac toe
     for(int i= 0; i<size; i++){
    for(int j =0; j<size; j++){
      noFill(); 
      rect(300 + i*100, j*100, 100, 100); 
      
      if(board[i][j] == 1){
        ellipse(350 + i*100, j*100 +50, 100, 100);
      }
      
      if(board[i][j] == 2){
        line(300+i*100, j*100,i*100+400, j*100 + 100); 
        line(400+i*100, j*100,i*100+300, j*100 + 100);
        
        
      }
    }
  }
   }
}

void mousePressed(){
  for(int i = 0; i< size; i++){
    for(int j = 0; j<size; j++){
      if(clicked[i][j] == false){
        if(mouseX>=300+i*100 && mouseX<=(300 + (i+1)*100) && 
        mouseY>=j*100 && mouseY<=(j+1)*100){
          clicked[i][j] = true;
          if(player1){
            //draws an O
            board[i][j] = 1; 
          }else{
            board[i][j] = 2; 
          }
          player1 = !player1; 
        }
      }
    }
  }


  if(board[0][2] == 1 && board[1][1] == 1 && board[2][0] == 1){
    player1 = true; 
  }else if(board[0][2] == 2 && board[1][1] == 2 && board[2][0] == 2){
    player2  = true; 
  }
  
  for(int i = 0; i< cols; i++){
    //check rows for a winner 
    if(board[0][i] == 1 && board[1][i] == 1 && board[2][i] == 1){
      player1  = true; 
    }else if(board[0][i] == 2 && board[1][i] == 2 && board[2][i] == 2){
      player2  = true; 
    }
    
    //check columns for a winner 
    if(board[i][0] == 1 && board[i][1] == 1 && board[i][2] == 1){
      player1  = true; 
    }else if(board[i][0] == 2 && board[i][1] == 2 && board[i][2] == 2){
      player2  = true; 
    }
  }
}