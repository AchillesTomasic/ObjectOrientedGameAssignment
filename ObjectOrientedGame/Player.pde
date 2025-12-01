class Player{
  // input vairble //
  boolean[] inputs = new boolean[6];// array for different variables | 0 = Right, 1 = Left, 2 = Up, 3 = Down, 4 = Z/"Shoot key",  |
  // player collision //
  int playerWidth = 130; // width for the player collider
  int playerHeight = 130; // height for the player collider
  // player health variables //
  int health = 0; // player health 
  int healthTimer; // timer for hit timer
  int healthCooldown = 30; // cooldown timer between hits
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
   int dashAcc = 40; // acceleration for the dash
   int dashTimer; // timer counts for dash
   int dashCooldown = 200; // max times value for the dash
   // Start position of player //
   PVector initalPos = new PVector(); // sets inital position of the player
   

  /// player constructor
  Player(float posX,float posY){
    position.x = posX; // sets the x pos for the player 
    position.y = posY; // sets the y pos for the player
    initalPos.x = position.x; // sets the inital position of the player x
    initalPos.y = position.y; // sets the inital position of the player y
  }
  // displays the player visuals
  void playerDisplay()
  {
    stroke(0,255,0); // debug colour
    rect(position.x,position.y,playerWidth,playerHeight);
    
  }
  // repositions the player if they die
  void playerDead(){
    // checks if the player dies
    if(health <= 0){
      position.x = initalPos.x; // resets player pos x
      position.y = initalPos.y; // resets player pos y
    }
  }
  // creates the collision detection for the player
  void playerCollision(Enemy enemy)
  {
    // collision detection for enemies //
    // checks health timer value
    if(healthTimer < 0 ){
    // detects if the player is in the enemy hitbox
    if(enemy.position.x >= position.x &&
    enemy.position.x <= position.x + playerWidth &&
    enemy.position.y >= position.y && 
    enemy.position.y <= position.y + playerHeight){
      health -= 1; // reduces the player health
      healthTimer = healthCooldown; // resets health timer
    }
    }
  }
  // collision detection for the boundaries of the screen //
  void boundaryCollision(){   
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
  // collision for the points
  void pointCollision(PointPickup points){
    // checks if a bullet enters the enemys collision box
    if(points.position.x >= position.x &&
       points.position.x <= position.x + playerWidth &&
       points.position.y >= position.y &&
       points.position.y <= position.y + playerHeight){
      highscore += points.pointValue; // changes the highscore value
      points.pointLife = false; // turns points alive to false
    }
  }
  // timer counts for all timers in project
  void timers(){
    bulletTimer -= 1; // ensures the timer is consistantly active for the player bullets
    dashTimer -= 1; // ensures the timer is consistantly active for the player dash
    healthTimer -= 1; // ensures the timer is consistantly active for the player health
    
    // resets timers if they get too high that they exceed the int limit //
    if(bulletTimer < -10000){
      bulletTimer = -1; //resets timer below input time
    }
    if(dashTimer < -1){
      dashTimer = -1;//resets timer below input time
    }
    if(healthTimer < -10000){
      bulletTimer = -1;//resets timer below input time
    }
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
      acceleration.x -= 20; // reduces acceleration if pushed left
    }
    if(acceleration.x < 0){
      acceleration.x += 20; // reduces acceleration if pushed right
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
