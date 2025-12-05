class MainMenu{
  // sounds for menu //
  SoundFile startSFX; // sound for start
  // image for the game over screen //
  PImage backgroundImage = loadImage("Background.jpg"); // image for the background
  PImage titleImage = loadImage("title.png"); // image for the title
  PImage titlePlayerImage = loadImage("titleChar.png"); // image for the title
  PImage playImage = loadImage("play.png"); // image for the play
  // sets active //
  boolean menuActive = true; // detects if the menu is on
  // main menu constructor //
  MainMenu(){
    startSFX = new SoundFile(ObjectOrientedGame.this, "start.wav"); // initalizes the sound
  }
  // displays the game over visuals
  void menuDisplay(){
    image(backgroundImage,0,0,width,height); // background image
    image(titlePlayerImage,0,0,750,height); // image for char on title screen
    image(titleImage,(width/2 ),(height/2) - 350,700,400); // image title
    image(playImage,(width/2 ),(height/2) + 50 ,600,300); // button image
  }
  //create the menu collision for the buttons
  void menuCollision(Player player){
    // detects if the mouse is inside the button frame
    if(mouseX >= (width/2) &&
    mouseX <= (width/2) + 600 &&
    mouseY >= (height/2)+ 50 && 
    mouseY <= (height/2) + 350 ){
      menuActive = false; // turns off the menu
      startSFX.play(); // plays start sound
      player.health = 3;// resets the players health
    }
  }
}
