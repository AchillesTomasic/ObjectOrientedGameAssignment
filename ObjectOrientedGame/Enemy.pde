class Enemy{
  // movement vairables for the enemy //
  PVector position = new PVector(); //initalizes the enemy position
  PVector velocity = new PVector(); //initalizes the enemy velocity
  PVector acceleration = new PVector(); // initalizes the enemyh acceleration
  //enemy constructor
  Enemy(float posX,float posY){
    position.x = posX; // sets the x pos for the enemy
    position.y = posY; // sets the y pos for the enemy
  }
  
}
