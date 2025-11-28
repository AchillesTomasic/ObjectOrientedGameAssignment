class Player{
  // input vairble //
  boolean[] inputs = new boolean[4];// array for different variables | 0 = Right, 1 = Left, 2 = Up, 3 = Down |
  
  // player movement variables //
    PVector position = new PVector(); // initalizes the position vectors for the player
    PVector velocity = new PVector(); // initalizes the velocity vectors for the player
    PVector acceleration = new PVector(); // initalizes the accleration vectors for the player
    float moveSpeed = 5;// initalizes speed of the player
   // //

  /// player constructor
  void Player(){
    
  }
  // displays the player visuals
  void playerDisplay()
  {
    rect(position.x,position.y,30,30);
    
  }
  // moves the player across the screen
  void playerMovement()
  {
     // input when right arrow is clicked //
     if(inputs[0] == true) {
       position.x += moveSpeed; // moves player right
     }
      // input when left arrow is clicked //
     if(inputs[1] == true) {
       position.x -= moveSpeed; // moves player left
     }
      // input when up arrow is clicked //
     if(inputs[2] == true) {
       position.y -= moveSpeed;// moves player up
     }
     // input when down arrow is clicked //
     if(inputs[3] == true) {
       position.y += moveSpeed; // moves player down
     }
  }
  
  
}
