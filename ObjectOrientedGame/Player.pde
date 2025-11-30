class Player{
  // input vairble //
  boolean[] inputs = new boolean[6];// array for different variables | 0 = Right, 1 = Left, 2 = Up, 3 = Down, 4 = Z/"Shoot key",  |
  // player collision //
  int playerWidth = 130; // width for the player collider
  int playerHeight = 130; // height for the player collider
  // player movement variables //
    PVector position = new PVector(); // initalizes the position vectors for the player
    PVector velocity = new PVector(); // initalizes the velocity vectors for the player
    PVector acceleration = new PVector(); // initalizes the accleration vectors for the player
    float moveSpeed = 7;// initalizes speed of the player
   // attack variables //
   ArrayList<Bullet> bullets = new ArrayList<Bullet>();
   int bulletTimer; // timer counts for bullet
   int bulletCooldown = 10; // max timer value for bullet
   // Dash Variables //
   int dashAcc = 20; // acceleration for the dash
   int dashTimer; // timer counts for dash
   int dashCooldown = 30; // max times value for the dash

  /// player constructor
  Player(float posX,float posY){
    position.x = posX; // sets the x pos for the player 
    position.y = posY; // sets the y pos for the player
  }
  // displays the player visuals
  void playerDisplay()
  {
    stroke(0,255,0); // debug colour
    rect(position.x,position.y,playerWidth,playerHeight);
    
  }
  // creates the collision detection for the player
  void collision()
  {
    // detects colision along the x on the left
    if(position.x <= 0){ position.x = 0;}
    // detects colision along the x on the right
    if(position.x + playerWidth >= width){ position.x = width - playerWidth;}
    // detects colision along the y for the top
    if(position.y <= 0){ position.y = 0;}
    // detects colision along the y for the bottom
    if(position.y + playerHeight >= height){ position.y = height - playerHeight;}
  }
  // timer for shooting bullets out of the player
  void shootTimer()
  {
    //checks if the timer is complete
    if(bulletTimer < 0){
      bullets.add(new Bullet(position.x + playerWidth, position.y + (playerHeight/2))); // spawns a bullet object
      bulletTimer = bulletCooldown;
    }
  }
  // timer counts for all timers in project
  void timers(){
    player.bulletTimer -= 1; // ensures the timer is consistantly active for the player bullets
    player.dashTimer -= 1; // ensures the timer is consistantly active for the player dash
  }
  // player dash ability function
  void playerDash(){
    if(dashTimer < 0){
    //player is holding back button
    if(acceleration.x == 0 && inputs[1] == true){
      acceleration.x = -dashAcc; // pushes the player backwards by setting acceleration
    }
    //when player is standing idle or moving forward
    else if(acceleration.x == 0){
      acceleration.x = dashAcc;// pushes the player forwards by setting acceleration
    }
    dashTimer = dashCooldown; // resets timer to max time
    }
    
  }
  // functions calcualte the physics for the player
  void playerPhysics(){
         // player physics calculations x //
     position.x += velocity.x; // changes possiton based on velocity
     velocity.x += acceleration.x; // changes velocity based on acceleration
    // player physics calculations y //
     position.y += velocity.y; // changes possiton based on velocity
     velocity.y += acceleration.y; // changes velocity based on acceleration
     // shifts acceleration back to when it changes //
     if(acceleration.x > 0){
      acceleration.x -= 10; // reduces acceleration if pushed left
    }
    if(acceleration.x < 0){
      acceleration.x += 10; // reduces acceleration if pushed right
    }
     // shifts velocity back to when it changes //
     if(velocity.x > 0){
      velocity.x -= 5; // reduces velocity if pushed left
    }
    if(velocity.x < 0){
      velocity.x += 5; // reduces velocity if pushed right
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
     if(inputs[4] == true) {
       shootTimer();
     }
     // input when x is pressed //
     if(inputs[5] == true) {
       playerDash();
     }
  }
  
  
}
