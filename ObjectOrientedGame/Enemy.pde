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
  //enemy constructor
  Enemy(float posX,float posY, int hp){
    position.x = posX; // sets the x pos for the enemy
    position.y = posY; // sets the y pos for the enemy
    health = hp; //sets the enemy health
  }
  
  // display for the enemy character
  void enemyDisplay(){
    rect(position.x,position.y,50,50);
  }
  // detects enemy collision
  void enemyCollision(Bullet bullet){
    // checks if a bullet enters the enemys collision box
    if(bullet.position.x >= position.x &&
       bullet.position.x <= position.x + enemyWidth &&
       bullet.position.y >= position.y &&
       bullet.position.y <= position.y + enemyHeight){
      health -= 1; // reduces the enemy health
      bullet.bulletDead = true;
    }
  }
  
  // movement code for the enemy 
  void enemyMovement(){
    position.x -= 1;
  }
}
