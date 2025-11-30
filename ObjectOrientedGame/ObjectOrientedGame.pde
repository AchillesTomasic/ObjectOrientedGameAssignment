// Object Varibles //
Player player; // initalizes the player
GameOverMenu gameOver; // initalizes the game over menu
MainMenu menu; // initalize the game menu
GameUI gameUI; // initalizes the game UI
Enemy enemy; //test
boolean gameOverState = false; // current state of the game
boolean menuOn = true; // state for the menu screen
void setup(){
  size(1500,750); // sets the screen size
  // initalizes objects created within scene //
 player = new Player(width/10, height /2.5); 
 enemy = new Enemy(1000,300,5);
 gameOver = new GameOverMenu();
 menu = new MainMenu();
 gameUI = new GameUI(93025,3);
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
  //checks if the players health is above 0
  
 player.playerDisplay(); // displays the player on the screen
 player.playerMovement(); // preforms the movement for the player
 player.playerCollision(enemy); // preforms the collision detection for the player
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
  //checks if enemy is alive
  if(enemy.health > 0){
    enemy.enemyDisplay(); // calls the enemy display function
    enemy.enemyMovement(); // calls the eneny movement function
    //checks every bullet on screen
    for(Bullet bullet : player.bullets){
      enemy.enemyCollision(bullet); //checks each bullet if they hit the enemy
    }
  }
  else{
    
  }
}
// calls all the game ui elements
void gameUICall(){
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
