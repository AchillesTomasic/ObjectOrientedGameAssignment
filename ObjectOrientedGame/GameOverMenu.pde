class GameOverMenu{
  // image for the game over screen //
  PImage restartImage = loadImage("placeHolder.jpg"); // image for the restart
  PImage gameOverImage = loadImage("gameOver.jpg"); // image for the game over
  // displays the game over visuals
  void gameOverDisplay(){
    fill(0); // black
    rect(0,0,width,height); // background image
    image(restartImage,(width/2 )- 100,(height/2) - 50,200,100); // button image
    image(gameOverImage,(width/2 )- 100,(height/2) - 250,200,100); // game over image
  }
  //create the menu collision for the buttons
  void menuCollision(Player player){    
    // detects if the mouse is inside the button frame
    if(mouseX >= (width/2)- 100 &&
    mouseX <= (width/2) + 200 &&
    mouseY >= (height/2)- 100 && 
    mouseY <= (height/2) + 100 ){
      
      player.health = 3;// resets the players health
      level.timer = 0; // resets level timer
    }
    
  }
}
