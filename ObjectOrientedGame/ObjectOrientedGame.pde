// Object Varibles //
Player player; // initalizes the player
GameOverMenu gameOver; // initalizes the game over menu
MainMenu menu; // initalize the game menu
GameUI gameUI; // initalizes the game UI
ArrayList<Enemy> enemy = new ArrayList<Enemy>();// all enemys instances
boolean gameOverState = false; // current state of the game
boolean menuOn = true; // state for the menu screen
int highscore; // highscore value in the game
ArrayList<PointPickup> points = new ArrayList<PointPickup>(); // all points in the scene
void setup(){
  size(1500,750); // sets the screen size
  // initalizes objects created within scene //
 player = new Player(width/10, height /2.5); 
 enemy.add(new Enemy(1000,300,5));
 gameOver = new GameOverMenu();
 menu = new MainMenu();
 gameUI = new GameUI(highscore,player.health,player.dashTimer, player.dashCooldown);
}

void draw(){
  background(255);
  gameMenuCall(); // calls the game menu functions
  // checks if the menu is on
  if(!menuOn){
    //checks players health
    if(player.health >= 0){
      
      playerFunctionCall(); // calls the player functions
      bulletFuncitonCall(); // calls the bullet functions
      enemyFunctionCall(); // calls the enemy fucntions
      gameOverState = false; //sets gameover state to active
      gameUICall(); // calls the gameUI functions
      PointsCall(); // calls the points functions
    }
    // sets game over screen active if the player is dead
    else{
      gameOverState = true; //sets gameover state to deactive
      player.playerDead(); // sets player to inital position when they die
    }
  }
  else{
    menu.menuDisplay(); // displays the main menu
  }
}
// calls all the bullet funcitons for every bullet
void bulletFuncitonCall(){
  // loops over every player bullet and runs the bullet functions
  for(Bullet bullet : player.bullets){
    bullet.displayBullet(); // displays the bullets on the screen
    bullet.bulletMovement(); // preforms the movement for the bullet
  }
  // checks every bullet to see if it is still active
  for(int i = player.bullets.size() - 1; i > 0; i--){
    // condition checks the bullets position on screen and removes the bullet if its off screen or checks if the bullet is dead
   if(player.bullets.get(i).position.x > 1600 || player.bullets.get(i).bulletDead == true ){
     player.bullets.remove(i); // removes the bullet from the array
   }
  }
}

// calls all the player related functions //
void playerFunctionCall()
{
 player.playerDisplay(); // displays the player on the screen
 player.playerMovement(); // preforms the movement for the player
 // checks over each enemy instance
 for(int i = enemy.size() - 1;i >= 0; i--){
 player.playerCollision(enemy.get(i)); // preforms the collision detection for the player
 }
 // iterates over each point object
 for(int i = points.size() - 1;i >= 0; i--){
   //checks if the point is alive
   if(points.get(i).pointLife == true){
 player.pointCollision(points.get(i)); // checks for points collision on each point object
   }
   else{
     points.remove(i); // removes the points object
   }
 }
 player.playerPhysics();// preforms the physics for the player
 player.timers();// preforms calculatios for every timer in player
 
}
// calls all the functions for the games menus
void gameMenuCall(){
  menuOn = menu.menuActive;
  if(gameOverState == true){
    gameOver.gameOverDisplay();
  }
}

// calls all the enemy related functions
void enemyFunctionCall(){
  // iterates over every instance of an enemy
  for(int i = enemy.size() - 1;i >= 0; i--){
    Enemy e = enemy.get(i); // variable for the current enemy
  //checks if enemy is alive
  if(e.health > 0){
    e.enemyDisplay(); // calls the enemy display function
    e.enemyMovement(); // calls the eneny movement function
    //checks every bullet on screen
    for(Bullet bullet : player.bullets){
      e.enemyCollision(bullet); //checks each bullet if they hit the enemy
    }
  }
  else{
    points.add(new PointPickup(e.position.x,e.position.y,true,100)); // spawns points when enemy dies
    enemy.remove(i); // removes enemy from scene
  }
  }
}
// calls all of the point elements
void PointsCall(){
  // loops over every player point pickup
  for(PointPickup point : points){
    point.display(); // displays the visuals for the points
    point.physics(); // creates the physics for the points
  }
  // checks every bullet to see if it is still active
  for(int i = points.size() - 1; i > 0; i--){
    // condition checks the bullets position on screen and removes the bullet if its off screen or checks if the bullet is dead
   if(points.get(i).position.x < 100 || points.get(i).collected == true ){
     points.remove(i); // removes the point from the array
   }
  }
}
// calls all the game ui elements
void gameUICall(){
  gameUI.dashCooldown = player.dashTimer;
  gameUI.highscoreUIcalculator(); // calculator for the players score
  gameUI.display(); // displays all the game UI information
}
// detects if the player clicks the mouse
void mousePressed(){
  // checks if the game is over
  if(gameOverState == true){
    gameOver.menuCollision(player);// allows the player to click to restart
  }
  //checks if start menu is on
  if(menuOn == true){
    menu.menuCollision(player); // collision for the player menu button
  }
}

// calls input when pressed or over time when held down //
void keyPressed(){
  // chekcs first if the key is pressed //
  if(key == CODED){
    // input when right arrow is pressed //
    if(keyCode == RIGHT)
    {
       player.inputs[0] = true; // Sets right to true
    }
    // input when left arrow is pressed //
    if(keyCode == LEFT)
    {
       player.inputs[1] = true; // Sets left to true
    }
    // input when up arrow is pressed //
    if(keyCode == UP)
    {
       player.inputs[2] = true; // Sets up to true
    }
    // input when down arrow is pressed //
    if(keyCode == DOWN)
    {
       player.inputs[3] = true; // Sets down to true
    }
  }
  // input when z is pressed //
    if(key == 'z')
    {
       player.inputs[4] = true; // Sets z to true
       
    }
    // input when x is pressed //
    if(key == 'x')
    {
       player.inputs[5] = true; // Sets x to true
    }
}

// when input is relseaed //
void keyReleased(){
  // chekcs first if the key is coded //
   if(key == CODED)
   {
      // input when right arrow is clicked //
    if(keyCode == RIGHT)
    {
       player.inputs[0] = false; // Sets right to false
    }
    // input when left arrow is clicked //
    if(keyCode == LEFT)
    {
       player.inputs[1] = false; // Sets left to false
    }
    // input when up arrow is clicked //
    if(keyCode == UP)
    {
       player.inputs[2] = false; // Sets up to false
    }
    // input when down arrow is clicked //
    if(keyCode == DOWN)
    {
       player.inputs[3] = false; // Sets down to false
    }
   }
    // input when z is pressed //
    if(key == 'z')
    {
       player.inputs[4] = false; // Sets z to false
    }
    // input when x is pressed //
    if(key == 'x')
    {
       player.inputs[5] = false; // Sets x to false
    }
}
