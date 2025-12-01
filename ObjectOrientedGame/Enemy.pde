class Enemy{
  // movement vairables for the enemy //
  PVector position = new PVector(); //initalizes the enemy position
  PVector velocity = new PVector(); //initalizes the enemy velocity
  PVector acceleration = new PVector(); // initalizes the enemyh acceleration
  // enemy collision //
  int enemyWidth = 80; // width for the enemy collider
  int enemyHeight = 80; // height for the enemy collider
  // enemy health variables //
  int health; // enemy health value
  // enemy explosion 
  boolean explodeFin = false; // boolean to checks if the animation finished
  int explodeTimer = 30; // timer for explosion
  //enemy constructor
  Enemy(float posX,float posY, int hp){
    position.x = posX; // sets the x pos for the enemy
    position.y = posY; // sets the y pos for the enemy
    health = hp; //sets the enemy health
  }
  
  // display for the enemy character
  void enemyDisplay(){
    // checks if the enemy is alive
    if(health > 1){
    rect(position.x,position.y,50,50);
    }
    else{
      rect(position.x - 20,position.y - 20,70,70);
    }
  }
  // detects enemy collision
  void enemyCollision(Bullet bullet){
    // checks if a bullet enters the enemys collision box
    if(bullet.position.x >= position.x &&
       bullet.position.x <= position.x + enemyWidth &&
       bullet.position.y >= position.y &&
       bullet.position.y <= position.y + enemyHeight){
      health -= 1; // reduces the enemy health
      bullet.bulletDead = true; // turns bullet off
    }
  }
  
  // movement code for the enemy 
  void enemyMovement(){
    // checks if the player is alive
    if(health > 0){
    position.x -= 1; // moves the player
    }
  }
}
