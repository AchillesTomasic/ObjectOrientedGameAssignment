class GameUI{
  // variables for the changing UI elements //
  int highscore; // highscore value for the UI element
  int health; // health value for the UI element
  int[] scoreValue = new int[8]; // value for each score space displayed
  
  // constructor for the game UI
  GameUI(int hs,int hp){
    highscore = hs; // initalizes the players highscore
    health = hp; // initalizes the players health
  }
  // displays all of the UI elements on screen
  void display(){
    
  }
  // calculates the highscore value for the UI
  void highscoreUIcalculator(){
    int temp = highscore; // copy of the highscore value
    for(int i = scoreValue.length - 1; i >= 0; i--){
      scoreValue[i] = temp % 10; // modulates the number to get that number value
      temp /= 10; // removes a number from the list
    }
    
  }
  
}
