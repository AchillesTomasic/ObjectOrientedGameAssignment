class GameUI{
  // images for the ui //
  PImage dashbarImage = loadImage("placeHolder.jpg"); // image for the dash
  PImage[] livesImage; // list for the images in lives
  PImage[] highscoreImage; // list for the images highscore
  // variables for the changing UI elements //
  int highscore; // highscore value for the UI element
  int health; // health value for the UI element
  float dashCooldown; // dashCooldown Value for the game
  float dashMaxCooldown; // max value for the cooldown dash
  int[] scoreValue = new int[8]; // value for each score space displayed
  // used for UI image sizes //
  PVector scoreImagePos = new PVector(width - 100,50); // positions for the highscore images
  float barX; //x value for the recharge bar position
  PVector dashBarPos = new PVector(400,height - 100); //sets the dash bar position
  
  // constructor for the game UI
  GameUI(int hs,int hp,float dashCool,float dashMax){
    highscore = hs; // initalizes the players highscore UI value
    health = hp; // initalizes the players health UI value
    dashCooldown = dashCool; // initalizes the players cooldown UI value
    dashMaxCooldown = dashMax; // initalizes the players max cooldown time
    // initalizes image array // 
    livesImage = new PImage[4];// initalizes array
    // loops through every image for the lives
    for(int i = 0;i < livesImage.length; i++){
      livesImage[i] = loadImage("score" + i +".png"); // image for the lives
    }
    highscoreImage = new PImage[10];// initalizes array
    // loops through every image for the highscore
    for(int i = 0;i < highscoreImage.length; i++){
      highscoreImage[i] = loadImage("score" + i +".png"); // image for the highscore
    }
  }
  // displays all of the UI elements on screen
  void display(){
    highscoreLoop(); //creates the visuals for the highscore
    livesImage(50,50); // changes the image on the lives counter
    dashbarUI(); // changes the bar value for the dashUI and creates visuals for dashUI
  }
  // creates the visuals for the dash UI icon
  void dashbarUI(){
    barX = dashCooldown; // sets a temporary value for the dash cooldown
    float tempX = map(barX,dashMaxCooldown, 0,0,-300); // remaps the bar so that the position continuously moves
    image(dashbarImage,dashBarPos.x,dashBarPos.y,tempX,40);
  }
  // chooses which lives image to add
  void livesImage(int posX, int posY){
    // checks the health value and chooses image based on value //
    // if health is 3
    if(health == 3){
      image(livesImage[3],posX,posY,50,50); // health image 3 lives
    }
    // if health is 2
    else if(health == 2){
      image(livesImage[2],posX,posY,50,50); // health image 2 lives
    }
    // if health is 1
    else if(health == 1){
      image(livesImage[1],posX,posY,50,50); // health image 1 lives
    }
    // if health is 0 or any other value
    else{
      image(livesImage[0],posX,posY,50,50); // health image 0 lives
    }
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
      image(highscoreImage[9],posX,posY,40,60); // highscore image 9 
    }
    // image for number 8
    else if(numbVal == 8){
      image(highscoreImage[8],posX,posY,40,60); // highscore image 8
    }
    // image for number 7
    else if(numbVal == 7){
      image(highscoreImage[7],posX,posY,40,60); // highscore image 7
    }
    // image for number 6
    else if(numbVal == 6){
      image(highscoreImage[6],posX,posY,40,60); // highscore image 6
    }
    // image for number 5
    else if(numbVal == 5){
      image(highscoreImage[5],posX,posY,40,60); // highscore image 5
    }
    // image for number 4
    else if(numbVal == 4){
      image(highscoreImage[4],posX,posY,40,60); // highscore image 4
    }
    // image for number 3
    else if(numbVal == 3){
      image(highscoreImage[3],posX,posY,40,60); // highscore image 3
    }
    // image for number 2
    else if(numbVal == 2){
      image(highscoreImage[2],posX,posY,40,60); // highscore image 2
    }
    // image for number 1
    else if(numbVal == 1){
      image(highscoreImage[1],posX,posY,40,60); // highscore image 1
    }
    // image for number 0 or any other number that appears
    else{
      image(highscoreImage[0],posX,posY,40,60); // highscore image 0
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
