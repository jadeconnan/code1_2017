void setupGrid(){
  for (int i = 0; i<size; i++) {
    for (int j = 0; j<size; j++) {
      board[i][j] = 0; 
      clicked[i][j] = false;
    }
  }
}