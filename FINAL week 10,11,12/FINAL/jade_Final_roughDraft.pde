int [][] board; 
boolean [][] clicked; 
int size = 3; 
boolean player1 = true; 
int state= 1;
int hoopX = 300;
int hoopY = 50; 
int movement = 3;
//int ball = 30;
int ballX = 300;
int ballY = 575;
boolean moveball = false;

int button1X, button1Y; 
int button2X, button2Y; 
int score = 0;
boolean doonce = true;
boolean oturn = true; 


Ball b; 

void setup() {
  size(600, 600); 
  textSize(24); 

  board = new int[size][size]; 
  clicked = new boolean[size][size]; 
  button1X =400;
  button1Y = 300; 
  button2X = 300;
  button2Y = 100;

  b = new Ball(300, 575); 
  setupGrid();
}

void draw() {
  background(255); 

  if (state==1) {
    rect(400, 300, 100, 200);
    fill (205, 188, 255);
    //checking button clicks on the homepage
    if (mousePressed ==true && mouseX > 400 && mouseY> 300 && mouseX<500 && mouseY<500) {
      state = 3;
    }
    rect (100, 300, 100, 200);
    fill(255, 255, 131);
    if (mousePressed ==true && mouseX>100 && mouseY>300 && mouseX<200 && mouseY<500) {
      state = 2;
    }
  } else if (state==2) {
    //basketball 
    hoopMovement(); 
    b.display();
    fill(255);
    rect(510, 110, 12, 22);
    if (mousePressed ==true && mouseX > 510 && mouseY> 110 && mouseX<522 && mouseY<132) {
      state = 3;
    }
    if (moveball == false) {
      b.updateX();
    } else {
      b.updateY();
    }

    if (b.y <= 0) {
      b.reset(); 
      moveball = false; 
      doonce= true;
    }

    textSize(32);
    text(" Put organge ball in the net", 100, 300); 
    fill(0, 102, 153);


    if (b.collisionDetection(hoopX, hoopY) && doonce == true) {
      println("pointScored"); 
      score++;
      println(score);
      doonce = false;

      //write the code for what you want to have happen when the player scores a point
    }

    text (Integer.toString(score), 500, 100);
  } else if (state==3) {
    fill(255);
    rect(510, 110, 12, 22);
    if (mousePressed ==true && mouseX > 510 && mouseY> 110 && mouseX<522 && mouseY<132) {
      state = 1;
    }
    
    pushMatrix() ;
    translate(-140, 200);
    //tic tac toe
    for (int i= 0; i<size; i++) {
      for (int j =0; j<size; j++) {
        noFill(); 
        rect(300 + i*100, j*100, 100, 100); 

        if (board[i][j] == 1) {
          ellipse(350 + i*100, j*100 +50, 100, 100);
        }

        if (board[i][j] == 2) {
          line(300+i*100, j*100, i*100+400, j*100 + 100); 
          line(400+i*100, j*100, i*100+300, j*100 + 100);
        }
      }
    }

    popMatrix() ;
    fill(0);
    if (oturn == true) {
      text ("O's turn", 100, 100);
    } else if (oturn == false) {
      text ("X's turn", 100, 100);
    }
  }
}


void mousePressed() {
  if (state == 2) {
    moveball = true;
  }

  if (state == 3) {
    for (int i = 0; i< size; i++) {
      for (int j = 0; j<size; j++) {
        if (clicked[i][j] == false) {

          if (mouseX>=300-140+i*100 && mouseX<=(300-140 + (i+1)*100) && 
            mouseY>=(j*100)+200 && mouseY<=((j+1)*100)+200) {
            clicked[i][j] = true;
            if (player1) {
              //draws an O
              oturn= !oturn ;
              board[i][j] = 1;
            } else {
              oturn= !oturn ;
              board[i][j] = 2;
            }
            player1 = !player1;
          }
        }
      }
    }
  }



  //if (board[0][2] == 1 && board[1][1] == 1 && board[2][0] == 1) {
  //  player1 = true;
  //} else if (board[0][2] == 2 && board[1][1] == 2 && board[2][0] == 2) {
  //  player2 = true;
  //}

  //for (int i = 0; i< cols; i++) {
  //  //check rows for a winner 
  //  if (board[0][i] == 1 && board[1][i] == 1 && board[2][i] == 1) {
  //    player1 = true;
  //  } else if (board[0][i] == 2 && board[1][i] == 2 && board[2][i] == 2) {
  //    player2 = true;
  //  }

  //  //check columns for a winner 
  //  if (board[i][0] == 1 && board[i][1] == 1 && board[i][2] == 1) {
  //    player1 = true;
  //  } else if (board[i][0] == 2 && board[i][1] == 2 && board[i][2] == 2) {
  //    player2 = true;
  //  }
  //}
}