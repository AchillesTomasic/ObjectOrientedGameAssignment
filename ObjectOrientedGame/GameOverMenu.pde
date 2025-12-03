class GameOverMenu{
  // image for the game over screen //
  PImage backgroundImage = loadImage("placeHolder.jpg"); // image for the background
  PImage restartImage = loadImage("placeHolder.jpg"); // image for the restart
  // displays the game over visuals
  void gameOverDisplay(){
    image(backgroundImage,0,0,width,height); // background image
    image(backgroundImage,(width/2 )- 100,(height/2) - 50,200,100); // button image
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
