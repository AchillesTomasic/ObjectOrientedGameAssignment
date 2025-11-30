class GameUI{
  // variables for the changing UI elements //
  int highscore; // highscore value for the UI element
  int health; // health value for the UI element
  int[] scoreValue = new int[8]; // value for each score space displayed
  // used for UI image sizes
  PVector scoreImagePos = new PVector(width - 100,50); // positions for the highscore images
  
  // constructor for the game UI
  GameUI(int hs,int hp){
    highscore = hs; // initalizes the players highscore
    health = hp; // initalizes the players health
  }
  // displays all of the UI elements on screen
  void display(){
    highscoreLoop();
  }
  // loops each number instance and draws that number
  void highscoreLoop(){
    // temporary values for assigning the score //
    float tempX = scoreImagePos.x; // temporary x scorePos
    float tempY = scoreImagePos.y; // temporary y scorePos
    
    // loops over each intsance of the score
    for(int i = scoreValue.length - 1; i >= 0; i--){
      highscoreImageSel(scoreValue[i],tempX,tempY); // used for select what image the highscore uses
      tempX -= 50; // moves the value back a space
    }
  }
  // used for deciding which image to use on the highscore UI
  void highscoreImageSel(int numbVal, float posX,float posY){
    // image for number 9
    if(numbVal == 9){
      rect(posX,posY,40,60);
    }
    // image for number 8
    else if(numbVal == 8){
      rect(posX,posY,40,60);
    }
    // image for number 7
    else if(numbVal == 7){
      rect(posX,posY,40,60);
    }
    // image for number 6
    else if(numbVal == 6){
      rect(posX,posY,40,60);
    }
    // image for number 5
    else if(numbVal == 5){
      rect(posX,posY,40,60);
    }
    // image for number 4
    else if(numbVal == 4){
      rect(posX,posY,40,60);
    }
    // image for number 3
    else if(numbVal == 3){
      rect(posX,posY,40,60);
    }
    // image for number 2
    else if(numbVal == 2){
      rect(posX,posY,40,60);
    }
    // image for number 1
    else if(numbVal == 1){
      rect(posX,posY,40,60);
    }
    // image for number 0 or any other number that appears
    else{
      rect(posX,posY,40,60);
    }
  }
  // calculates the highscore value for the UI
  void highscoreUIcalculator(){
    int temp = highscore; // copy of the highscore value
    // loops over each score instance
    for(int i = scoreValue.length - 1; i >= 0; i--){
      scoreValue[i] = temp % 10; // modulates the number to get that number value
      temp /= 10; // removes a number from the list
    }  
  }
  
}
