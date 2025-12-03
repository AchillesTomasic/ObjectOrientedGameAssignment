class MainMenu{
    // image for the game over screen //
  PImage backgroundImage = loadImage("placeHolder.jpg"); // image for the background
  PImage playImage = loadImage("placeHolder.jpg"); // image for the play
  // sets active //
  boolean menuActive = true; // detects if the menu is on
  // displays the game over visuals
  void menuDisplay(){
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
      menuActive = false; // turns off the menu
      player.health = 3;// resets the players health
    }
  }
}
