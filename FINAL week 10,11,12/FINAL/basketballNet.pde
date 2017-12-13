void hoopMovement(){
  fill (255);
  ellipse(hoopX, hoopY, 100, 100);
  hoopX+=movement;
  if (hoopX>550 || hoopX< 50) {
    movement *= -1;
  }
}