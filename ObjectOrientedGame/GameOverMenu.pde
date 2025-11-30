class GameOverMenu{
  // displays the game over visuals
  void gameOverDisplay(){
    fill(0);
    rect(0,0,width,height);
    fill(255);
    rect(width/2,height/2,200,100);
  }
  //create the menu collision for the buttons
  void menuCollision(Player player){
    // detects if the mouse is inside the button frame
    if(mouseX >= width/2 &&
    mouseX <= (width/2) + 200 &&
    mouseY >= height/2 && 
    mouseY <= (height/2) + 100){
      player.health = 3;// resets the players health
    }
  }
}
