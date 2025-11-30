class Player{
  // input vairble //
  boolean[] inputs = new boolean[5];// array for different variables | 0 = Right, 1 = Left, 2 = Up, 3 = Down, 4 = Z/"Shoot key",  |
  
  // player movement variables //
    PVector position = new PVector(); // initalizes the position vectors for the player
    PVector velocity = new PVector(); // initalizes the velocity vectors for the player
    PVector acceleration = new PVector(); // initalizes the accleration vectors for the player
    float moveSpeed = 7;// initalizes speed of the player
   // attack variables //
   ArrayList<Bullet> bullets = new ArrayList<Bullet>();
   int bulletTimer; // timer for bullet
   int bulletCooldown = 10; // max timer value for bullet
   boolean canShoot = true;

  /// player constructor
  Player(float posX,float posY){
    position.x = posX; // sets the x pos for the player 
    position.y = posY; // sets the y pos for the player
  }
  // displays the player visuals
  void playerDisplay()
  {
    stroke(0,255,0); // debug colour
    rect(position.x,position.y,130,130);
    
  }
  
  // timer for shooting bullets out of the player
  void shootTimer(){
    if(bulletTimer < 0){
      bullets.add(new Bullet(position.x, position.y));
      bulletTimer =  bulletCooldown;
    }
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
     // input when z is pressed //
     if(inputs[4] == true && canShoot == true) {
       shootTimer();
     }
  }
  
  
}
